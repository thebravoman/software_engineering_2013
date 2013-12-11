require_relative 'Milko_Filipov/graph_drawer.rb'

d = Drawer.new "Milko_Filipov.svg", 600, 300
d.start

graph = GraphDrawer.new d
loader = GraphLoader.new
loader.graph = graph
loader.load_from_csv(ARGV[0])
graph.draw
d.finish
