require_relative 'Martin_Stoyanov/graph_drawer'
require_relative 'Martin_Stoyanov/vertex'
require_relative 'Martin_Stoyanov/drawer'

d = Drawer.new "Martin_Stoyanov.svg", 300,350
graph = GraphDrawer.new d
d.start

8.times do
	graph.vs << Vertex.new("#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}")
end
n=0
graph.vs.each_index do |n|
	graph.connections << [graph.vs[n],graph.vs[n+1]]
	n+=1
	break if n==8
end
graph.draw
d.finish
