class Vertex
        attr_accessor :name
        attr_accessor :x
        attr_accessor :y
        
        def initialize name
                self.name = name
        end
 
        def draw d
				
                d.circle self.x, self.y , 10
                d.circle1 self.x, self.y , 8
                d.circle2 self.x, self.y , 6
                d.circle3 self.x, self.y , 4
                d.circle4 self.x, self.y , 2
                
         
                d.text name, self.x + 10, self.y + 5
        end
end
