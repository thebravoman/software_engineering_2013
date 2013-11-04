require "rexml/document"
def set_start_points(x,y)    
        $start_x = x
        $start_y = y
        
end
=begin
def next_color(color)
        color[0] = color[0] + 1
        if(color[0] >= 250)
                color[1] = color[1] + 1
                color[0] = 0
        end
        if(color[1] >= 250)
                color[2] = color[2] + 1
                color[1] = 0
                color[0] = 0
        end
        if (color[2] >= 250)
                color[2] = 0
                color[1] = 0
                color[0] = 0
        end
        color
end
=end
def line(doc,x1,y1,x2,y2,color)
        el_svg = doc.add_element "line"
        el_svg.attributes["x1"] = $start_x+x1
        el_svg.attributes["y1"] = $start_y-y1
        el_svg.attributes["x2"] = $start_x+x2
        el_svg.attributes["y2"] = $start_y-y2
        el_svg.attributes["style"] = "stroke:rgb(#{color[0]},#{color[1]},#{color[2]});stroke-width:2"
end

doc = REXML::Document.new
el_svg = doc.add_element "svg"
el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
el_svg.attributes["version"] = "1.1"
set_start_points(600,350)
color = [0,0,0]
line(el_svg,350,0,-350,0,color)
line(el_svg,0,350,0,-350,color)

first = "empty";
ARGV.each do |row|
        if (first == "empty")
                first = row;
        else
                x1 = -50;
                x2 = 50
                y1 = first.to_i * x1 + row.to_i
                y2 = first.to_i * x2 + row.to_i
                color = [rand(255),rand(255),rand(255)]
                #color = next_color(color)
                line(el_svg,x1,y1,x2,y2,color)
                first = "empty"
        end
end

File.write(__FILE__.split(".")[0] + ".svg",doc.to_s)
