
File.open("result.txt", "wb") do |csv|
Dir.glob("*testt.rb") do |file|
begin
    result = `diff test/subs.txt test/subs_expected.txt`   #`diff test/sub.srt test/sub_expected.srt`
    csv << [file, result == ' ']    #change filenames if needed
rescue
    result = "Exception for #{file}"
    csv << [file, result, false]
end
end
end

