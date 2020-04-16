require 'rubygems'
require 'nokogiri' 
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   

crypto_name_array = []
page.xpath('/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div').each do |tr|
    crypto_name_array << tr.text
end 

crypto_values_array = []
page.xpath('/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a').each do |tr|
  crypto_values_array << tr.text
end 

result = Hash.new
crypto_name_array.each_with_index do |i, index|
  result[i] = crypto_values_array[index]
end

puts result
