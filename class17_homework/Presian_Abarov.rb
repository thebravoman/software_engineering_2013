require_relative "Presian_Abarov/csv_to_graph"

d = Drawer.new "Presian_Abarov.svg"
d.start
graph = GraphDrawer.new d
CSVToG.new ARGV[0], graph
graph.draw
d.finish