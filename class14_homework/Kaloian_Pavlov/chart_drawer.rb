require_relative "drawer"
require 'csv'

class ChartDrawer
	
	def initialize d
		@drawer = d
	end

	def columns_chart data
		draw_columns data
		draw_legend data
		make_lining data
		write_line_names data
	end
	
	private 
	def loop_months data
		months = data[0].length - 1
		colors = ["#4E2D9B", "#201E38", "#841D52", "#83F3F7"]
		months.times do |n|
			yield n,months,colors[n]
		end
	end
	
	def draw_legend data
		loop_months(data) do |n,months,color|
			@drawer.set_fill color
			@drawer.rect 10,10,months*30 +70,n*30
			@drawer.text data[0][n+1].to_s,months*30 +100,n*30
		end
	end
	
	def draw_columns data
		loop_months(data) do |n,months,color|	
			@drawer.set_fill color
			@drawer.rect 40,data[1][n+1].to_i,n*40,0
		end
	end

	def make_lining data
		heigth_leveler = 0
		diff = 50  
		biggest_val = data[1].sort{ |a,b| b.to_i <=> a.to_i }[0].to_f
		biggest_val = (biggest_val/100).ceil*100
		while biggest_val+50 >= diff
			@drawer.line -50,heigth_leveler,32*data[1].length,0 + heigth_leveler
			@drawer.text "#{heigth_leveler}",-18*data[1].length,heigth_leveler
			biggest_val -= diff
			heigth_leveler += diff
		end
	end

	def write_line_names data
			@drawer.text data[1][0].to_s,20 ,-20
	end
	
end
