require 'rexml/document'

        def line(svg,x1,x2,y1,y2,red=0,green=0,blue=0)
                l=svg.add_element "line"
                l.attributes["x1"]=x1
                l.attributes["x2"]=x2
                l.attributes["y1"]=y1
                l.attributes["y2"]=y2
                l.attributes["stroke"]="rgb(#{red},#{green},#{blue})"
                l.attributes["stroke-width"]="2"
        end

        doc=REXML::Document.new
                el_svg=doc.add_element "svg"
                el_svg.attributes["version"]="1.1"
                el_svg.attributes["xmlns"]="http://www.w3.org/2000/svg"
                        line(el_svg,0,900,350,350)
                        line(el_svg,600,600,0,900)
                c=ARGV[1]
                i=0

                while c!=nil
                        y1=150
                        x2=-150
                        x1=(-ARGV[i+1].to_i+y1)/ARGV[i].to_i
                        y2=(ARGV[i].to_i*x2)+ARGV[i+1].to_i
                        line(el_svg,x1+600,x2+600,350-y1,350-y2,red=rand(255),green=rand(255),blue=rand(255))
                i+=2
                c=ARGV[i+1]
        end

File.open("Asen_Panayotov.svg","w") do |svg|
        svg.write(doc.to_s)
end
