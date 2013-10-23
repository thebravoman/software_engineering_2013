require 'csv'
def file_comp(rightf,margv1,margv2) 
	CSV.open("Result_#{ARGV[0].gsub(".rb",".csv")}","w") do |csv|	
		`cp #{ARGV[0]} testdata`
		Dir.chdir("testdata")
		begin
		@stname = ARGV[0].split("_")[0..1]
		@name = @stname[0] + " " + @stname[1]
		@resfname = ARGV[0].gsub(".rb",".csv")
		@check = system "ruby #{ARGV[0]} trains.csv #{margv1} #{margv2}"

		if @check
			File.read("#{@resfname}")
			@check = `diff #{@resfname} #{rightf}`
		end

		if @check == ""
			csv << [@name,"true"]
		else
			csv << [@name,"false"]
		end

		rescue Exception => e
			p e
			csv << [@name,"false"]
		end
		`rm #{ARGV[0]}`
		`rm #{@resfname}` 
		Dir.chdir ".."
		
	end
end

number = ARGV[0].split("_")[2].gsub(".rb","").to_i
p number
case number
when 11
	file_comp("testf_11.csv","randnums.csv",nil)
when 12
	file_comp("testf_12.csv","randnums.csv","-200")		
when 13
	file_comp("testf_13.csv","randnums.csv",nil)
when 14
	file_comp("testf_14.csv","randnums.csv",nil)
when 15
	file_comp("testf_15.csv","randnums.csv",nil)
end
