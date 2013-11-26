require 'rubygems'
require 'nokogiri'
require 'open-uri'
#program is retarded, just playing around with nokogiri
doc = Nokogiri::HTML(open("https://googledrive.com/host/0B-UYK7_kT9FlTkVmQng1eE8tUjA/final.html"))
doc.remove_namespaces!
a = doc.css("pre").text                       #イボさん, ありがとうございました!
a.gsub!("chart.svg","Martin_Stoyanov.svg")
File.open("temp.rb", "wb") do |f|
	f.write(a)
end
`ruby temp.rb data.csv`
`rm temp.rb`



