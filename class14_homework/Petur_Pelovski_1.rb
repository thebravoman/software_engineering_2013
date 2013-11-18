require_relative 'Drawer'
require 'csv'


class ChartDrawer

	def initialize d
		@drawer = d
	end
	
	def colum_chart csv_file
		data = CSV.read(csv_file)
		draw_columns data
		draw_column_names data
	end

	private
	
	def months_loop data
		months = data[0].length-1
		colors = ["blue","red","orange","pink"]
		months.times do |n|
			yield n, months,colors[n]
		end
	end
	
	def draw_column_names data
		colors = ["blue","red","orange","pink"]
		months_loop(data) do |n,month,color|
			months = data[0].length-1
			months.times do |n|	
				@drawer.set_fill colors[n]
				@drawer.rect 40, 40, (months*40)+100, n*50
				@drawer.text data[0][n+1],(months*40)+100+50,n*50 * -1
			end
		end		
	end
	def draw_columns data
		months_loop(data) do |n,months,color|
			@drawer.set_fill color
			@drawer.rect 40, data[1][n+1].to_i, n*60, 0
			@drawer.text data[1][n+1],n*65, 20
		end
	end
end

d = Drawer.new "chart.svg", 300, 350 
d.start

chart_drawer = ChartDrawer.new d
chart_drawer.colum_chart ARGV[0]

d.finish
