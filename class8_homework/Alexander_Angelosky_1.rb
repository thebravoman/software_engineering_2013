require "csv"
masiv = []
true_text = File.readlines("d://test_result.txt")
	Dir.glob("*.rb") do |file|
		result = system "ruby #{file} #{ARGV[0]}"
	end
	Dir.glob("*.txt")do |file|
		file_content = File.readlines(file)
		if file_content==true_text then
			masiv << [(file.to_s[0..-5]),'',1]
		else
			masiv << [file.to_s[0..-5],file_content,0]
		end
	end
	CSV.open("results1.csv", "w") do |csv|
		0.upto(masiv.length-1) do |i|
			csv<<masiv[i]
		end
	end
