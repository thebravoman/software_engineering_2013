i = 1
File.open(ARGV[0]).each { |line| i += (line.to_i == i) ? 1 : 0 }
puts i-1