require 'net/http'
require 'uri'
require 'json'

#uri = URI.parse('http://api.e-stat.go.jp/rest/1.0/app/json')
statsCode = "0000030003"

opt="&cdCat04From=000&cdCat04To=001"

key = "xxxxxxxx"
url = "http://api.e-stat.go.jp/rest/1.0/app/json"
uri = URI.parse("#{url}/getStatsData?appId=#{key}&statsDataId=#{statsCode}#{opt}")

https = Net::HTTP.new(uri.host, uri.port)
https.use_ssl = false

res = https.start {
  https.get(uri.request_uri)
}

result=""
if res.code == '200'
  result = JSON.parse(res.body)

else
#puts "OMG!! #{res.code} #{res.message}"
end

puts "#{res.code} #{result}"


#統計表情報取得
#http://api.e-stat.go.jp/rest/1.0/app/getStatsList?appId=xxxxxxxx&statsCode=00200&searchWord='国勢調査'

#http://api.e-stat.go.jp/rest/1.0/app/getStatsList?appId=xxxxxxxx&statsCode=00200521

#メタ情報取り出し
#http://api.e-stat.go.jp/rest/1.0/app/getMetaInfo?appId=xxxxxxxx&statsDataId=0000030003

#統計データ取得
# http://api.e-stat.go.jp/rest/1.0/app/getStatsData?appId=xxxxxxxx&statsDataId=0000030003&cdCat04From=000&cdCat04To=001