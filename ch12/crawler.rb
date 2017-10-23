require 'faraday'
require 'faraday-cookie_jar'
require 'nokogiri'
require 'faraday-manual-cache'
require 'active_support/all'
require './page_worker.rb'

conn = Faraday.new(url: 'http://www.dianping.com') do |builder|
  builder.use :cookie_jar
  builder.use :manual_cache
  builder.adapter Faraday.default_adapter
end

def parse_list_page(conn, url)
  response = conn.get url do |req|
    req.headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36'
  end
  content = response.body

  doc = Nokogiri::HTML(content)
  doc.css('div.tit > a:first').map do |a|
    a['href']
  end
end


links = parse_list_page(conn, '/search/keyword/2/10_%E5%8C%97%E4%BA%A4%E5%A4%A7')
links.each do |link|
  PageWorker.perform_async(link)
end