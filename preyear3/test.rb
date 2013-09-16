results = {}
Dir.glob("*_*.rb").each do |file|
 	begin
 		result = `ruby #{file} 28.srt`
 		results[file] = result
	rescue Error => e
		results[file] = e.message
	end
end
results.keys.sort.each do |key|
	score = results[key].match(/\A84[\n\r]*$/)
	p "#{key} - #{results[key]}, #{score != nil}"
end