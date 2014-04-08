message = ARGV[1].to_i
n = ARGV[2].to_i

if ARGV[0].to_i == 1
  e = ARGV[3].to_i
  puts message**e % n
else
  d = ARGV[3].to_i
  puts message**d % n
end
