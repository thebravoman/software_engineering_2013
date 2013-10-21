require 'csv'

class String
	def to_name
		self.gsub("_1.rb","").gsub(".rb","").gsub("_"," ")
	end
end
expected = IO.readlines("IH_Data/expected.txt")

res1 = ""
res2 = ""
name = ""

`mkdir IH_Data/Exec`
`cp ../preyear3/28.srt IH_Data/Exec`
CSV.open("results1.csv","w") do |csv|
	Dir.glob("../class7_homework/*.rb") do |prog|
		next if prog =~ /test/
		`cp #{prog} ../class8_homework/IH_Data/Exec`
	end
	Dir.chdir("IH_Data/Exec")
	Dir.glob("*.rb") do |prog|
		name = prog.to_name
		begin
			res1 = system "ruby #{prog} 28.srt"
			if res1
				res2 = `ruby #{prog} 28.srt`
				if res2.empty?
					Dir.glob("*.txt") do |text|
						res2 = IO.readlines("#{text}")
					end
				end
				`rm -f *.txt`
			else
				res2 = "Can't compile program"
			end
			csv << [name, res2 == expected ? "" : res2, res2 == expected ? "1" : "0"]
		rescue
			res2 = "Exception for #{prog}"
			csv << [name, res2, "0"]
		end
	end
	`rm -f ../Exec -r`
end
