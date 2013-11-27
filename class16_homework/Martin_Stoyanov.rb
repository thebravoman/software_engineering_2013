require_relative 'Martin_Stoyanov/graph_drawer'
require_relative 'Martin_Stoyanov/vertex'
require_relative 'Martin_Stoyanov/drawer'

d = Drawer.new "Martin_Stoyanov.svg", 300,350
graph = GraphDrawer.new d
d.start

#8.times do
#	graph.vs << Vertex.new("#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}")
#end
#n=0
#graph.vs.each_index do |n|
#	graph.connections << [graph.vs[n],graph.vs[n+1]]
#	n+=1
#	break if n==8
#end                                    #loops too hard for me, I'll go with ugliness.
v1 = Vertex.new("172.16.18.19")        
v2 = Vertex.new("172.16.18.666")
v3 = Vertex.new("172.16.18.99")
v4 = Vertex.new("172.16.18.42")
v5 = Vertex.new("172.16.18.420")
v6 = Vertex.new("172.16.18.332")
graph.vs << v1
graph.vs << v2
graph.vs << v3
graph.vs << v4
graph.vs << v5
graph.vs << v6
graph.connections << [v1,v2]
graph.connections << [v3,v2]
graph.connections << [v1,v6]
graph.connections << [v5,v4]
graph.connections << [v6,v5]
graph.connections << [v4,v3]
graph.connections << [v3,v2]

graph.draw
d.finish
