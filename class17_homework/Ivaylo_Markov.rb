require_relative 'Ivaylo_Markov/csv_graph'

graph = CSVtoGraph.new ARGV[0],"Ivaylo_Markov.svg",400,350
graph.draw
