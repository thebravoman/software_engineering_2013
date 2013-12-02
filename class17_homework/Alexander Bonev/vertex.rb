class Vertex
        attr_accessor :name
        attr_accessor :x
        attr_accessor :y
        
        def initialize name
                self.name = name
        end
        
        def draw d
                d.circle self.x, self.y , 10
                d.text name, self.x + 15, self.y + 10
        end
end
