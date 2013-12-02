require_relative 'Ivan_Zorov/graph_drawer.rb'

d = Drawer.new "Ivan_Zorov.svg", 333, 369
d.start

graph = GraphDrawer.new d
loader = GraphLoader.new
loader.graph = graph
loader.load_from_csv(ARGV[0])
graph.draw
d.finish
