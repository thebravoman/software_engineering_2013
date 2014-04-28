print "Molq vuvedete message: "
sm=gets.chomp()
print "Molq izberete 'c' ili 'd': "
choice=gets.chomp()
print "Molq vuvedete n: "
n=gets.chomp().to_i
if choice=='c'
	print "Molq vuvedete e: "
elsif choice=='d'
	print "Molq vuvedete d: "
else
	puts "Wrong choice!"
end
de=gets.chomp().to_i

if choice=='c'
	cmd=""
	sm.split("").each do |char|
		cmd+=((char.ord**de)%n).to_s+'a'
	end
elsif choice=='d'
	cmd=""
	sm.split('a').each do |char|
		cmd+=((char.to_i**de)%n).chr
	end
end
puts cmd
