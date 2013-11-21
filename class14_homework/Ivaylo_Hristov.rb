require_relative "../class14/drawer.rb"
require 'csv'

class ChartDrawer

	def initialize d
		@drawer = d
		@colors = []
	end

	def columns_chart data
		draw_legend data
		draw_columns data
	end
	
	private 
	def loop_months data
		months = data[0].length - 1
		
		while @colors.length != months
			color = "rgb( #{rand(255)}, #{rand(255)}, #{rand(255)} )"
			if !@colors.include? color
				@colors << color
			end
		end
		
		months.times do |n|
				yield n,months,@colors[n]
		end
	end
	
	def draw_legend data
		loop_months(data) do |n,months,color|
			@drawer.set_fill color
			@drawer.rect 10,10,months*30+30,n*30-100
			@drawer.text data[0][n+1].to_s,months*30+45,n*30-100
		end
		
		@drawer.text data[1][0],(data[1].length-1)*15-data[1][0].length*4,-125
		data[1][0] = 0
		heigth = data[1].max { |a,b| a.to_i <=> b.to_i }.to_i
		countHeigth = 0
		
		if heigth%30==0
			times = heigth/30 + 1
		else
			times = heigth/30 + 2
		end
		
		times.times do 
			@drawer.text countHeigth,-125,countHeigth-95
			@drawer.rect (data[0].length-1)*30+115,1,-125,countHeigth-100
			countHeigth += 30
		end
	end
	
	def draw_columns data
		loop_months(data) do |n,months,color|        
			@drawer.set_fill color
			@drawer.rect 20,data[1][n+1].to_i,n*30,-100
		end
	end
	
end

d = Drawer.new "chart.svg", 350,350
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read("../class14/data.csv")

chart_drawer.columns_chart array_of_values

d.finish
