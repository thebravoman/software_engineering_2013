

	File.open(ARGV[0], "r").each do |line|
	
		if line =~ /-->/
		
			if nachalo.empty? 
				nachalo = line.split("-->")[0]
			else
				kraii = line.split("-->")[1]
			end
		
		end
	
	end
	
	nach = nachalo.split(":")
	krai = kraii.split(":")
	
	krai_sec = kraii[2].split(",")
	nach_sec = nach[2].split(",")
	
	begin_time = (nach[0].to_i + nach[1].to_i + nach_sec[0].to_i + nach_sec[1].to_i)* 1 000 000 000
	end_time = (krai[0].to_i + krai[1].to_i + krai_sec[0].to_i + krai_sec[1].to_i)* 1 000 000 000
	
	puts end_time - begin_time
