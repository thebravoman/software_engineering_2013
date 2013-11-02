require "rexml/document"
def line(doc,x1,y1,x2,y2,a,b,c)
  l = doc.add_element "line"
  l.attributes["x1"] = x1
  l.attributes["x2"] = x2
  l.attributes["y1"] = y1
  l.attributes["y2"] = y2
  l.attributes["style"] = "stroke:rgb(#{a},#{b},#{c});stroke-width:2"
end
 
doc = REXML::Document.new
el_svg = doc.add_element "svg"
el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
el_svg.attributes["version"] = "1.1"

if ARGV.length != 0 && ARGV.length.even?
  line(el_svg,0,350,1200,350,0,0,0)
  line(el_svg,600,0,600,700,0,0,0)
  x_ = 600
  y_ = 350
  arr = []
  
  ARGV.each do |element|
    if element =~ /-/
      el = element.to_i
      arr << el
    else
      arr << element.to_i
    end
  end
  
  count = ARGV.length / 2
  count.times do |i|
    a = arr[i*2]
    b = arr[i*2+1]
    x = -b/a
    y = b
    line(el_svg,x_+x,y_,x_,y_-y,rand(255),rand(255),rand(255))
  end

  File.open("Mihail_Kirilov.svg","w") do |f|
    f.write(doc.to_s)
  end
else
  p "This cannot happen"
  p "Wrong number of Arguments"
end
