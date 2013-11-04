require 'rexml/document'

def cherta(svg)
        a = Random.new
        line = svg.add_element "polyline"
        line.attributes["style"] = "fill:white;stroke:rgb(#{a.rand(0..255)},#{a.rand(0..255)},#{a.rand(0..255)});stroke-width:3"
        line.attributes["points"] = ""
        return line
end

def points(line, x, y)
        line.attributes["points"] << " #{x+600},#{y+350}"
end
def draw(line, arg)
        [-300, 300].each do |x|
                y = arg[0]*x + arg[1]
	if y.between?(-300,300)
                points(line, x, y) 
        end
	end
        return if arg[0] == 0

        [-300, 300].each do |y|
                x = (y - arg[1])/arg[0]
	if x.between?(-300,300)
                points(line, x, y) 
        end
	end
end

if ARGV.length.odd? || ARGV.length < 2
	 print "Bad arguments!\n"
else
doc = REXML::Document.new
        el_svg = doc.add_element "svg"
        el_svg.attributes["version"] = "1.1"
        el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"

        grid = []
        0.upto(1) do |i|
                grid << cherta(el_svg)
                grid[i].attributes["style"] = "fill:white;stroke:black;stroke-width:1"
        end
        points(grid[0], -300, 0)
        points(grid[0], 300, 0)
        points(grid[1], 0, -300)
        points(grid[1], 0, 300)

        args = []
        ARGV.each_slice(2) {|a| args << [-a[0].to_i, -a[1].to_i] }
        args.each do |arg|
                line = cherta(el_svg)
                draw(line, arg)
        end

        File.open("Martin_Kuzev.svg", "w") do |f|
                f.write(doc.to_s)
        end
end
