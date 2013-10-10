require 'csv'
checknum=ARGV[1].to_f
all=[]
count=0
name=ARGV[0]
temp=[]
temp=name.split(".")[0..-1]
name=temp[0]
CSV.foreach(ARGV[0]) do |row|
	if(row[2].to_f>checknum)
		all<<row
	end
end
CSV.open(#{name})

