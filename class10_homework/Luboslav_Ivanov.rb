require 'rexml/document'

point1 = Array.new
point2 = Array.new
cs_color = "#000000" 

def line(parrent,color,point1,point2)
	l=parrent.add_element"line"
	l.attributes["x1"] = point1[0]
	l.attributes["y1"] = point1[1]
	l.attributes["x2"] = point2[0]
	l.attributes["y2"] = point2[1]
	l.attributes["style"] = "stroke:#{color};stroke-width:2"
end

def coordinate_system(parrent,color,x,y) #x,y center(600, 350)
right1 = [x, y]
right2 = [x.to_i+400, y]
top1 = [x, y]
top2 = [x,y.to_i+400]
bottom1= [x, y]
bottom2 = [x, y.to_i-400] 
left1 = [x, y]
left2 = [x.to_i-400, y]
line(parrent,color,right1,right2)
line(parrent,color,top1,top2)
line(parrent,color,bottom1,bottom2)
line(parrent,color,left1,left2)
end

doc = REXML::Document.new
el_svg=doc.add_element"svg"
el_svg.attributes["version"] = "1.1"
el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"



coordinate_system(el_svg,cs_color,600, 350)

if ARGV.length < 2
	puts "WARNING: Not enough arguments!"
elsif ARGV.length % 2 == 1
	puts "WARNING: You must have even number of arguments! "
else
	i=0
	while i <= ARGV.length-1
		color = "%06x" % (rand * 0xffffff)
		random_color = "#" + "#{color}"

		x1 = 150
		x2 = -150
		y1 = ARGV[i].to_i * x1 + ARGV[i+1].to_i 
		y2 = ARGV[i].to_i * x2 + ARGV[i+1].to_i
		
		point1[0] = 600 + x1.to_i
		point2[0] = 600 + x2.to_i
	
		point1[1] = 350 - y1
		point2[1] = 350 - y2

	line(el_svg,random_color,point1,point2)
	i=i+2
	end
end


File.open("Luboslav_Ivanov.svg", "w") do |f|
	f.write(doc.to_s)
end 
