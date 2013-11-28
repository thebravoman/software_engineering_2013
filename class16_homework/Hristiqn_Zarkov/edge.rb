class Edge
        attr_accessor :sorce
        attr_accessor :target 
        def initialize v1,v2
                sorce = v1
                v1.edges << self
                target = v2
                v2.edges << self
        end
        def draw d,x1,y1,x2,y2
                d.line(x1,y1,x2,y2)
        end
end
