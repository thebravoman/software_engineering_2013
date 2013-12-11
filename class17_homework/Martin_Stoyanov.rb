require_relative "Martin_Stoyanov/graph_drawer"
require 'csv'

d = Drawer.new "Martin_Stoyanov.svg"
d.start
graph = GraphDrawer.new d

CSV.foreach(ARGV[0]) do |row|
        v1 = Vertex.new(row[0].to_s)
        v2 = Vertex.new(row[1].to_s)      
        graph.vs << v1
        graph.vs << v2
        graph.connections << [v1,v2]
end

graph.draw

d.finish
