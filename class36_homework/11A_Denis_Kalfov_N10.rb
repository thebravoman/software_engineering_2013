class Numeric
  Alph = ("a".."z").to_a
  def alph
    s, q = "", self
    (q, r = (q - 1).divmod(26)) && s.prepend(Alph[r]) until q.zero?
    s
  end
end
#--------------------------------------------------------------------
puts
print "Enter message [ Example: '0981 0461' ]: " #Space after each 4 symbols!
m=gets.chomp().to_s

print "Enter n: [Example: '2537' ]: "
n=gets.chomp().to_i

print "Enter d [Example '937' ]: "
d=gets.chomp().to_i


puts "Message: "
puts
m.split(" ").each do |c| 


p=((c.to_i)**d) % n

	if ((Math.log10(p).to_i+1) % 2 == 0) #==4 #Example 1115
		p.to_s.scan(/../).map {|e| print "#{(e.to_i+1).alph}" }
	
	else # Example 704, must be 0704
		null="0"
		null << p.to_s

		null.to_s.scan(/../).map {|e| print "#{(e.to_i+1).alph}" }

	end


end
puts

