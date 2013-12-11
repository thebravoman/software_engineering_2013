require_relative "csv_graph"

my_drawer = CsvToGraph.new "graph_input.csv", "Martin_Ivanov.svg", 500, 350 
my_drawer.draw

