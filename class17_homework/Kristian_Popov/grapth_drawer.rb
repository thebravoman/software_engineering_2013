require_relative "drawer"
require_relative "vertex"

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
        
        def add_vertex name
                        element = Vertex.new(name)
                        self.vs << element
        end        
        
        def add_edge v1,v2
                edges << [vs[v1], vs[v2]]
        end
        
        private
        def calculate_positions
                vs.each_index do |n|
                        vs[n].x = 200*Math.sin(n * ((2*Math::PI)/vs.length))
                        vs[n].y = 100*Math.cos(n * ((2*Math::PI)/vs.length))
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
                vs.each { |v|        v.draw @drawer }
        end
        
end
