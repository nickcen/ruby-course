require 'watir'

browser = Watir::Browser.new

browser.goto 'baidu.com'

puts browser.title
browser.close