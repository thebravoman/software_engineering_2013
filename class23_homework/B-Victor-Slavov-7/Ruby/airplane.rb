array = [[]]

i1 = 1
i = 1

while i <= 27
	while i1 <= 6
		(array[i] ||= [])[i1] = 0
		i1 = i1 + 1
	end
	i = i + 1
	i1 = 1
end

passengers = 0
i = 1
i1 = 1
trigger = 0
passengers_count = 0

while passengers_count < 6 * 27
	while i <= 27
		while i1 <= 6
			print (array[i] ||= [])[i1]
			print " "
			if(i1 == 3)
				print "  "
			end
			i1 = i1 + 1
		end
		puts
		i = i + 1
		i1 = 1;
	end
	i = 1;
	i1 = 1;
	
	gets
	
	if trigger == 1
		passengers = rand(1..2)
	else
		if trigger == 2
			passengers = 1
		else
			passengers = rand(1..3)
		end
	end	
		
	if passengers == 1
		while i <= 27
			while i1 < 6
				if ((array[i] ||= [])[i1] == 0 && i1 < 4 && (array[i] ||= [])[2] != 0) || ((array[i] ||= [])[i1] == 0 && i1 < 7 && i1 > 3 && (array[i] ||= [])[5] != 0)
					(array[i] ||= [])[i1] = 1
					i = 28
					break
				else 
					if i1 == 1
						i1 = 3
					else 
						if i1 == 3
							i1 = 4
						else 
							if i1 == 4
								i1 = 6
							end 
						end
					end
				end
			end
			i = i + 1
			i1 = 1
		end
		
		if i == 28
			i = 1
			i1 = 1
			while i <= 27
				while i1 <= 6
					if (array[i] ||= [])[i1] == 0
						(array[i] ||= [])[i1] = 1
						i = 27
						break
					else
						i1 = i1 + 1
					end
				end
				i = i + 1
				i1 = 1
			end
		end
		i1 = 1
		i = 1
	else
		if passengers == 2
			i1 = 2
			while i <= 27
				while i1 != 42
					if (array[i] ||= [])[i1] == 0
						(array[i] ||= [])[i1] = 2
						(array[i] ||= [])[i1 + 1] = 2
						i = 28
						break
					else 
						if i1 == 2
							i1 = 5
						else
							i1 = 42
						end
					end
				end
				i = i + 1
				i1 = 2
			end
			
			if i == 28
				i = 1
				i1 = 1
				while i <= 27
					while i1 <= 6
						if (array[i] ||= [])[i1] == 0
							(array[i] ||= [])[i1] = 2
							i = 27
							break
						else
							i1 = i1 + 1
						end
					end
					i = i + 1
					i1 = 1
				end
				
				i = 1
				i1 = 1
				while i <= 27
					while i1 <= 6
						if (array[i] ||= [])[i1] == 0
							(array[i] ||= [])[i1] = 2
							i = 27
							break
						else
							i1 = i1 + 1
						end
					end
					i = i + 1
					i1 = 1
				end
			end
			i1 = 1
			i = 1
		else
			if passengers == 3
				while i <= 27
					while i1 != 42
						if (array[i] ||= [])[i1] == 0 && (array[i] ||= [])[i1 + 1] == 0 && (array[i] ||= [])[i1 + 2] == 0
							(array[i] ||= [])[i1] = 3
							(array[i] ||= [])[i1 + 1] = 3
							(array[i] ||= [])[i1 + 2] = 3
							i = 28
							break
						else 
							if i1 == 1
								i1 = 4
							else
								i1 = 42
							end
						end
					end
					i = i + 1
					i1 = 1
				end
				if i == 28
					i = 1
					i1 = 1
					while i <= 27
						while i1 <= 6
							if (array[i] ||= [])[i1] == 0
								(array[i] ||= [])[i1] = 3
								i = 27
								break
							else
								i1 = i1 + 1
							end
						end
						i = i + 1
						i1 = 1
					end
					
					i = 1
					i1 = 1
					while i <= 27
						while i1 <= 6
							if (array[i] ||= [])[i1] == 0
								(array[i] ||= [])[i1] = 3
								i = 27
								break
							else
								i1 = i1 + 1
							end
						end
						i = i + 1
						i1 = 1
					end
					
					i = 1
					i1 = 1
					while i <= 27
						while i1 <= 6
							if (array[i] ||= [])[i1] == 0
								(array[i] ||= [])[i1] = 3
								i = 27
								break
							else
								i1 = i1 + 1
							end
						end
						i = i + 1
						i1 = 1
					end
				end
				i1 = 1
				i = 1
			end
		end
	end
	
	passengers_count = passengers_count + passengers;
	
	if passengers_count == 6 * 27 - 2
		trigger = 1
	else
		if passengers_count == 6 * 27 - 1
			trigger = 2
		end
	end
	
	if passengers_count == 6 * 27
		while i <= 27
			while i1 <= 6
				print (array[i] ||= [])[i1]
				print " "
				if(i1 == 3)
					print "  "
				end
				i1 = i1 + 1
			end
			puts
			i = i + 1
			i1 = 1;
		end
	end
end
