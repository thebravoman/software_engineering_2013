require_relative "Ivaylo_Hristov/graph_drawer"

ARGV.empty? ? vs_count = 10 : vs_count = ARGV[0].to_i

d = Drawer.new "Ivaylo_Hristov.svg", 300, 350
d.start
graph = GraphDrawer.new d

vs_count.times do 
	graph.add_vertex("#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}")
end

for line in 0...vs_count-1
	graph.add_edge line,line+1
end
graph.add_edge vs_count-1,0

graph.draw

d.finish
