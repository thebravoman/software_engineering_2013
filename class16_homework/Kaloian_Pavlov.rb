require "./Kaloian_Pavlov/graph_drawer.rb"
vert_count = rand(1..15)
d = Drawer.new "graph.svg", 300, 350
graph = GraphDrawer.new d

d.start

for count in 0..vert_count 
	graph.vs << Vertex.new("#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}")
end

for count in 0..vert_count-1 
	graph.edges << [graph.vs[count],graph.vs[count+1]] 
end

graph.edges << [graph.vs[0],graph.vs[graph.vs.size-1]]

graph.draw

d.finish
