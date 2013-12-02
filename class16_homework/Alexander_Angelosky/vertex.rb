require_relative "drawer"

class Vertex
        
        attr_accessor :name
        attr_accessor :x
        attr_accessor :y
        
        def initialize name
                self.name = name
        end
        
        def draw drawer
                drawer.circle self.x,self.y,20
                drawer.text name, self.x-5,self.y-5
        end
end
