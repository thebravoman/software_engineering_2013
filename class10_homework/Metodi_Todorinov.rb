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
        unless ARGV.length.odd? || ARGV.length < 2
        doc = REXML::Document.new
        el_svg = doc.add_element "svg"
        el_svg.attributes["version"] = "1.1"
        el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
        coord_sys(el_svg,300,900,350,350)
        coord_sys(el_svg,600,600,50,650)


k = ARGV[1]
i = 0


   while k != nil 
        y1=150
        x2=-150
        x1=(-ARGV[i+1].to_f+y1)/ARGV[i].to_f
        y2=(ARGV[i].to_f*x2)+ARGV[i+1].to_f
        line(el_svg,x1+600,x2+600,350-y1,350-y2)
        i+=2
        k=ARGV[i+1]
 end




File.open("Metodi_Todorinov.svg", "w") do |b|
b.write(doc.to_s)
end
else
puts "Invalid Arguments"
end
