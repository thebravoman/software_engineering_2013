class Chart 
	attr_accessor :value1, :value2

	@value1 = 0
	@value2 = 0
end

module LuboslavIvanov4
	def luboslav
		@value2 = @value2 + @value1*2 
	end
end	

class PieChart < Chart
end

class BarChart < Chart
	include LuboslavIvanov4 
end

bar_collection = Array.new
pie_collection = Array.new
i =0

while (value = gets)[value.length - 2] != "a" 
	value = value.to_i
	if i == 1
		bar = BarChart.new
		bar.value1 = value*3
		bar.value2 = value*5
		bar_collection << bar
		i=0
	elsif i == 0 
		pie = PieChart.new
		pie.value1 = value*2
		pie.value2 = value*4
		pie_collection << pie		
		i = 1
	end
end 


i = 0
while(i < bar_collection.length - 1)
	puts bar_collection[i].value1
	puts bar_collection[i].value2
	i=i+1
end	


i = 0
while(i < pie_collection.length - 1)
	puts pie_collection[i].value1
	puts pie_collection[i].value2
	i=i+1
end	


i = 0
while (i < bar_collection.length - 1)
		bar_collection[i].luboslav
	i=i+1
end


i = 0
while(i < bar_collection.length - 1)
	puts bar_collection[i].value1 + bar_collection[i].value2
	i=i+1
end	


i = 0
while(i < pie_collection.length - 1)
	puts pie_collection[i].value1 + pie_collection[i].value2
	i=i+1
end	

