require 'rexml/document'

class Drawer

	attr_writer :file_name
	attr_reader :file_name

	attr_accessor :x
	attr_accessor :y


	def initialize file_name="result.svg",x,y
		self.file_name = file_name
		self.x=x
		self.y=y
	end


	def start
		@doc = REXML::Document.new
		@el_svg = @doc.add_element "svg"
		@el_svg.attributes["version"] = "1.1"
		@el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
	end


	def line x1,y1,x2,y2
		l=@el_svg.add_element "line"
	    l.attributes["x1"]=x1+self.x
	    l.attributes["x2"]=x2+self.x
	    l.attributes["y1"]=self.y - y1
	    l.attributes["y2"]=self.y - y2
	    l.attributes["stroke"]="black"
	    l.attributes["stroke-width"]="2"

	end


	def cs
		line(0,250,0,-250)
		line(250,0,-250,0)
	end


	def text value,x,y
		t=@el_svg.add_element "text"
		t.attributes["x"]=x+self.x
		t.attributes["y"]=self.y-y
		t.text=value
		t.attributes["fill"]="red"

	end	


	def kv 				
		a=ARGV[0].to_f
		b=ARGV[1].to_f
		c=ARGV[2].to_f

		if ARGV[0]==nil
			puts
			puts "Insert 3 arguments!"
			puts
	
		else

			k = @el_svg.add_element "path"
			k.attributes["stroke"]="orange" 
			k.attributes["stroke-width"]="1"
			k.attributes["fill"]="none"

			d=b*b
			h=4*a*c
			d=d-h


				if d<0 
					left_right=450+(-b)/(2*a)
					vrah_sroinost=(-(450-left_right)).round(2)
					text "Vruh na parabolata: #{vrah_sroinost}",-500,270
					print "Vruh na parabolata= ",(-(450-left_right)),"\n"
				
					if a>0
						k.attributes["d"]="M #{left_right} 100 q 150 300 300 0"
						text "D<0 , a>0",-500,250
						print "D<0 , a>0","\n"
					
					elsif a<0
						k.attributes["d"]="M #{left_right} 500 q 150 -300 300 0"
						text "D<0 , a<0",-500,250			
						print "D<0 , a<0","\n"
					end			

				elsif d>0 				

					x1=((-b)-Math.sqrt(d))/(2*a)
					x2=((-b)+Math.sqrt(d))/(2*a)
					left_right=450+(-b)/(2*a)

					puts
					print "x1: ",x1,"\n"
					print "x2: ",x2,"\n"

						if a>0									
							print "D>0 , a>0","\n"			
						
							up_down=(a*((-b)/(2*a))*((-b)/(2*a)))+(b*((-b)/(2*a)))+c
							k.attributes["d"]="M #{590+x1} 50 Q #{600-(450-left_right)} #{600+up_down} #{610+x2} 50"
							
													
							vrah_x=(-(450-left_right)).round(2)
							vrah_y=(up_down).round(2)
							text "D>0 , a>0",-500,270
							text "Vruh na parabolata: (#{vrah_x},#{vrah_y})",-500,250

							puts
							print "horiz-vrah: ",-(450-left_right),"\n"
							print "verticala-vrah: ",up_down,"\n"
						
						end

						if a<0									
							print "D>0 , a<0","\n"
							
							up_down=450-((a*((-b)/(2*a))*((-b)/(2*a)))+(b*((-b)/(2*a)))+c)
							k.attributes["d"]="M #{590+x1} 550 Q #{600-(450-left_right)} #{-(-450+up_down)} #{610+x2} 550"

							vrah_x=(-(450-left_right)).round(2)
							vrah_y=(-((up_down-440)-10)).round(2)
							text "D>0 , a<0",-500,270
							text "Vruh na parabolata: (#{vrah_x},#{vrah_y})",-500,250

							puts
							print "horiz-vrah: ",(-b)/(2*a),"\n"
							print "verticala-vrah: ",-(up_down-450),"\n"

						end

				elsif d==0	
					xx1=(-b)/(2*a)
					left_right=xx1+450

					if a>0	
						print "D=0 , a>0","\n"															
						print "xx1: ",xx1,"\n"
						
						k.attributes["d"]="M #{left_right} 150 q 150 300 300 0"

						text "D=0 , a>0",-500,270
						text "Vruh na parabolata: (#{xx1.round(2)},0)",-500,250

					elsif a<0		

						print "D=0 , a<0","\n"											
						print "xx1: ",xx1,"\n"
					
						k.attributes["d"]="M #{left_right} 450 q 150 -300 300 0"

						text "D=0 , a<0",-500,270
						text "Vruh na parabolata: (#{xx1.round(2)},0)",-500,250
					
					end

				end


		end #If ARGV[0]==nil
	
	end # def kv

	
	def finish
		File.open("Denis_Kalfov.svg", "w") do |f|
			f.write(@doc.to_s)
		end
	end

end

d=Drawer.new "Denis_Kalfov.svg",600,300
d.start
d.kv
d.cs
d.finish
