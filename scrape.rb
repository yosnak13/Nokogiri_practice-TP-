require 'net/http'

def get_from(url)
  Net::HTTP.get(URI(url))
end

html = get_from('https://masayuki14.github.io/pit-news/')

file = File.open('pitnews.html', 'w')
file.write(html)
file.close
