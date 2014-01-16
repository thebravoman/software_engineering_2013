require 'CSV'

arr =[]
arr2 =[]
i=0;
fname=ARGV[0]
CSV.foreach(fname) do |row|
	if !(ARGV[1] == row[1])
        arr << row
	end
end

i=0;

arr.each do |array|
	array[0]=array[0].gsub("champ_","")
	arr2 << [array[3],array[0].gsub("_"," ")]
	i+=1
end

arr2 = arr2.sort_by{|a,b| a.to_f}.reverse

fname=fname.gsub(".csv","")

CSV.open(fname + "_result.csv", "w") do |csv|
        arr2.each do |element|
                csv << element
        end
end
