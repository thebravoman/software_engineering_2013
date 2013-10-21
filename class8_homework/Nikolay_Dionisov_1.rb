dir_path = ARGV[0] == nil ? "../class7_homework" : ARGV[0]
dir_path = Dir.pwd + "/" + dir_path
test_sub = dir_path + "/../preyear3/28.srt"
res = "ruby " + dir_path + "/Nikolay_Dionisov_1.rb " + test_sub
res = %x[ #{res} ]

data = []

def compare_strings(a,b)
	return false if a.lines.count != b.lines.count
	a.lines.zip b.lines do |al, bl|
		return false if (al.length - bl.length).abs > 1
		return false if al.split(' ')[0..3].join(" ") != bl.split(' ')[0..3].join(" ")
		return false if al.split(' ')[-4..-1].join(" ") != bl.split(' ')[-4..-1].join(" ")
	end
	return true
end
Dir.glob(dir_path + "/*.rb") do |file|
	next if file.match("test")

	test_res = 'ruby ' + file + ' /' + test_sub
	test_res = %x[ mkdir test_dir && cd test_dir && #{test_res} ]
	if test_res.length < 256
		#attempt to find a file in the direcotry
		Dir.glob(Dir.pwd + "/test_dir/*.txt") do |a|
			test_res = IO.read(a)
		end
	end
	name = file.scan(/\w+_\w+\.rb/)
	name = name[0].gsub(/(_1)*.rb/, "")
	name = name.gsub("_", " ")
	data << [name, compare_strings(res, test_res) ? "1" : test_res]
	%x[ rm -r test_dir ]
end

require 'csv'
CSV.open("results.csv", "w") do |csv|
	data.each do |row|
		csv << [row[0], row[1] == "1" ? "" : row[1], row[1] == "1" ? 1 : 0]
	end
end