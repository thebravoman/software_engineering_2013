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
	end
	
	private
	def loop_months data
		months = data[0].length-1
		colors = ["blue","red","orange","pink"]
		months.times do |n|
			yield n,months,colors[n]
		end
	end
	
	def draw_column_names data
		loop_months(data) do |n,months,color|
			@drawer.set_fill color
			@drawer.rect 40,40,(months*40)+100,n*41
			@drawer.text data[0][n+1],(months*40)+100+41,n*41
		end
	end
	
	def draw_columns data
		loop_months(data) do |n,months,color|
			@drawer.set_fill color
			@drawer.rect 40,data[1][n+1].to_i,(n*40),0
		end
	end
end

d = Drawer.new "chart.svg", 300,350
d.start

chart_drawer = ChartDrawer.new d

chart_drawer.column_chart ARGV[0]

d.finish
