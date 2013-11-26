require_relative "drawer"

class MathDrawer
	
	def initialize drawer
		@drawer = drawer
	end
	
	def line a,b
		@drawer.line 0,b,(-b/a),0
	end
	
end

d = Drawer.new "math.svg", 350, 300
d.start
d.cs

m = MathDrawer.new d
m.line 1, 100

d.finish
