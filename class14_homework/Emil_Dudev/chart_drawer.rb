require_relative "drawer"
require 'csv'

class ChartDrawer
	
	def initialize d
		@drawer = d
		@drawer.cs true
		@colors = []
	end

	def columns_chart data
		generate_colors data
		draw_columns data
		draw_legend data
	end
	
	private
	def column_count data
		return data[0].length - 1
	end

	def loop_months data
		months = column_count data
		months.times do |n|
			yield n,months,@colors[n]
		end
	end

	def generate_colors data
		count = column_count data
		while @colors.length != count
			color = rand( 1 << 24 )
			red = color >> 16
			green = ( color >> 8 ) & 0xFF
			blue = color & 0xFF
			color = "rgb( #{red}, #{green}, #{blue} )"
			@colors << color unless @colors.include? color
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
		@drawer.text data[1][0], 0, -20
		loop_months(data) do |n,months,color|	
			@drawer.set_fill color
			@drawer.rect 20,data[1][n+1].to_i,n*30,0
		end
	end
end
