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
                draw_chart_name data
                draw_chart_values_lines data
                draw_chart_values_name data
        end
        
        private
        def loop_months data
                months = data[0].length-1
                colors = ["blue","red","orange","pink","green","purple"]
                months.times do |n|
                        yield n,months,colors[n]
                end
        end
        def loop_values data
                max = data[1][1..-1].collect{|a| a.to_i}.max.to_s
                (max[0..-3].to_i+1).times do |n|
                        yield n
                end
        end
        def draw_column_names data
                loop_months(data) do |n,months,color|
                        @drawer.set_fill color
                        @drawer.rect 40,40,(months*40)+200,n*51
                        @drawer.text data[0][n+1],(months*40)+200+45,n*51
                end
        end
        def draw_columns data
                loop_months(data)  do |n,months,color|
                        @drawer.set_fill color
                        @drawer.rect 40,data[1][n+1].to_i,n*40,0
                end
        end
        def draw_chart_name data
                @drawer.text(data[1][0],((data[1].size-1)*40)/2-data[1][0].size*3,-30);
        end
        def draw_chart_values_lines data
                loop_values(data) do |n|
                        @drawer.set_fill "black"
                        @drawer.line(-50,n*100,(data[1].size-1)*40+50,n*100)
                end
        end
        def draw_chart_values_name data
                loop_values(data) do |n|        
                        @drawer.text(n*100,-100,n*100)
                end
        end
end

d = Drawer.new "chart.svg",300,350
d.start
chart_drawer = ChartDrawer.new d
chart_drawer.column_chart ARGV[0]

d.finish
