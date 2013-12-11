require_relative 'graph_drawer'
require 'CSV'

class CSVtoGraph

	def initialize input_file,output_file="csv_to_graph.svg",x=300,y=350
		@input = input_file
		@lines = []
		@vertices = []
		@edges = []
		@drawer = Drawer.new output_file,x,y
		@drawer.start
		@graph_drawer = GraphDrawer.new @drawer
	end
	
	def draw
		read 
		parse_vertices
		parse_edges
		push_data
		@graph_drawer.draw
		@drawer.finish
	end
	
	private
	def read
		CSV.foreach(@input) do |row|
			@lines << row
		end
	end
	
	def	parse_vertices
		@lines.each do |line|
			el1 = line[0]
			el2 = line[1]
			@vertices << el1 if @vertices.index(el1) == nil
			@vertices << el2 if @vertices.index(el2) == nil
		end
	end
	
	def parse_edges
		@lines.each do |line|
			source = vertex_id line[0]
			target = vertex_id line[1]
			@edges << [source,target]
		end
	end
	
	def push_data
		@vertices.each do |vertex|
			@graph_drawer.add_vertex vertex
		end
		@edges.each do |edge|
			@graph_drawer.add_edge edge[0],edge[1]
		end
	end
	
	def vertex_id vname
		@vertices.index vname
	end
	
end
