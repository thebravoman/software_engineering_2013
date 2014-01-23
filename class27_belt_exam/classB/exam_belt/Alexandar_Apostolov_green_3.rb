class Chart 

	attr_accessor :value1, :value2, :value3

	@value1 = 0
	@value2 = 0
	@value3 = 0

end

class PieChart < Chart 
	
	def alexandar
		@value2 = @value2 - @value1
	end

end

class BarChart < Chart


end

class AlexandarApostolov3
	def alexandar
		@value2 = @value2 - @value1
	end
end

pc = Array.new
bc = Array.new

i = 1
while input = gets
	input = input.chomp.split(",")
	
	if input[1] != nil
	
		if i % 2 == 0
			pie = PieChart.new
			pie.value1 = input[0]
			pie.value2 = input[1]
			pie.value3 = input[2]
			pc << pie
			puts pie.value1, pie.value2, pie.value3
		else 
			bar = BarChart.new
			bar.value1 = input[0].to_i
			bar.value2 = input[1].to_i
			bar.value3 = input[2].to_i
			bc << bar
			puts bar.value1, bar.value2, bar.value3	
		end
		
		i = i + 1	
		
	else 
		break
	end

end



