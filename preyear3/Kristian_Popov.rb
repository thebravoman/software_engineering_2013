file = File.open(ARGV[0], "r")

line_old=''
while line = file.gets
  if not(line.to_i==0) and (line_old=="\n") then
  i=line.to_i
  end
  line_old=line
end

puts i

file.close
