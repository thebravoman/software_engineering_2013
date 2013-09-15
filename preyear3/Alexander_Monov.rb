#!/usr/bin/ruby

c = 0
f = File.open(ARGV[0]).each do |line|
if line =~ /-->/
    c += 1
end
end

f.close
puts c