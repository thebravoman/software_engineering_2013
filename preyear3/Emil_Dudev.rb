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
# Reply: Yes, the program will work fine without the reference to the file.
# The reference is not crucial to the program.
#####Yet if it's removed, I think the file descriptor will remain open
#####until the execution ends, in which case either Ruby or the OS will take care of it.
# I take that back after reviewing the docs
# <<I/O streams are automatically closed when they are claimed by the garbage collector.>>
# by http://www.ruby-doc.org/core-2.0.0/IO.html#method-i-close
# So the GC will take care of the open file when the script exits.
f.close
puts c

