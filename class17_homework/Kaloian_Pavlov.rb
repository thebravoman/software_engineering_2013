require_relative "Kaloian_Pavlov/CSVToGraph"

my_drawer = CsvToGraph.new "Kaloian_Pavlov/SomeIps.csv", "Kaloian_Pavlov.svg", 500, 350 
my_drawer.draw_everything
