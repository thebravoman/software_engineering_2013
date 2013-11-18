require_relative "../class14/drawer"

class ChartDrawer
	def initialize d
		@drawer = d
		@colors = []

		r = Random.new
		0.upto(8) do
			@colors << "rgb(#{r.rand(0..255)},#{r.rand(0..255)},#{r.rand(0..255)})"
		end
	end

	def columns_chart data
		draw_columns data
		draw_legend data
	end
	
	private 
	def loop_months data
		months = data[0].length - 1
		months.times do |n|
			yield n,months,@colors[n]
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
end