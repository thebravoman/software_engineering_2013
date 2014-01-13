class Plane

attr_accessor:seats

	def initialize
	@seats = Array.new(27) { Array.new(6,0) }
	end
 
 
	def collocation(group)
	flag=0
	r=0
		for r in 0...@seats.length
			if (group==1)
				for s in 0...@seats[0].length
					if (seats[r][s]==0)
						seats[r][s]=1;
						flag=1;
						break
					end
				end
				if (flag==1)
					break
				end
			end
			 if (group == 2) 
				if (seats[r][0] == 0 && seats[r][1] == 0)
					seats[r][0] = 2
					seats[r][1] = 2
					flag = 1
					break
                elsif (seats[r][1] == 0 && seats[r][2] == 0)
					seats[r][1] = 2
					seats[r][2] = 2
					flag = 1
					break;
                elsif (seats[r][3] == 0 && seats[r][4] == 0)
					seats[r][3] = 2
                    seats[r][4] = 2
                    flag = 1
                    break;
                elsif (seats[r][4] == 0 && seats[r][5] == 0) 
					seats[r][4] = 2
                    seats[r][5] = 2
                    flag = 1
                    break;
				end
					
             end		
				if (group==3)
					if (seats[r][0] == 0 && seats[r][1] == 0 && seats[r][2] == 0)
						seats[r][0] = 3
                        seats[r][1] = 3
                        seats[r][2] = 3
                        flag = 1
                        break
					elsif (seats[r][3] == 0 && seats[r][4] == 0 && seats[r][5] == 0)
						 seats[r][3] = 3
                         seats[r][4] = 3
                         seats[r][5] = 3
                         flag = 1
                         break
					
					end
					
				end
				if (r==27 && flag==0)
					return flag
				end
		
		end
		return flag
	end
       
       
       
         def printS
			r=0;
			s=0
			for r in 0...@seats.length
				print "row #{r} -->"
				for s in 0.. @seats[0].length-1
					print seats[r][s]
					if s==2
						print" "
					end
				end
			puts
			end
		end
end
