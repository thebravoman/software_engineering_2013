require_relative "drawer"
require_relative "vertex"
require_relative "csv_to_graph"

d = Drawer.new "Alexander_Bonev.svg", 600, 350
d.start

class GraphDrawer
        
        attr_accessor :vs
        attr_accessor :edges
        
        def initialize drawer
                @drawer = drawer
                self.vs = []
                self.edges = []
        end
        
        def draw
                calculate_positions
                draw_vertexes
                draw_edges
        end        
        
        private
        def calculate_positions

step = (Math::PI*2.0)/vs.size
                curr = 0
                vs.each_index do |n|
                        vs[n].x = Math.cos(curr)*200
                        vs[n].y = Math.sin(curr)*200
                        curr += step
                end
        end
        
        def draw_edges
                edges.each do |vertexes|
                        x1 = vertexes[0].x
                        y1 = vertexes[0].y
                        x2 = vertexes[1].x
                        y2 = vertexes[1].y
                        @drawer.line x1,y1,x2,y2
                end
        end

        def draw_vertexes
                vs.each { |v|        v.draw @drawer}
        end
        
end



graph_drawer = GraphDrawer.new d

c = CsvParser.new 
c.parser

graph_drawer.vs = c.get_vertex
graph_drawer.edges = c.edges_collector

graph_drawer.draw




d.finish
