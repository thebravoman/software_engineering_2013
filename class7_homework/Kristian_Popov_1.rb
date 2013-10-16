require 'time'

f = File.open(ARGV[0]).each do |ln|
	if (ln!=nil) && (ln.length>3)
		temp = ln.to_s
		if temp.include? "-->"
			 t1 = Time.parse(temp.split(" --> ")[0])
			 t2 = Time.parse(temp.split(" --> ")[1])
                  if (t1 - t2) > 3000
				puts '\n'
			  end
		else puts temp
		end
	end
end
