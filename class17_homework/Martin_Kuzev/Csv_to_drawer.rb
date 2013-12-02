require_relative 'graph_drawer'
require 'csv'

class Csv_Vertexes

        def initialize input,name="Martin_Kuzev.svg",x=300,y=350
                @input = input
                @text = []
                @vertexes = []
                @edges = []
                @drawer = Drawer.new name,x,y
                @graph_drawer = GraphDrawer.new @drawer
        end
        
        def draw_them
                @drawer.start
                CSV.foreach(@input) do |line|
                        @text << line
                end
                parse_vertexes
                parse_edges
                push_data
                @graph_drawer.draw
                @drawer.finish
        end
        
private
        
        def read_csv
                CSV.foreach(@input) do |line|
                        @text << line
                end
        end
        
        def	parse_vertexes
                @text.each do |row|
                        el1 = row[0]
                        el2 = row[1]
                        @vertexes << el1 if @vertexes.index(el1) == nil
                        @vertexes << el2 if @vertexes.index(el2) == nil
                end
        end
        
        def	parse_edges
                @text.each do |row|
                        source = vertex_id row[0]
                        target = vertex_id row[1]
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
        
        def vertex_id vname
                @vertexes.index vname
        end
        
end
