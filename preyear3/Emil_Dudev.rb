#!/usr/bin/ruby

c = 0
f = File.open(ARGV[0]).each do |line|
	c += 1 if line =~ /^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/
end
# Q1: Is closing neccessary in Ruby and in the above code?
# Reply: The file is still open. Simple check:
# puts f.closed?
# If the block was opened as File.open(ARGV[0]) do |f| ...
# then it wouldn't be necessary to close it (actually, closing it might cause an error).
# I can only guess that if the file is left open, Ruby will automatically close it upon exit.
# Nevertheless I wrote the code and it's my responsibility to free the resources I've created.
# Also, the garbage collector shouldn't touch the file while it's open.
# 
# Q2: Is the f reference really needed in this program. 
# Can the program work if we remove it and along with it remove the closing?
f.close
puts c

