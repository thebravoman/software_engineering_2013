#!/usr/bin/ruby

require_relative 'Emil_Dudev/graph_drawer.rb'

d = Drawer.new "graph.svg", 300, 350
d.start

graph = GraphDrawer.new d

count = ARGV[0].nil? ? 20 : ARGV[0].to_i
count.times { graph.vs << Vertex.new( "" ) }
graph.draw

d.finish

