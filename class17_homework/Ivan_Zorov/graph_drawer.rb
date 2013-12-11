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
        
        private
        def calculate_positions
		r = 136
		z = (2*Math::PI) / vs.length
                vs.each_index do |n|
                	vs[n].x = r * Math.cos(n * z)
                        vs[n].y = r * Math.sin(n * z) 
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


require 'csv'
class GraphLoader
        attr_accessor :graph
        def add_vertex name
                v = graph.vs.index{ |v| v.name == name }
                if v == nil
                        v = Vertex.new(name)
                        graph.vs << v
                else
                        v = graph.vs[v]
                end
                return v
        end
        def load_from_csv fn
                CSV.foreach(fn) do |row|
                        v1 = add_vertex row[0]
                        v2 = add_vertex row[1]
                        graph.edges << [v1, v2]
                end
        end
end
