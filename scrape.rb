require 'net/http'

def get_from(url)
  Net::HTTP.get(URI(url))
end

def write_file(path, text)
  # file = File.open('path', 'w')
  # file.write(text)
  # file.close
  File.open(path, 'w') { |file| file.write(text) }
end

# html = get_from('https://masayuki14.github.io/pit-news/')
# url = 'https://masayuki14.github.io/pit-news/'
# uri = URI(url)
# html = Net::HTTP.get(uri)

write_file('pitnews.html', get_from('https://masayuki14.github.io/pit-news/'))
# file = File.open('pitnews.html', 'w')
# file.write(html)
# file.close


require 'nokogiri'

html = File.open('pitnews.html', 'r') {|f| f.read }
doc = Nokogiri::HTML.parse(html, nil, 'utf-8')
# //h6はルートノード以下の全てのh6要素を取得
# nodes = doc.xpath('//h6')
# sectionタグの要素を取得
section = doc.xpath('/html/body/main/section[2]').first
# カテゴリー名の取得
# category = section.xpath('./h6').first.text

contents = {category: nil, news: []}
contents[:category] = section.xpath('./h6').first.text
section.xpath('./div/div').each do |node|
  # ニュースタイトル取得
  title = node.xpath('./p/strong/a').first.text
  # ニュースURL取得
  url = node.xpath('./p/strong/a').first['href']

  # 取得したデータを保存するhashオブジェクトをcontensに代入
  news = {title: title, url: url}
  contents[:news] << news
end

pp contents
