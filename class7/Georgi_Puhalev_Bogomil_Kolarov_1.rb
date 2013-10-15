require 'date'
require 'time'

subtitles_all = Array.new
time1 = nil
time2 = nil
co = 0

f = File.open(ARGV[0]).each do |line|
	temp = line.to_s
	if line !=~ / --> / && temp.length > 3
		if subtitles_all[co] != nil
			subtitles_all[co] = subtitles_all[co] + " " + temp
		else
			subtitles_all[co] = temp
	end
		if line =~ / --> /	
			if time1 || time2 == nil 
				time1 = Time.parse(line.split(" --> ")[0])
				time2 = Time.parse(line.split(" --> ")[1])
			else
				time1 = Time.parse(line.split(" --> ")[0])				
				period = time1 - time2
				if period.nsec > 3000000000   
						co += 1			
				end
				time2 = Time.parse(line.split(" --> ")[1])				
			end
		end
end
puts subtitles_all
end
