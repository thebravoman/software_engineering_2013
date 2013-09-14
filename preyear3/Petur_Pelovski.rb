srtfilename = ""
ARGV.each do|a|
  srtfilename = a
end
File.open(srtfilename, 'r') do |file|  
	while line = file.gets    
		e = 0
		i = 0
		line.each_char do |r|
			i = i + 1
			if r >= '0' && r <= '9'
			else 
				e = 1
			end
			if i == line.length - 1
				if e == 0
					srtfilename = line
				end
			end
		end
	end  
end  
puts "broq na subtitrite e #{srtfilename}"
