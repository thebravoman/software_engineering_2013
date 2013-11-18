require_relative "drawer"
require 'csv'

class ChartDrawer
	
	def initialize d
		@drawer = d
	end

	def columns_chart data
		draw_columns data
		draw_legend data
		draw_graph data
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
		loop_months(data) do |n,months,color|
			@drawer.set_fill color
			#@drawer.rect 10,10,months*50 +100,n*30
			@drawer.text data[0][n+1].to_s,n*30, -140
		end
	end
	
	def draw_columns data
		loop_months(data) do |n,months,color|	
			@drawer.set_fill color
			@drawer.rect 20,data[1][n+1].to_i,n*30,-120
		end
	end
	
	def draw_graph data
		@drawer.line -100,-120,200,-120
        @drawer.text "0",-100,-120  
        loop_months(data) do |n,months,color|
			@drawer.set_fill "black"
			@drawer.line -100,data[1][n+1].to_i - 120,200,data[1][n+1].to_i - 120
			@drawer.text data[1][n+1],-100,data[1][n+1].to_i - 120
		end
	end
end

d = Drawer.new "chart.svg", 350,350
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read("data.csv")

chart_drawer.columns_chart array_of_values

d.finish
