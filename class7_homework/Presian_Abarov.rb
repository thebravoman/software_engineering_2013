#!/usr/bin/ruby

require 'time'

def isint(str)
	return !!(str =~ /^[-+]?[1-9]([0-9]*)?$/)
end

structure = Hash.new([])

i = 1
File.open(ARGV[0]).each do |line|
	if line =~ /-->/
		strips = [line[0..12].to_s.strip, line[17..-1].to_s.strip]
		structure[i] = strips
	elsif isint(line)
		i = line.to_i
		next
	else
		structure[i] << line
	end
end

File.open("Presian_Abarov.txt", "w") do |file|
	structure.each do |key, value|
		file << structure[key][2]#.gsub(/\n/, ' ') WHATS THE FORMAT 
		break if structure[key+1][0].nil?
		if Time.parse(structure[key+1][0]) - Time.parse(structure[key][1]) >= 3
			file << "\n"
		end
	end
end