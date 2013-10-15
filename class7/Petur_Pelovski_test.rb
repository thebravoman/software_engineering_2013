

File.open("sub.txt", "wb") do |txt|
Dir.glob("*test.rb") do |file|
begin
	results = 'diff test/1.txt test/2.txt'
	txt << [file,results == '']
	rescue
		results = "Exception for #{file}"
		results = [file , results , false]
		end
	end
end
