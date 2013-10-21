require 'csv'

all=[]
output=""

Dir.chdir("../class7_homework")

Dir.glob("*.rb") do |file|
		next if file=~/test/
			`cp #{file} ../class8_homework/Martin_Stoyanov_temp_dir`
end

Dir.chdir("../class8_homework/Hristiqn_Zarkov_test_data")
`cp expected_subs.txt subs.srt ../Martin_Stoyanov_temp_dir`

Dir.chdir("../Martin_Stoyanov_temp_dir")
	Dir.glob("*.rb").each do |file|
		File.open(file, "r") do |row|
			if row=~/"w"/ || row=~/"wb"/ || row=~/'w'/ || row=~/'wb'/
				output=row.split(",")[0]
				output=row.split("(")[1]
			end
			if output="ARGV[1]" || output="ARGV[0]" || output="ARGV[2]"
				output="output.txt"
			end
			name1=file.split("_")[0]
			tempname=file.split("_")[1]
			name2=tempname.split("1")[0].gsub("_", "")
			name = (name1+" "+name2).to_s
			`ruby #{file} subs.srt output.txt`
			pileoftext=`diff expected_subs.txt output.txt`
			if pileoftext==""
				all<<[name,pileoftext,1]
			else
				all<<[name,pileoftext,0]
		end
	end
end

`rm -f Martin_Stoyanov_temp_dir/*.txt`
`rm -f Martin_Stoyanov_temp_dir/*.rb`
`rm -f Martin_Stoyanov_temp_dir/*.srt`

all.sort_by{|all| all[1]}

CSV.open("results1.csv","wb") do |csv|
	all.each do |ye|
		csv << ye
	end
end