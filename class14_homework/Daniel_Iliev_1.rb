require_relative "drawer"
require 'csv'

class ChartDrawer
	
	def initialize d
		@drawer = d
	end

	def columns_chart data
		draw_columns data
		draw_legend data
		draw_values_lines data
		draw_values_name data
	end
	
	private 
	def loop_months data
		months = data[0].length - 1
		colors = ["black", "#003333", "#C0C0C0", "#330033"]
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
	
	def draw_values_lines data
			loop_months(data) do |n|
			@drawer.set_fill "black"
			@drawer.line(-50,n*100,(data[1].size-1)*40+50,n*100)
        end
    end
	
	def draw_values_name data
        loop_months(data) do |n|
            @drawer.text(n*100,-100,n*100)
        end
    end
	
end

d = Drawer.new "Daniel_Iliev_1.svg", 600,350
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read("data.csv")

chart_drawer.columns_chart array_of_values

d.finish
