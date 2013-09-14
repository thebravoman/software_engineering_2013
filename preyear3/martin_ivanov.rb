sum = 0
pattern = /-->/
name = ARGV[0]
f1 =File.open("#{name}", "r")


f1.each do |line|
  sum = sum + 1 if line =~ pattern
end

puts "The subtitles are : #{sum}"

