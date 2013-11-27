require "./Kaloian_Pavlov/graph_drawer.rb"

d = Drawer.new "graph.svg", 300, 350
graph = GraphDrawer.new d

d.start

v1 = Vertex.new("172.16.18.14")
v2 = Vertex.new("172.16.18.10")
v3 = Vertex.new("172.16.18.5")
v4 = Vertex.new("172.16.18.20")
v5 = Vertex.new("172.16.18.25")

graph.vs << v1
graph.vs << v2
graph.vs << v3
graph.vs << v4
graph.vs << v5

graph.edges << [v1,v2]
graph.edges << [v2,v3]
graph.edges << [v3,v4]
graph.edges << [v4,v5]
graph.edges << [v1,v5]

graph.draw

d.finish
