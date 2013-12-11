require 'csv'
require_relative 'Luboslav_Ivanov/drawer'
require_relative 'Luboslav_Ivanov/vertex'
require_relative 'Luboslav_Ivanov/graph_drawer'

d = Drawer.new "Luboslav_Ivanov.svg",600, 350
d.start
graph = GraphDrawer.new d
data = CSV.read(ARGV[0])
vertexes = Hash.new(0)
i = 1
index = 0
data.each do |row|
	vx = []
	row.each do |v|
		if vertexes[v] == 0
			vertexes[v] = i
			i += 1
			graph.vs << Vertex.new(v)
		end
		vx[index] = graph.vs[vertexes[v].to_i-1]
		index += 1
	end
	graph.connections << vx
	index = 0
end
graph.draw
d.finish


