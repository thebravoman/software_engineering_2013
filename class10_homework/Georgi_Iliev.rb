	

    require "rexml/document"
     
    def line(doc,x1,y1,x2,y2,a,b,c)
      l = doc.add_element "line"
      l.attributes["x1"] = x1
      l.attributes["x2"] = x2
      l.attributes["y1"] = y1
      l.attributes["y2"] = y2
      l.attributes["stroke"] == "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"
    end
     
    def c_system(doc,x1,x2,y1,y2)
            l = doc.add_element "line"
            l.attributes["x1"] = x1
            l.attributes["x2"] = x2
            l.attributes["y1"] = y1
            l.attributes["y2"] = y2
            l.attributes["stroke-width"] = "3"
            l.attributes["stroke"] = "rgb(0,0,0)"
    end
     
    doc = REXML::Document.new
    el_svg = doc.add_element "svg"
    el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
    el_svg.attributes["version"] = "1.1"
     
    unless ARGV.length.odd? || ARGV.length < 1
     
            c_system(el_svg,300,900,350,350)
            c_system(el_svg,600,600,50,650)
     
     
            counter = 0
            crasher = ARGV[1]
            unless !(crasher == nil)
            y1=150
            y2=(ARGV[counter].to_i*x2)+ARGV[counter+1].to_i
            x2=-150
            x1=(-ARGV[counter+1].to_i+y1)/ARGV[counter].to_i
           
            drawl(el_svg,x1+600,x2+600,350-y1,350-y2)
            counter+=2
            crasher_arg=ARGV[counter+1]
            end
     
    File.open("Georgi_Iliev.svg","w") do |wr_svg|
           wr_svg.write(doc.to_s)
            end
    else
    puts"Not Good Arguments "
     
    end

