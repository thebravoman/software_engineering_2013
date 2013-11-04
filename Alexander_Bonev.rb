require 'rexml/document'

def line(svg,x1,y1,x2,y2,color)
        c = svg.add_element "line"
    c.attributes["x1"] = x1
    c.attributes["y1"] = y1
    c.attributes["x2"] = x2
    c.attributes["y2"] = y2
    c.attributes["stroke-width"] = "2"
    c.attributes["stroke"] = color
end

 if ARGV.length < 1 || ARGV.length.odd? || ARGV.length == "" 
        puts "Wrong number of arguments!"

else
        doc = REXML::Document.new
        svg = doc.add_element "svg"
        svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
        svg.attributes["version"] = "1.1"

        starting_x = 600
        starting_y = 350
        line(svg,starting_x,50,starting_x,650,"black")
        line(svg,300,starting_y,900,starting_y,"black")
        
        i = 0
        while i <= ARGV.length-1
                color = "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"
                x1 = 100
                x2 = -100
                y1 = ARGV[i].to_i * x1 + ARGV[i+1].to_i
                y2 = ARGV[i].to_i * x2 + ARGV[i+1].to_i
                line_x1 = starting_x + x1
                line_y1 = starting_y - y1
                line_x2 = starting_x + x2
                line_y2 = starting_y - y2
                line(svg,line_x1,line_y1,line_x2,line_y2,color)
                i = i + 2
        end

        File.write(__FILE__.split(".")[0] + ".svg",doc.to_s)
end
