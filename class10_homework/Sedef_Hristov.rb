require 'rexml/document'


def c_system(parent,x1,x2,y1,y2)

c = parent.add_element "line"
c.attributes["x1"] = x1
c.attributes["x2"] = x2
c.attributes["y1"] = y1
c.attributes["y2"] = y2
c.attributes["stroke"] = "black"
c.attributes["stroke-width"] = "2"

end


def line(parent, x1,x2,y1,y2)

a= parent.add_element "line"
a.attributes["x1"] = x1
a.attributes["x2"] = x2
a.attributes["y1"] = y1
a.attributes["y2"] = y2
a.attributes["stroke"] = "blue"
a.attributes["stroke-width"] = "2"
end




unless ARGV.length.odd? || ARGV.length < 1

doc = REXML::Document.new
el_svg = doc.add_element "svg"
el_svg.attributes["version"] = "1.1"
el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
c_system(el_svg,300,900,350,350)
c_system(el_svg,600,600,50,650)

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


File.open("Sedef_Hristov.svg", "w") do |b|
b.write(doc.to_s)
end

else 

puts"Write corectly !!!"
end
