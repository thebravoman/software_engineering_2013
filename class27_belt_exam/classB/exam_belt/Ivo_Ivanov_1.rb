require "csv"
require "date"
arr =[]
hello = []
arrr = []
CSV.foreach(ARGV[0]) do |row|
        row[2].gsub!("date_","")
        row[2].gsub!(/-/,"")
        price = row[3]
        arr << row
end
arr=arr.sort_by { |a,b,c| c.to_i}
arr = arr.reverse
hello << arr[0]
hello << arr[-9]
hello << arr[-1]

hello.each do |row|
year = ""
month = ""
roww = ""
day = ""
        row[0].gsub!("champ_","")
        row[0].gsub!(/._/,".")
        row[0].gsub!("."," ")
        hell = row[2].split(//)
        year.concat(hell[0])
        year.concat(hell[1])
        year.concat(hell[2])
        year.concat(hell[3])
        month.concat(hell[4])
        month.concat(hell[5])
        day.concat(hell[6])
        day.concat(hell[7])
        roww.concat(year)
        roww.concat("-")
        roww.concat(month)
        roww.concat("-")
        roww.concat(day)
        arrr << [roww,row[0]]
end
arrr=arrr.sort_by { |a,b,c| b }



CSV.open("Ivo_Ivanov_1_results.csv", "w") do |iu|
	arrr.each do |row|
	iu << row
	   
end        
end
