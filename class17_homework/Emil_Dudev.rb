#!/usr/bin/ruby

require_relative 'Emil_Dudev/vertex.rb'
require_relative 'Emil_Dudev/graph_drawer.rb'
require 'csv'

d = Drawer.new 'Emil_Dudev.svg', 600, 500
d.start

graph = GraphDrawer.new d
vertexes = {}
edges = []

CSV.foreach(ARGV[0]) do |r|
	vertexes[r[0]] = Vertex.new( r[0] ) unless vertexes.has_key? r[0]
	vertexes[r[1]] = Vertex.new( r[1] ) unless vertexes.has_key? r[1]
	edges << [vertexes[r[0]], vertexes[r[1]]]
end

vertexes.each do |v|
	graph.vs << v[1]
end
edges.each do |e|
	graph.edges << e
end

graph.draw
d.finish

