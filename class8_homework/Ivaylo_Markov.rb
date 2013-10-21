require 'csv'

results = {}
`mkdir Ivaylo_Markov_test_env`
`cp Ivaylo_Markov_test_data/expected.txt Ivaylo_Markov_test_env/expected.txt`
`cp Ivaylo_Markov_test_data/test.srt Ivaylo_Markov_test_env/test.srt`

def parse_name(fname)
	fname = fname.gsub('.rb','')
	snames = fname.split('_')[0..1]
	sname = snames[0] + ' ' + snames[1]
	return sname
end

def parse_tname(rb_name)
	tnames = rb_name.split('_')[0..1]
	return tname = tnames[0] + '_' + tnames[1] + '.txt'
end

def parse_fname(ofname)
	fnames = ofname.split('/')[2]
	return fnames
end

Dir.glob(File.join('../','class7_homework/*.rb')).each do |file|
	file = parse_fname(file)
	next if file.include?('test')
	p 3131
	name = parse_name(file)
	tname = parse_tname(file).gsub('.rb','')
	ofile = File.join('../class7_homework/',file).to_s
	dfile = File.join('Ivaylo_Markov_test_env/',file).to_s
	`cp #{ofile} #{dfile}`
	`ruby Ivaylo_Markov_test_env/#{file} Ivaylo_Markov_test_env/test.srt`
	result = `diff Ivaylo_Markov_test_env/#{tname} Ivaylo_Markov_test_env/expected.txt`
	p result
	if result == ""
		results[name] = ['',1]
	else
		results[name] = [result,0]
	end
	
end

CSV.open('Ivaylo_Markov_test_data/results1.csv', 'wb') do |csv|
	results.each do |name,res|
		csv << [name,res[0],res[1]]
		p '#{name} #{res[0]} #{res[1]}'
	end
end
#`rm -rf Ivaylo_Markov_test_env`



















																																																																																																																																																																																																																																									
