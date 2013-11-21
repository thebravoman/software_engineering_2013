require_relative 'drawer'
require 'csv'

class ChartDrawer
	
	def initialize d
		@drawer = d
	end
	
	def column_chart csv_file
		data = CSV.read(csv_file)
		draw_columns data
		draw_column_names data
		draw_things data
	end
	
	private
	def loop_months data
		months = data[0].length-1
		colors = %w[darkcyan chartreuse bisque royalblue pink peachpuff yellow yellowgreen slategrey slateblue mediumslateblue darkslateblue lightsalmon linen olive orangered lightcoral cornsilk]
		months.times do |n|
			yield n,months,colors[n]
		end
	end
	
	def draw_column_names data
		loop_months(data) do |n,months,color|
			@drawer.set_fill color
			@drawer.rect 20,20,75+(months*50),n*30
			@drawer.text data[0][n+1],(months*50)+100,(n*30)+5
		end
	end
	
	def draw_columns data
		loop_months(data) do |n,months,color|
			@drawer.set_fill color
			@drawer.rect 40,data[1][n+1].to_i,(n*50)+50,0
		end
	end

	def draw_things data
		@times
		loop_months(data) do |n,months,color|
			@times = (data[1][2..data[1].length].max.to_i / 100) + 2
			@months = months
		end
		@times.times do |n|
				@drawer.set_fill "black"
				@drawer.line 0,n*100,40 + @months*50,n*100
				@drawer.text n*100,0,n*100+5
		end
		
	end
end

d = Drawer.new "Mihail_Kirilov_chart.svg", 50,600
d.start

chart_drawer = ChartDrawer.new d

chart_drawer.column_chart ARGV[0]

d.finish
