class Messages
	
	def groupMsg numberOfGroups,group
		print "Group #{numberOfGroups+1} consists of #{group}", (group > 1) ?  " people" : " person"
	end
	
	def fillMsg takenSeats,numberOfGroups,takenRows,seatsPerRow,freeseats
		puts "Passenger #{takenSeats} of group #{numberOfGroups+1} has been placed in row #{takenRows+1}, seat #{seatsPerRow-freeseats}"
	end
	
	def exitMsg
		at_exit{puts "Not enough space in the plane"}
	end
	
	def keyMsg
		print "Press Enter"
	end
	
	def noSpace group
 		print"No space for a group of #{group} people. Please find a new group."
		puts
	end
end