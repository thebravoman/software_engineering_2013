require'rexml/document'

def cs(parent, x1, y1, x2, y2)
        c = parent.add_element "line"
        c.attributes["x1"] = x1
        c.attributes["y1"] = y1
        c.attributes["x2"] = x2
        c.attributes["y2"] = y2
        c.attributes["stroke"] = "black"
        c.attributes["stroke-width"] = "1"
end

def line(parent, x1, y1, x2, y2)
        c = parent.add_element "line"
        c.attributes["x1"] = x1+600
        c.attributes["y1"] = 350-y1.to_i
        c.attributes["x2"] = x2+600
        c.attributes["y2"] = 350-y2.to_i
        c.attributes["stroke"] = "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"
        c.attributes["stroke-width"] = "2"

end


if ARGV.length.even? == false or ARGV.length == 0
        puts "wrong arguments"

else
        doc = REXML::Document.new
        el_svg = doc.add_element "svg"
        el_svg.attributes["version"] = "1.1"
        el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
        cs(el_svg, 600, 50, 600, 650)
        cs(el_svg, 300, 350, 900, 350)        

        i=0
        x1=0
        x2=0
        while ARGV[i] != nil        
                a = ARGV[i].to_i
                hd = ARGV[i+1].to_i
                
                if a == 0
                        y1 = ARGV[count+1]
                        x1 = -300
                        y2 = ARGV[count+1]
                        x2 = 300        
                else
                
                        [300, -300].each do |siv|
                                x = (siv-hd)/a
                                if x.between?(-300,300)
                                        y1 = siv
                                end
                        end
                        [-300, 300].each do |siv|
                                x = (siv-hd)/a
                                if x.between?(-300,300)
                                        y2 = siv
                                end
                        end
                        x1= (y1.to_i-hd)/a
                        x2= (y2.to_i-hd)/a
                end
                line(el_svg,x1,y1,x2,y2)
                i+=2
        end

        File.open("Ivan_Zorov.svg", "w") do |f|
                f.write(doc.to_s)
        end
end
