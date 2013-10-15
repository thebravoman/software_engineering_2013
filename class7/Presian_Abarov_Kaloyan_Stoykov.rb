#!/usr/bin/ruby

def isint(str)
	return !!(str =~ /^[-+]?[1-9]([0-9]*)?$/)
end

structure = Hash.new([])

i = 1
File.open(ARGV[0]).each do |line|
	if line =~ /-->/
		strips = []
		strips << line[0..12].to_s.strip
		strips << line[17..-1].to_s.strip
		structure[i.to_s] = strips
	elsif isint(line)
		i += 1
		next
	else
		structure[i.to_s] << line
	end
end


file = []
structure.each do |key, value|
	
end