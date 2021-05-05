#(path, mode): pathにはファイルのパスを文字列で、
# modeにはモードを文字列で指定。rは読み読み込みモードで開き、wは書き込みモードで開く
# file = File.open('scrape.rb', 'r')
# puts file.read
# file.close
file = File.open('hello.txt', 'w')
file.write('Hello World.')
file.close
