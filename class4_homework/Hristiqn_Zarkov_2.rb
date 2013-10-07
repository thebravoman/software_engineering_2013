require 'csv'
require 'date'

CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
        if (row[0].to_s.length == 1)
                if (row[3] == nil)
                        row[3] = " "
                end
                name = row[1].to_s + " " + row[2].to_s
                git_link = row[4].to_s.split("/")[0..3]
                user =  git_link[3]
                element=`git log --format="format:%ct" --author="#{user}"`
                first_post = element[0..9]
                last_post = element[-10..-1]
                CSV.open("test_execution/results3.csv", "a+") do |csv|
                        csv << [name,last_post,"1"]
                end
        end
end
