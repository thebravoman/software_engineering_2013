require_relative "Ivaylo_Hristov/graph_drawer"
require "csv"

d = Drawer.new "Ivaylo_Hristov.svg", 300, 350
d.start
graph = GraphDrawer.new d

IPs = {}

CSV.foreach(ARGV[0]) do |row|
	if IPs[row[0].to_s].nil?
		IPs[row[0].to_s] = Vertex.new(row[0].to_s)
		graph.vs << IPs[row[0].to_s]
	end
	if IPs[row[1].to_s].nil?
			IPs[row[1].to_s] = Vertex.new(row[1].to_s)
			graph.vs << IPs[row[1].to_s]
	end
	graph.edges << [IPs[row[0].to_s],IPs[row[1].to_s]]
end

graph.draw

d.finish
