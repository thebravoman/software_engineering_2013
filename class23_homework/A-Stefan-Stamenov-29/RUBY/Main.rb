require 'Plane'

class Main


	plane=Plane.new
	people=0
	group=0
	print "The default values of the seats in the plane\n"
	plane.printS
	print "-------------------------------\n"
	print "Please press Enter to continiute ...\n"
	while (people<162)
		gets
		num = 1 + rand(3)
		print "number of people which is getting in : "
		print num
		print "\n"
		if(plane.collocation(num)==1)
			people=people+num
		end
		print "Plane Status : \n"
		plane.printS
		print "------------------------\n"
		print "Number of people in the plane : \n"
		print people
		print "\n"
		if (people==162)
			print "Plane is full\n"
		else
			print "Please press Enter to continiute ...\n"
		end
	end


end
