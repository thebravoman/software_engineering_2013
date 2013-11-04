require 'rexml/document'
x=600
y=350

def line(doc,x1,y1,x2,y2,a)
    c = doc.add_element "line"
    c.attributes["x1"] = x1
    c.attributes["y1"] = y1
    c.attributes["x2"] = x2
    c.attributes["y2"] = y2
    c.attributes["stroke-width"] = "2"
    c.attributes["stroke"] = a
end

if ARGV.length > 1 && ARGV.length.odd? == false
doc = REXML::Document.new
el_svg = doc.add_element "svg"
el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
el_svg.attributes["version"] = "1.1"
line(el_svg,100,y,1100,y,"black")
line(el_svg,x,50,x,650,"black")

(1..ARGV.length).each do |i|
if i%2!=0
y1=180
x2=-180
x1=(-ARGV[i].to_i+y1)/ARGV[i-1].to_i
y2=(ARGV[i-1].to_i*x2)+ARGV[i].to_i
line(el_svg,x1+x,y-y1,x2+x,y-y2,"rgb(#{rand(255)},#{rand(255)},#{rand(255)})")

end
end

File.open("Asen_Stoilov.svg", "w") do |f|
    f.write(doc.to_s)
end
else puts "ARGUMENTS ARE WRONG "
end
