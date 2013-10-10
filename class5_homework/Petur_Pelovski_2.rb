require 'time'
array = Array.[]
broqch = 0
File.open(ARGV[0], 'r') do |f1|  
	while line = f1.gets  
		i = 0
		line.each_char do |r|
			if r == '-'
				i = 1
			end
			if i == 1
				if r == '>'
					array[broqch] = line.split("--> ").first
					broqch = broqch + 1
					array[broqch] = line.split("--> ").last
					i = 0
				end
			end
		end
	end
purvo = array [0]
posledno = array[broqch]
purvo = purvo.split(",").first
posledno = posledno.split(",").first
vreme1 = Time.parse(purvo)
vreme2 = Time.parse(posledno)
vreme = vreme2 - vreme1
vreme = vreme.to_i
puts vreme*1000000000
end
