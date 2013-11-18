require_relative 'drawer'
require 'csv'

class ChartDrawer
        
        def initialize d
                @drawer = d
        end
        
        def column_chart csv_file
                data = CSV.read(csv_file)
			          draw_rows data
                draw_columns data
                draw_column_names data
			          draw_Bulgaria
        end
        
        private
        def loop_months data
                months = data[0].length-1
                colors = ["lightgray","green","red","orange"]
                months.times do |n|
                        yield n,months,colors[n]
                end
        end
        
        def draw_column_names data
                loop_months(data) do |n,months,color|
                        @drawer.set_fill color
                        @drawer.rect 20,20,(months*40)+100,-n*51+(data[0].size-1)*51
                        @drawer.text data[0][n+1],(months*40)+100+41,-n*51+(data[0].size-1)*51
                end
        end
        
        def draw_columns data
                loop_months(data) do |n,months,color|
                        @drawer.set_fill color
                        @drawer.rect 40,data[1][n+1].to_i,(n*50),0
                end
        end

	def draw_rows data
		@drawer.line -100,0,200,0
		@drawer.text "0",-100,0			
		loop_months(data) do |n,months,color|
                        @drawer.set_fill "black"
                        @drawer.line -100,data[1][n+1].to_i,n*50,data[1][n+1].to_i
			@drawer.text data[1][n+1],-100,data[1][n+1].to_i
                end
	end

	def draw_Bulgaria
		@drawer.text "BULGARIA",-100,-50
	end
end

d = Drawer.new "chart.svg", 300,350
d.start
#d.cs

chart_drawer = ChartDrawer.new d

chart_drawer.column_chart ARGV[0]

d.finish
