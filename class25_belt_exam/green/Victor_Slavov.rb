class PieChart
	attr_accessor :value1, :value2
	
	@value1 = 0
	@value2 = 0

end

class BarChart
	attr_accessor :value1, :value2
	
	@value1 = 0
	@value2 = 0
	
	def victor
		@value2 = @value2 + value1 * 2
	end
	
end

bar_collection = []
pie_collection = []
i = 1
pie = 0
bar = 0

while (value = gets)[value.length - 2] != "a"
	value = value.to_i
	if i == 1
		bar = BarChart.new
		bar.value1 = value * 3
		bar.value2 = value * 5
		bar_collection << bar
		i = 2
	else
		pie = PieChart.new
		pie.value1 = value * 2
		pie.value2 = value * 4
		pie_collection << pie
		i = 1
	end
end

i = 0

while(i < bar_collection.length - 1)
	p bar_collection[i].value1
	p bar_collection[i].value2
	i = i + 1
end

i = 0

while(i < pie_collection.length - 1)
	p pie_collection[i].value1
	p pie_collection[i].value2
	i = i + 1
end

i = 0

while(i < bar_collection.length - 1)
	bar_collection[i].victor
	i = i + 1
end

i = 0
haha = 0

while(i < bar_collection.length - 1)
	haha = bar_collection[i].value1 + bar_collection[i].value2
	p haha
	i = i + 1
end

i = 0

while(i < pie_collection.length - 1)
	haha = pie_collection[i].value1 + pie_collection[i].value2
	p haha
	i = i + 1
end

