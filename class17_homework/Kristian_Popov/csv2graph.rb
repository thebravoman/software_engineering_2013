require_relative 'graph_drawer'
require 'csv'

class CsvToGraph

        def initialize output="Kristian_Popov.svg",x=256,y=256
                @text = []
                @vertexes = []
                @edges = []
                @drawer = Drawer.new output,x,y
                @graph_drawer = GraphDrawer.new @drawer
        end
        
        def draw
                @drawer.start
                read_csv
                parse_vertexes
                parse_edges
                push_data
                @graph_drawer.draw
                @drawer.finish
        end
        
private
        
        def read_csv
                CSV.foreach("Kristian_Popov/data.csv") do |line|
                        @text << line
                end
        end
        
        def        parse_vertexes
                @text.each do |row|
                        elem1 = row[0]
                        elem2 = row[1]
                        @vertexes << elem1 if @vertexes.index(elem1) == nil
                        @vertexes << elem2 if @vertexes.index(elem2) == nil
                end
        end
        
        def parse_edges
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
