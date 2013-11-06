require 'rexml/document'

def drawline(svg,x1,x2,y1,y2) 
        line = svg.add_element "line"
        line.attributes["x1"] = x1
        line.attributes["x2"] = x2
        line.attributes["y1"] = y1
        line.attributes["y2"] = y2
        line.attributes["stroke-width"] = "3"
        line.attributes["stroke"] = "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"
end

def coord_sys(svg,x1,x2,y1,y2) 
        line = svg.add_element "line"
        line.attributes["x1"] = x1
        line.attributes["x2"] = x2
        line.attributes["y1"] = y1
        line.attributes["y2"] = y2
        line.attributes["stroke-width"] = "3"
        line.attributes["stroke"] = "rgb(0,0,0)"
end


unless ARGV.length.odd? || ARGV.length < 1 

        document = REXML::Document.new 
        my_svg = document.add_element "svg"
        my_svg.attributes["version"] = "1.1"
        my_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
        coord_sys(my_svg,300,900,350,350)
        coord_sys(my_svg,600,600,50,650)

        even_arg = ARGV[1]
        counter = 0

        while even_arg != nil
                y1=150
                x2=-150
                x1=(-ARGV[counter+1].to_i+y1)/ARGV[counter].to_i
                y2=(ARGV[counter].to_i*x2)+ARGV[counter+1].to_i
                drawline(my_svg,x1+600,x2+600,350-y1,350-y2)
                counter+=2
                even_arg=ARGV[counter+1]
        end

        File.open("Alexandar_Apostolov.svg","w") do |svg|
                svg.write(document.to_s)
        end
else
        puts "Wrong Arguments"
end 
