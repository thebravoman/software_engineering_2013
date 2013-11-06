require 'rexml/document'

def line(file,x1,y1,x2,y2,color) 
        f = file.add_element "line"
    f.attributes["x1"] = x1
    f.attributes["y1"] = y1
    f.attributes["x2"] = x2
    f.attributes["y2"] = y2
    f.attributes["stroke-width"] = "2"
    f.attributes["stroke"] = color
end

if ARGV.length.odd? == true || ARGV.length < 1
        puts "The number of arguments is incorrect"
else
        doc = REXML::Document.new
        svg = doc.add_element "svg"
        svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
        svg.attributes["version"] = "1.1"

        x_start = 600
        y_start = 350
        line(svg,x_start,50,x_start,650,"black")
        line(svg,300,y_start,900,y_start,"black")
        
        i = 0
        while i <= ARGV.length-1
                color = "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"
                x1 = 100
                x2 = -100
                y1 = ARGV[i].to_i * x1 + ARGV[i+1].to_i
                y2 = ARGV[i].to_i * x2 + ARGV[i+1].to_i
                line_x1 = x_start + x1
                line_y1 = y_start - y1
                line_x2 = x_start + x2
                line_y2 = y_start - y2
                line(svg,line_x1,line_y1,line_x2,line_y2,color)
                i = i + 2
        end

        File.open("Venelin_Yonchev.svg", "w") do |file|
                file.write(doc.to_s)
        end
end
