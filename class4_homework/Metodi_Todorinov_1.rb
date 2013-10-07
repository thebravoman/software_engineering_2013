require 'csv'

   names=Hash.new("")

     CSV.foreach(File.join(ARGV[0], "Evaluation 2013-2014 - Sheet2.csv") do |row|
         next if row[0].to_s.length() !=1
         name =row[1].strip + " " + row[2].strip
      if row[3].nil? then
         row[3]=name
      end
     CSV.foreach( File.join(ARGV[0], 'results1.csv' )) do |row|
         aname = row[0].split("_")[0..1]
         name = aname[0] + " " + aname[1]
     if names.has_key?(name) && row[2] == "true"
         names[name][1]=1
     end
     CSV.foreach(File.join(ARGV[0], "results3.csv")) do |row|
         aname = row[0].split("_")[0..1]
         name = aname[0] + " " + aname[1]
     if names.has_key?(name) && row[2] == "true"
         names[name][2]=1
     end
  end
      names=names.sort { |a,b| a[0] <=> b[0] }
  CSV.open("results1.csv", "wb") do |csv|
      names.each do |student|
      csv << student[1]
      end
  end
  
