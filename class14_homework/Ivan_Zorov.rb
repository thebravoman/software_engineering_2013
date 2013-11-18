require 'csv'
require_relative 'drawer'


class ChartDrawer
        
    def initialize d
             @drawer = d
    end

    def columns_chart data
            draw_chart data
            draw_columns data
            draw_legend data
    end
        
    private
    def loop_months data
            months = data[0].length - 1
            colors = ["green", "red", "blue", "black","aqua","yellow","pink","silver","gold"]
            months.times do |n|
                    yield n,months,colors[n]
                    
            end
    end
        
    def draw_chart data
                i=1
                max = 0
                while i < data[1].length
                        if max < data[1][i].to_i
                        	max = data[1][i].to_i
                        end
                        i+=1
                end
                i=0
                m = (max/25).to_i + 1
                y=((data[1].length).to_i-1)*30
                while i<m
                        if i.odd? == false
                                y+=30
                                @drawer.text (i*25).to_s,y,i*25
                        else
                                y-=30
                        end
                        @drawer.line -20,i*25,y,i*25
                        i+=1
                
                end
                @drawer.line -20,0,-20,max
                @drawer.text data[1][0].to_s,-10,-20        
    end

    def draw_legend data
            loop_months(data) do |n,months,color|
                    @drawer.set_fill color
                    @drawer.rect 10,10,months*30 +80,n*30
                    @drawer.text data[0][n+1].to_s,months*30 +100,n*30
            end
    end
        
    def draw_columns data
                y=0
        loop_months(data) do |n,months,color|
                        @drawer.set_fill color
                        @drawer.rect 20,data[1][n+1].to_i,n*30,0
                        
        end
    end
        
end

d = Drawer.new "chart.svg", 300,600
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read("data.csv")

chart_drawer.columns_chart array_of_values

d.finish
