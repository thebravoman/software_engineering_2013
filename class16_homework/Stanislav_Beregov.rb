require_relative "Stanislav_Beregov/graph_drawer.rb"

d = Drawer.new "graph.svg", 300, 350
d.start
graph = GraphDrawer.new d
if ARGV[0].nil?
	10.times{ |n| graph.vs << Vertex.new( "192.168.1.10"+n.to_s ) }
else
	ARGV.each{ |arg| graph.vs << Vertex.new( arg.to_s ) }
end
graph.draw
d.finish
