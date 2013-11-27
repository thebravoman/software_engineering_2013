require_relative "Denis_Kalfov/drawer.rb"                  
require_relative "Denis_Kalfov/vertex.rb"

d = Drawer.new "Denis_Kalfov.svg", 300, 330
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

        vs.each_index do |n|
            vs[n].x = Math.sin(((360/(vs.size))*n)*Math::PI/180)*(vs.size)*30
            vs[n].y = Math.cos(((360/(vs.size))*n)*Math::PI/180)*(vs.size)*30
        end

end
    
    def draw_edges
        edges.each do |vertexes|
            x1 = vertexes[0].x
            y1 = vertexes[0].y
            x2 = vertexes[1].x
            y2 = vertexes[1].y
            @drawer.line_green x1,y1,x2,y2
        end
    end

    def draw_vertexes
        vs.each { |v| v.draw @drawer }
    end
        
end

graph = GraphDrawer.new d
v1 = Vertex.new("172.16.18.14")
v2 = Vertex.new("172.16.18.10")
v3 = Vertex.new("172.16.18.5")
v4 = Vertex.new("172.16.18.15")
v5 = Vertex.new("172.16.18.0")
v6 = Vertex.new("172.16.18.11")


graph.vs << v1
graph.vs << v2
graph.vs << v3
graph.vs << v4
graph.vs << v5
graph.vs << v6


graph.edges << [v1,v2]
graph.edges << [v2,v3]
graph.edges << [v3,v4]
graph.edges << [v4,v5]
graph.edges << [v5,v6]
graph.edges << [v1,v6]

graph.draw

d.finish
puts
puts "File created: Denis_Kalfov.svg"
puts
