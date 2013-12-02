require_relative "vertex"
require_relative "drawer"
require "csv"
d = Drawer.new "graph.svg", 800,500
d.start

class GraphDrawer
        attr_accessor :vs
        attr_accessor :connections
        
        def initialize drawer
                @drawer = drawer
                self.vs = Array.new(0)
                self.connections = []
        end
        def check_is_exist v,now_index
                vs.each_index do |index|
                        if (index >= now_index)
                                return -1;
                        end
                        if vs[index].name==v.name
                                 return index
                        end
                end
        end
        def draw
                calculate_positions
                draw_connections
                draw_vortexes
        end
        private
        def calculate_positions
                vs.each_index do |n|
                        check_vertex = check_is_exist vs[n],n
                        up = (2*Math::PI)/vs.length
                        circle_radius = vs.length * 10
                        if (check_vertex  == -1)
                                vs[n].x = -circle_radius*Math.cos(n * up)
                                vs[n].y = circle_radius*Math.sin(n * up)
                        else
                                vs[n].x = vs[check_vertex].x;
                                vs[n].y = vs[check_vertex].y;
                        end
                end
        end
        def draw_connections
                connections.each do |conn|
                        v1 = conn[0]
                        v2 = conn[1]
                        x1 = v1.x+10
                        y1 = v1.y+10
                        x2 = v2.x+10
                        y2 = v2.y+10
                        @drawer.set_fill("red")
                        @drawer.line x1,y1,x2,y2
                end
        end
        def draw_vortexes
                vs.each_index do |n|                   
                        @drawer.set_fill
                        vs[n].draw @drawer,vs[n].x,vs[n].y
                end
        end
end

graph_drawer = GraphDrawer.new d

CSV.foreach(ARGV[0]) do |row|
        v1 = Vertex.new(row[0])
        v2 = Vertex.new(row[1])
        
        graph_drawer.vs << v1
        graph_drawer.vs << v2

        graph_drawer.connections << [v1,v2]
end


graph_drawer.draw

d.finish
#`google-chrome graph.svg`
