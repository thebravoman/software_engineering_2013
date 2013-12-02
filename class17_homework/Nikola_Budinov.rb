require_relative 'Nikola_Budinov/graph_drawer.rb'

d = Drawer.new "Nikola_Budinov.svg", 450, 350
d.start
graph = GraphDrawer.new d
loader = GraphLoader.new
loader.graph = graph
loader.load_from_csv(ARGV[0])
graph.draw

d.finish
