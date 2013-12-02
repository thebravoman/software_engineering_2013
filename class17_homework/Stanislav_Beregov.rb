require 'csv'
require_relative "Stanislav_Beregov/graph_drawer.rb"

d = Drawer.new "Stanislav_Beregov.svg", 50, 50
d.start
graph = GraphDrawer.new d


names = {}

CSV.foreach(ARGV[0]) do |line|
	if names[line[0].to_s].nil?
		names[line[0].to_s] = Vertex.new(line[0].to_s)
		graph.vs << names[line[0].to_s]
	end
	if names[line[1].to_s].nil?
		names[line[1].to_s] = Vertex.new(line[1].to_s)
		graph.vs << names[line[1].to_s]
	end
	graph.edges << [names[line[0].to_s],names[line[1].to_s]]
end



graph.draw
d.finish
