require_relative "Denis_Kalfov/drawer.rb"                  
require_relative "Denis_Kalfov/vertex.rb"
require 'csv'

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
            vs[n].x = Math.sin(((360/(vs.size))*n)*Math::PI/180)*(vs.size)*10
            vs[n].y = Math.cos(((360/(vs.size))*n)*Math::PI/180)*(vs.size)*10
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
    

CSV.foreach(ARGV[0])do |row|
    next if row[0]==row[1]

            v=Vertex.new(row[0])
            graph.vs << v

            v1=Vertex.new(row[1])
            graph.vs << v1

            graph.edges << [v,v1]
end


graph.draw

d.finish
puts
puts "File created: Denis_Kalfov.svg"
puts
