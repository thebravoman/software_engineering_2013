require_relative 'Maksimiliyan_Bogdanov/graph_drawer.rb'

d = Drawer.new "Maksimiliyan_Bogdanov.svg", 300, 300
d.start

graph = GraphDrawer.new d
loader = GraphLoader.new
loader.graph = graph
loader.load_from_csv(ARGV[0])
graph.draw
d.finish
