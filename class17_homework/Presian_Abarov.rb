require_relative "Presian_Abarov/graph_to_csv"

d = Drawer.new "Presian_Abarov.svg"
d.start
graph = GraphDrawer.new d
GToCSV.new ARGV[0], graph
graph.draw
d.finish