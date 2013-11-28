require_relative "graph_drawer"

d = Drawer.new "Ivan_Zorov.svg", 300, 350
d.start

graph = GraphDrawer.new d
v1 = Vertex.new("172.16.18.14")
v2 = Vertex.new("172.16.18.10")
v3 = Vertex.new("172.16.18.9")
v4 = Vertex.new("172.16.23.6")
v5 = Vertex.new("199.16.18.3")
v6 = Vertex.new("133.36.89.69")
v7 = Vertex.new("123.39.69.89")
v8 = Vertex.new("255.255.255.255")
graph.vs << v1
graph.vs << v2
graph.vs << v3
graph.vs << v4
graph.vs << v5
graph.vs << v6
graph.vs << v7
graph.vs << v8
graph.edges << [v1,v2]
graph.edges << [v2,v3]
graph.edges << [v3,v4]
graph.edges << [v4,v5]
graph.edges << [v5,v6]
graph.edges << [v6,v7]
graph.edges << [v7,v8]
graph.edges << [v8,v1]
graph.draw

d.finish
