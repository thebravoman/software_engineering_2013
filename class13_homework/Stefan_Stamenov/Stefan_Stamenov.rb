require "drawer"

class MathDrawer
	
	def initialize d
		@drawer = d
	end
	
	def text value, x, y
		@drawer.text value,x,y
	end
	
	def path x1,y1,x2,y2,x3,y3
		@drawer.path x1,y1,x2,y2,x3,y3
	end
	
end

d = Drawer.new "qfunc.svg",600,300
d.start
d.cs

m = MathDrawer.new d

a=ARGV[0].to_f
b=ARGV[1].to_f
c=ARGV[2].to_f

if a==nil || ARGV.length!=3
	puts "Please,Puts A,B and C"
elsif a==0 || b==0 || c==0
	puts "This is not a quadrat function"

elsif a!=0 && b!=0 && c!=0
  x2=-(b/(2*a))
  y2=(x2*x2*a)+(x2*b)+c
  x1=x2-15
  y1=(x1*x1*a)+(x1*b)+c
  x3=x2+15
  y3=(x3*x3*a)+(x3*b)+c
  m.path x1,y1,x2-x1,(y1-y2)*2,x3-x1,0
  m.text "A=#{a}",-250,230
  m.text "B=#{b}",-250,215
  m.text "C=#{c}",-250,200
end 

d.finish
