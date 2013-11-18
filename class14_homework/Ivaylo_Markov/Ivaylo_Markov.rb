require_relative 'drawer'
require 'csv'

class ChartDrawer
	
	def initialize d
		@drawer = d
	end

	def columns_chart data
		draw_columns data
		draw_legend data
	end
	
	private 
	def loop_months data
		months = data[0].length - 1
		colors = ["black", "red", "green", "orange"]
		months.times do |n|
			yield n,months,colors[n]
		end
	end
	
	def draw_legend data
		maxY = 0
		maxX = 0
		rown = false
		loop_months(data) do |n,months,color|
			@drawer.set_fill color
			@drawer.rect 10,10,months*30 +30,n*30
			@drawer.text data[0][n+1].to_s,months*30 +60,n*30
			maxX +=30
			maxY = data[1][n+1].to_i if data[1][n+1].to_i > maxY
			if !rown
				@drawer.text data[1][0].to_s,months,-20
				rown = true
			end
		end
		0.step(maxY, 50) do |step|
			@drawer.line -100, step, maxX, step
			@drawer.text step.to_s, -130, step
		end
	end
	
	def draw_columns data
		loop_months(data) do |n,months,color|	
			@drawer.set_fill color
			@drawer.rect 20,data[1][n+1].to_i,n*30,0
		end
	end
	
end

d = Drawer.new "Ivaylo_Markov.svg", 350,350
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read("data.csv")

chart_drawer.columns_chart array_of_values

d.finish
