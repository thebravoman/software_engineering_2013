require 'csv'

CSV.open("result.txt", "wb") do |csv|
Dir.glob("*_1.rb") do |file|
begin
    `cd ..`
    `ruby #{file} subs.txt file.txt`
    result = `diff file.txt subs_expected.txt`  
    csv << [file, result == " "]    #hm
rescue
    result = "Exception for #{file}"
    csv << [file, result, false]
end
end
end
