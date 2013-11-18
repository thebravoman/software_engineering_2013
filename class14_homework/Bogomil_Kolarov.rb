require "drawer"
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
                        @drawer.rect 10,10,months*30 +30,n*30
                        @drawer.text data[0][n+1].to_s,months*30 +60,n*30
                end
        end
        
        def draw_columns data
                loop_months(data) do |n,months,color|        
                        @drawer.set_fill color
                        @drawer.rect 20,data[1][n+1].to_i,n*30,0
						@drawer.text data[1][n+1].to_s,-80,data[1][n+1].to_i - 5
						
                end
        end        

		def draw_graph data
			step = 0
			count = data[1][-1].to_i/50 
			count.times do
				@drawer.line -50, 50 + step, (data[1].length - 1)*30 + 10, 50 + step
				break if step >= count*50
				step += 50
			end
			loop_months(data) do |n,months|        
				@drawer.line -50,0,n*30+40,0
				@drawer.line -50,0,-50,data[1][n+1].to_i
				@drawer.line -50,data[1][n+1].to_i,(data[1].length - 1)*30 + 10,data[1][n+1].to_i
            end
		end
end

d = Drawer.new "chart.svg", 350,350
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read("data.csv")

chart_drawer.columns_chart array_of_values

d.finish
