require './Alexandar_Apostolov/graph_drawer.rb'
require 'csv'

file_name = ARGV[0]

dr = Drawer.new "Apostolov.svg", 350, 350
dr.start

g_dr = GraphDrawer.new dr

CSV.foreach(file_name) do |row|
	v_n1 = row[0]
	v_n2 = row[1]
	
	v1 = Vertex.new(v_n1)
	g_dr.vs << v1

	v2 = Vertex.new(v_n2)
	g_dr.vs << v2

	g_dr.connections << [v1,v2]
end

g_dr.draw
dr.finish
