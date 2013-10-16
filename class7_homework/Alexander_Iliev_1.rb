require 'time'

end_time = nil

diff = 0

text = String.new()

text_part = String.new()

check = 0

File.open(ARGV[0]).each do |row|

	if row =~ /-->/

		split = row.split(" --> ")[0..1]

		start_time = Time.parse(split[0])

		

		diff = start_time - end_time  if end_time != nil

		end_time = Time.parse(split[1])	

		check = 0

	elsif check == 1

			if diff >= 3

				text_part.delete!"\n"

				text << "\n\n\t" if !text.empty?

				text << "\t" if text.empty?

				text << text_part

				text_part.clear			

			end

			text_part << row

	end

	check += 1

end

text_part.delete!"\n"

text << "\n\n\t" << text_part

File.open("#{ARGV[0].split(".")[0]}_result.txt", "w") do |row|

	row.write(text)

end