require_relative 'Luben_Temelakiev/graph_drawer.rb'

d = Drawer.new "Luben_Temelakiev.svg", 300, 350
d.start

graph = GraphDrawer.new d
loader = GraphLoader.new
loader.graph = graph
loader.load_from_csv(ARGV[0])
graph.draw
d.finish
