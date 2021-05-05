require 'net/http'

def get_from(url)
  Net::HTTP.get(URI(url))
end

def write_file(path, text)
  file = File.open('path', 'w')
  file.write(text)
  file.close
end

html = get_from('https://masayuki14.github.io/pit-news/')
# url = 'https://masayuki14.github.io/pit-news/'
# uri = URI(url)
# html = Net::HTTP.get(uri)

write_file('pitnews.html', html)
# file = File.open('pitnews.html', 'w')
# file.write(html)
# file.close
