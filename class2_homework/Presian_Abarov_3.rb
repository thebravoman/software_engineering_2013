#!/usr/bin/ruby

require 'csv'

dict = Hash.new(0.0)
dict[""] = 0.0

CSV.foreach('bank.csv') do |row|
	dict[row[0]] += row[1].to_f
end

biggest = 0.0
biggestKey = ""
dict.each do |key,value|
	if biggest < value
		biggest = value
		biggestKey = key	
	end
end

puts biggestKey
