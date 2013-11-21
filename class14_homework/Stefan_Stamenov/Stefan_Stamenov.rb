require "drawer"
require 'csv'

class ChartDrawer
	
	def initialize d
		@drawer = d
	end

	def columns_chart data
		draw_lines data
		draw_columns data
		draw_legend data
	end
	
	private 
	def loop_months data
		months = data[0].length - 1
		colors = ["red", "green", "blue", "orange"]
		months.times do |n|
			yield n,months,colors[n]
		end
	end
	
	def draw_legend data
		loop_months(data) do |n,months,color|
			@drawer.set_fill color
			@drawer.rect 10,10,months*30 +30,n*30
			@drawer.text data[0][n+1].to_s,months*30 +60,n*30
		end
	end
	
	def draw_columns data
		loop_months(data) do |n,months,color|	
			@drawer.set_fill color
			@drawer.rect 20,data[1][n+1].to_i,n*30,0
		end
	end
	
	def draw_lines data
		loop_months(data)do |n,months,color|
		@drawer.line n-30,data[1][n+1].to_i,months*30,data[1][n+1].to_i
		@drawer.text data[1][n+1].to_s,(n-30)-(data[1][n+1].to_s.length)*10,data[1][n+1].to_i
		
		@drawer.line n-30,0,months*30,0
		@drawer.text data[0][0].to_i,(n-30)-(data[1][n+1].to_s.length)*10,0
		
		@drawer.text data[1][0].to_s,0,-20
		end
	end
	
	
	
end

d = Drawer.new "Stefan_Stamenov.svg", 350,350
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read("data.csv")

chart_drawer.columns_chart array_of_values

d.finish
