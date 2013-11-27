require_relative 'Nikolay_Dionisov/graph_drawer.rb'

d = Drawer.new "graph.svg", 300, 350
d.start

graph = GraphDrawer.new d
v1 = Vertex.new("172.16.18.14")
v2 = Vertex.new("172.16.18.10")
v3 = Vertex.new("172.16.18.5")
graph.vs << v1
graph.vs << v2
graph.vs << v3
graph.vs << Vertex.new("172.16.18.1")
graph.vs << Vertex.new("172.16.18.2")
graph.vs << Vertex.new("172.16.18.3")
graph.vs << Vertex.new("172.16.18.4")
graph.vs << Vertex.new("172.16.18.6")
graph.vs << Vertex.new("172.16.18.7")
graph.edges << [v1,v2]
graph.edges << [v2,v3]
graph.draw

d.finish
