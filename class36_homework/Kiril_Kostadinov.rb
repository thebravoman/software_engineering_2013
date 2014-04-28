message = ARGV[1]
n = ARGV[2].to_i

if ARGV[0].to_i == 1
  e = ARGV[3].to_i
  message.split("").each do |c|
    print (c.ord**e % n).to_s.rjust(n.to_s.length, '0')
  end
  puts
else
  d = ARGV[3].to_i
  message.scan(/.{#{n.to_s.length}}/).each do |c|
    print (c.to_i**d % n).chr
  end
  puts
end
