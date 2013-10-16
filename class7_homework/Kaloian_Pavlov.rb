arr = String.new
i = 0; x = 0; y = false; bool = true; blip = true ;
arr2 = Array.new


File.open(ARGV[0]).each do |line|
	if line =~ /-->/
		line = line.split("-->")[0..1]		
		if bool == false
			a = line[0].split(":")[0..2]	
			arr1 =  a[2].gsub(",",".").to_f	
		else
			bool = false
		end
		b = line[1].split(":")[0..2]
		arr2[x] =  b[2].gsub(",",".").to_f
		x+=1
		
		if arr1 != nil
			blip = arr1 - arr2[x-2] < 3
		end	
		y = true	
		i=0		
	elsif i > 0 && y == true	
		if line!="\n"
			if blip == true
				arr += line.gsub(/\n/,'')
			elsif blip == false
				arr += "\n" + "\n" + line.gsub(/\n/,'')
			end	
		end
	end	
	i+=1	
	if line == "\n" 
		y = false
	end
end 


File.open("Kaloian_Pavlov.txt","w") do |file|
	file.write(arr)
end
