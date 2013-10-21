require 'csv'
CSV.open("results1.csv","w") do |csv|
	Dir.chdir "../class7_homework"
	Dir.glob("*.rb").each do |file|
		Dir.chdir "../class7_homework"
		if file.split("_")[0].to_s != "test"
			name = file.split("_")[0] +" "+ file.split("_")[1].gsub(".rb","")
			`cp #{file} ../class8_homework/Kaloian_Pavlov_td`
			Dir.chdir "../class8_homework/Kaloian_Pavlov_td" 		
			begin
				x = file.gsub(".rb",".txt").gsub(/.\d/,"")
				check = system "ruby #{file} 28.srt #{x}"
				if check
					file = file.gsub(/.\d/,"")
					result_file = Dir.glob("#{file.gsub(".rb",".txt")}")[0]
					File.read(result_file)	
					check = `diff #{result_file} tf1.txt`
					check2 = `diff #{result_file} tf3.txt`
					check3 = `diff #{result_file} tf4.txt`
				end
				if check == "" || check2 == "" || check3 == ""
					csv << [name,"",1]
				else
					csv << [name,"Diff in file",0]
				end
			rescue Exception => e
				csv << [name,e,"0"]
			end
			Dir.chdir ".."
		end

	end
end
