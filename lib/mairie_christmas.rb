require 'rubygems'
require 'nokogiri' 
require 'open-uri'

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(open(townhall_url))
  email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
  email.text
end

def get_townhall_urls
  page = Nokogiri::HTML(open'https://www.annuaire-des-mairies.com/val-d-oise.html')
  townall_urls = page.xpath('//a[@class="lientxt"]')
  townall_urls.map { |n| n['href'] }
end

def main
  ???
end
 
