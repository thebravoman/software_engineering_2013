require 'rexml/document'

	i = 0
	r = 0
	y = 0
	x = 0
	points = []
	
	while ARGV[i].to_i != 0
		points[i] = ARGV[i].to_i
		i+=1
	end
	
	if i % 2 != 0
		puts "wrong number of arguments"
		return -1
	end
	
	doc = REXML::Document.new
	
	def line(doc,x1,y1,x2,y2)
        l = doc.add_element "line"
        l.attributes["x1"] = x1
        l.attributes["x2"] = x2
        l.attributes["y1"] = y1
        l.attributes["y2"] = y2
        l.attributes["style"] = "stroke:rgb(255,0,0);stroke-width:2"
	end
	
	doc = REXML::Document.new
	el_svg = doc.add_element "svg"
	el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
	el_svg.attributes["version"] = "1.1"
	
	line(el_svg,600,0,600,768)
	line(el_svg,0,350,1368,350)
	
	while r < i
		x = points[r].to_i + 600
		r+=1
		y = points[r].to_i*-1 + 350
		r+=1
		line(el_svg,600,y,x,350)
	end
	
	arr = %w[1 2 3]

	File.open("Petur_Pelovski.svg","w") do |f|
		f.write(doc.to_s)
	end
