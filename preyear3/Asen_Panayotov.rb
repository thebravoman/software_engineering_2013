count_sub=0
search=/-->/
	f=File.open(ARGV[0]) # otvarq subtitura 
	f.each do |text|  # tursi dali e poreden subtitur ilitext
	 
		if text=~search  # If text, produljava da tursi  dokato ne nameri sledvasht
			sub_counter += 1
		end

	end
puts "Subtitles value = : #{count_sub}" #printira na ekrana broq na subtitrite vuv faila
f.close