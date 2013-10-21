require 'time'
require 'csv'
require 'fileutils'
 
subs = {}
check = 0
kluch = 0
co = 0
arr_out = []
maindir = '../class7_homework/'
value = []
directorylist = []
sub_file = ARGV[0].nil? ? '../preyear3/28.srt' : ARGV[0]

		File.open( sub_file ).each do |line|
			line = line.strip.to_s
	
			if line.chomp.empty?
				check = 0
				next
			end
	
			if check == 0
				kluch = line.to_i
				subs[kluch] = 0,0,0
				check = 1
				next
			end
	
			if check == 1 
				line = line.split(" --> ")[0..1]
				subs[kluch][0] = line[0]
				subs[kluch][1] = line[1]
				check = 2
				next
			end
	
			if check == 2
				subs[kluch][2] = line.to_s
				check = 3
				next
			end
	
			if check == 3
				subs[kluch][2] = subs[kluch][2] + " " + line.to_s
				next
			end
		end


		limit = kluch
		kluch = 1
		time1 = Time.parse(subs[kluch][0])
		time2 = Time.parse(subs[kluch][1])
		arr_out[co] = subs[kluch][2].to_s
		puti = subs.length - 1

		puti.times do
			kluch += 1
			time1 = Time.parse(subs[kluch][0])
			period = time1 - time2
			if period > 3
				co += 1		
				arr_out[co] = subs[kluch][2].to_s
			else
				arr_out[co] += " " + subs[kluch][2].to_s
			end
			time2 = Time.parse(subs[kluch][1])
		end
		
		$stdout = File.open("execution/expected.txt", "w")
		puts arr_out

	$stdout = File.open("execution/newfile.txt", "w")

CSV.open('results1.csv', 'w') do |csv|
	Dir.mkdir( 'execution' ) unless Dir.exists?( 'execution' )
 	Dir.chdir('../class7_homework'){
 		directorylist = %x[find . -name '*.rb' | sort]
 	}
 	Dir.chdir('execution')
	#Dir.open ('../classhomework_7').reject { |f| f =~ /^test_.*/ } do |file|

	maindir = '../' + maindir
	sub_file = '../' + sub_file
	#Dir.open( maindir ) do |file|
	value = directorylist.split("\n")
	value.each do |file|
		temp = file
		check = temp.split("_")[0]

		
		if check == "./test"
			next
		else
			#ime 
			filename = temp.split("./")[1]
			temp = filename.split(".")[0]
			name = temp.split("_")[0].to_s + ' ' + temp.split("_")[1].to_s
			#end ime
			`cp #{File.join( maindir, filename )} ./`
			data = `ruby #{filename} #{sub_file} 2> /dev/null`
			if $?.exitstatus != 0
				data = "Error in ruby file"
			else
				puts data
				if File.exist?("newfile.txt")
					if FileUtils.compare_file('expected.txt', 'newfile.txt')
						result = ""
					else
						result = File.read('newfile.txt', 'rb') #{ |newfile| newfile.read }
						puts result
						`rm newfile.txt`
					end
				end
			end
		end
		
		
		
		
	end 


end








































