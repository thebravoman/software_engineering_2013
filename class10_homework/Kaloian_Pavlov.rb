require "rexml/document"
#argv count 
i = 0
# hash with args
a = {}

### Methods ###

## Method 1 ##
def give_line_attr(l_name,x1,x2,y1,y2)
	l_name.attributes["x1"] = x1
	l_name.attributes["x2"] = x2
	l_name.attributes["y1"] = y1
	l_name.attributes["y2"] = y2
	l_name.attributes["stroke-width"] = "3"
end

## Method 2 ##
def draw_line(svg,x1,x2,y1,y2)
	l = svg.add_element "line"
	give_line_attr(l,x1,x2,y1,y2)
	l.attributes["stroke"] = "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"	
end

## Method 3 ##
def make_cord_sys(svg,x1,x2,y1,y2)
	l = svg.add_element "line"
	give_line_attr(l,x1,x2,y1,y2)
	l.attributes["stroke"] = "black" 
end

## Method 4 ##
def shorten_work(the_ele,arg1,arg2,somey)
	   x2 = -350
	   y1 = somey	
	   x1= (-arg2+y1)/arg1
	   y2= arg1*x2 + arg2
	   draw_line(the_ele,x1+600,x2+600,350-y1,350-y2)
end
### End of methods ###

### Check If arguments are ok ###

ARGV.each do |e|
	begin
		a[i] = Float(e)
	rescue
		puts "Bad arguments: non numerical value in arguments."
		abort
	end
	i+=1
end

if i%2 != 0 or i == 0 
	puts "Bad arguments: incorrect amount of arguments."
	abort
end 

### End check ###

### Draw them lines ###
doc = REXML::Document.new
svg_ele = doc.add_element "svg"
svg_ele.attributes["version"] = "1.1"
svg_ele.attributes["xmlns"] = "http://www.w3.org/2000/svg"
make_cord_sys(svg_ele,0,1250,350,350)
make_cord_sys(svg_ele,600,600,0,1000)

argc = 0
while argc < a.size  
   if a[argc] == 0
		x2 = -600
		y1 = a[argc+1]
		x1= 620
		y2= a[argc+1]
		draw_line(svg_ele,x1+600,x2+600,350-y1,350-y2)
   elsif a[argc] < 0
	   shorten_work(svg_ele,a[argc],a[argc+1],-600)
   else
	   shorten_work(svg_ele,a[argc],a[argc+1],350)
   end
   argc+=2
end 
### End draw ###

### Make the file ###
File.open("Kaloian_Pavlov.svg", "w") do |f|
        f.write(doc.to_s)
end
### ###
