require 'csv'

CSV.open("results1.csv", "w") do |csv|
	Dir.chdir("../class7_homework") do
		Dir.glob("*.rb").each do |program|
			next if program[0..3] == "test"
			Dir.chdir("Kiril_Kostadinov_test_data") do
				`mkdir exec`
				`cp ../#{program} exec`
				Dir.chdir("exec") do
					before = Dir.entries(".")
					output = `ruby #{program} ../28.srt out.txt`
					if output
						File.open("out.txt", "	w") do |out|
							out << output
						end
					end
					if File.exists?("out.txt")
						result = `diff out.txt ../Kiril_Kostadinov.txt`
						result.gsub!(/\r\n/, "")
						name = program.gsub!(".rb", "").split("_")
						if result == ""
							csv << [name[0] + " " + name[1], result, 1]
						else
							csv << [name[0] + " " + name[1], result, 0]
						end
					else
						after = Dir.entries(".")
						filename = after - before
						result = `diff #{filename[0]} ../Kiril_Kostadinov.txt`
						result.gsub!(/\r\n/, "")
						name = program.gsub!(".rb", "").split("_")
						if result == ""
							csv << [name[0] + " " + name[1], result, 1]
						else
							csv << [name[0] + " " + name[1], result, 0]
						end
					end
				end
				`rm -f exec`
			end
		end
	end
end
