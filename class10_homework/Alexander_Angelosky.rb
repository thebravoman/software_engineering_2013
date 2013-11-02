len = ARGV.length;
File.open("Alexander_Angelosky.svg", "w") do |f|
	f.write("<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\">")
	f.write("<line x1=\"600\" y1=\"0\"	x2=\"600\" y2=\"2000\" style=\"stroke:rgb(0,0,0);stroke-width:1\" />")
	f.write("<line x1=\"0\" y1=\"350\" x2=\"2000\" y2=\"350\" style=\"stroke:rgb(0,0,0);stroke-width:1\" />")
end
def line(x1, y1, x2, y2)
	r = (x1*x2+rand(1000))%256;
	g = (x2*y1+rand(1000))%256;
	b = (y1*y2+rand(1000))%256;
	File.open("Alexander_Angelosky.svg", "a") do |f|
		f.write("
		<line x1=\"#{x1}\" y1=\"#{y1}\" x2=\"#{x2}\" y2=\"#{y2}\" style=\"stroke:rgb(#{r.to_i},#{g.to_i},#{b.to_i});stroke-width:2\" />
		")
	end
end
i = 0
while i+1<len
	a = ARGV[i].to_f
	b = ARGV[i+1].to_f
	y1 = 350
	x2 = -600
	x1 = (-b+y1)/a
	y2 = a*x2+b
	line(x1+600, 350-y1, 600+x2, 350-y2)
	i = i + 2
end
File.open("Alexander_Angelosky.svg", "a") do |f|
	f.write("</svg>")
end
