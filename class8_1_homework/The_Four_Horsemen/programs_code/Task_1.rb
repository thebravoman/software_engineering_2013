require 'csv'

grades = 0.00
student = {}

CSV.foreach(ARGV[0]) do |row|
        name = row[1] + " " + row[2]
        grade_sum = 0.00
        row[3..-1].each do |grade| # -1 poslednata ocenka (lenght of row)
                grade_sum += grade.to_f
                p grade_sum
        end
                grades = grade_sum / (row.length - 3)
        student[name] = grades
end

student = student.sort_by{|a,b| b.to_f}.reverse

CSV.open(ARGV[1], "w") do |csv|
        student.each do |name, grade|
                csv << [name, grade]
        end
end
