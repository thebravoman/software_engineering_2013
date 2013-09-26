require 'csv'
require 'date'


begd = Date.parse(ARGV[0])
endd = Date.parse(ARGV[1])
income = 0.00
spent = 0.00

CSV.foreach('bank.csv') do |line| 
	datec = Date.parse(line[0])
	if datec >= begd && datec <= endd
		income = income + line[1].to_f
		spent = spent + line[2].to_f
	end
end
puts "#{income},#{spent},#{income - spent}"
