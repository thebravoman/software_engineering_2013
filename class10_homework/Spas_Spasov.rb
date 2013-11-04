require 'rexml/document'

def coordinate_system(doc,x1,y1,x2,y2,red=131,green=131,blue=131)
        cs=doc.add_element "line"
        cs.attributes["x1"]=x1
        cs.attributes["y1"]=y1
        cs.attributes["x2"]=x2
        cs.attributes["y2"]=y2
        cs.attributes["stroke"]="rgb(#{red},#{green},#{blue})"
        cs.attributes["stroke-width"]="3"
end

unless ARGV.length.odd? || ARGV.length < 1 
	doc=REXML::Document.new
	el_svg = doc.add_element "svg"
	el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
	el_svg.attributes["version"] = "1.1"
	coordinate_system(el_svg,300,350,900,350)
	coordinate_system(el_svg,600,50,600,650)

        arg = ARGV[1]
        count = 0
        while arg != nil
        y1=150
        x2=-150
        x1=(-ARGV[count+1].to_i+y1)/ARGV[count].to_i
        y2=(ARGV[count].to_i*x2)+ARGV[count+1].to_i
        coordinate_system(el_svg,x1+600,350-y1,x2+600,350-y2,red=Random.rand(255),green=Random.rand(255),blue=Random.rand(255))
        count+=2
        arg=ARGV[count+1]
        end

        File.open("Spas_Spasov.svg","w") do |svg|
        svg.write(doc.to_s)
        end
else
        puts "Invalid arguments!"
end
