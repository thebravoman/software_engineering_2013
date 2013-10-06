require 'csv'

bg_names=Hash.new
zad1=Hash.new
zad3=Hash.new


CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|

    bg_names[row[3]]=row[1].to_s + " " + row[2].to_s

end


CSV.foreach(File.join(ARGV[0],"results1.csv")) do |row|
    names = row[0].split("_")[0..1]
    name = names[0] + " " + names[1]

    zad1[name]=row[2]=="true" ? 1 : 0
				
end


CSV.foreach(File.join(ARGV[0],"results3.csv")) do |row|
    names = row[0].split("_")[0..1]
    name = names[0].to_s + " " + names[1].to_s	

    zad3[name]=row[2]=="true" ? 1 : 0

end


writer = CSV.open('results1.csv', 'w') 
    bg_names.sort_by {|a,b| b}.each do |row|

	if(zad1[row[0]]==nil) 
	    next
	end

    writer << [row[1],zad1[row[0]],zad3[row[0]]]

    end

writer.close






