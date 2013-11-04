require 'rexml/document'

def line(parent,x1,x2,y1,y2,red=0,green=0,blue=0)
	line=parent.add_element "line"
    line.attributes["x1"]=x1
    line.attributes["x2"]=x2
    line.attributes["y1"]=y1
    line.attributes["y2"]=y2
    line.attributes["stroke"]="rgb(#{red},#{green},#{blue})"
    line.attributes["stroke-width"]="2"
end	

doc = REXML::Document.new
el_svg=doc.add_element "svg"
el_svg.attributes["version"]="1.1"
el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"

if ARGV[0]==nil
	puts "No arguments..."
else 
	i=0
	while ARGV[i]!=nil

		if ARGV[i].to_f>0 && ARGV[i+1].to_f>0
			y1=250
			x2=-250
		elsif ARGV[i].to_f<0 && ARGV[i+1].to_f<0
			y1=-280
			x2=-190
		elsif ARGV[i].to_f>0 && ARGV[i+1].to_f<0
			y1=300
			x2=-200
		elsif ARGV[i].to_f<0 && ARGV[i+1].to_f>0
  			y1=-280
			x2=-90
		end      

		line(el_svg,300,900,350,350)
		line(el_svg,600,600,50,650)
        x1=-ARGV[i+1].to_f+y1
        x1=x1/ARGV[i].to_f
        y2=(ARGV[i].to_f*x2)
        y2=y2+ARGV[i+1].to_f
        line(el_svg,x1+600,x2+600,350-y1,350-y2,red=Random.rand(255),green=Random.rand(255),blue=Random.rand(255))

		i+=2
	end
end

File.open("Denis_Kalfov.svg","w") do |f|
	f.write(doc.to_s)
end




