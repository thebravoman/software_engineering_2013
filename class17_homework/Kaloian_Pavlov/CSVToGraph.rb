require_relative 'graph_drawer'
require 'csv'

class CsvToGraph

	def initialize input_file,cvs_name="Kaloian_Pavlov.svg",x=300,y=350
		@input_file = input_file
		@text = []
		@vertexes = []
		@edges = []
		@drawer = Drawer.new cvs_name,x,y
		@graph_drawer = GraphDrawer.new @drawer
	end

	def draw_everything
		@drawer.start
		CSV.foreach(@input_file) do |line|
			@text << line
		end
		parse_vertexes
		parse_edges
		push_data
		@graph_drawer.draw
		@drawer.finish
	end

	private

	def	parse_vertexes
		@text.each do |row|
			ele1 = row[0]
			ele2 = row[1]
			@vertexes << ele1 if @vertexes.index(ele1) == nil
			@vertexes << ele2 if @vertexes.index(ele2) == nil
		end
	end

	def vertex_num vert_name
		@vertexes.index vert_name
	end

	def parse_edges
		@text.each do |row|
			source = vertex_num row[0]
			target = vertex_num row[1]
			@edges << [source,target]
		end
	end

	def push_data
		@vertexes.each do |vertex|
			@graph_drawer.add_vertex vertex
		end
		@edges.each do |edge|
			@graph_drawer.add_edge edge[0],edge[1]
		end
	end
end
