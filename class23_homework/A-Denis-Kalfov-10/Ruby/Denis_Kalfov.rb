def variables
	@seat_num=0
	@one_TwoTogether = Array.new(0)
	@index=1

	@all=0

	@info=0
	@alone=0
	@seatNum_alone_cp=0
	@placeOnlyFor_1=0
	@placeOnlyFor_1SeatNum=0
	
	@l = [] #Array.new(0)
end

def whilee numPeoples
	while (@all<=numPeoples) do
		@seat_num+=1;

		@passengers = Random.new.rand(1..3)
		@countOfPassengers=0	
		
		if (@passengers==2)
            @countOfPassengers+=2;
            	@l=[@passengers,@passengers]
		elsif (@passengers==3)
            @countOfPassengers+=3;
				@l=[@passengers,@passengers,@passengers]
		elsif (@passengers==1)
			@countOfPassengers+=1;		
				@l=[@passengers]
		end



		if (@countOfPassengers==3) 
	        puts "seat N: #{@seat_num} #{@seat_num+1} #{@seat_num+2}"
	        @seat_num=@seat_num+2


        elsif (@countOfPassengers==2)
        	puts "seat N: #{@seat_num}  #{@seat_num+1}"
            @info+=1
                
	            if (@info>0)
	                @index+=1
	                @one_TwoTogether[@index]=@seat_num+2
	            end

	        @seat_num=@seat_num+2
                      

            elsif (@countOfPassengers==1)
                if (@alone==1)
				    puts "seat N: #{@seatNum_alone_cp+1}"
               		@alone=0
                    @placeOnlyFor_1+=1
                    @placeOnlyFor_1SeatNum=@seatNum_alone_cp+2
                    @seat_num-=1

                elsif (@info==0 && @placeOnlyFor_1!=1)
                    puts "seat N: #{@seat_num}"
			        @seatNum_alone_cp=@seat_num;       
                    @alone+=1
                    @seat_num+=2
                               
                elsif (@info>0)
                    puts "seat N: #{@one_TwoTogether[@index]}"
                  	@index-=1
            	    @info-=1
                    @seat_num-=1
                              
                elsif (@placeOnlyFor_1==1)
                    puts "seat N: #{@placeOnlyFor_1SeatNum}"
                    @placeOnlyFor_1-=1
                    @seat_num-=1
                end
            end

		p(@l)
		gets

	    if @seat_num>=numPeoples 
	    	break
	    end

end end

variables
whilee 162

puts
puts "Free seats: #{(@alone*2)+(@info)+(@placeOnlyFor_1)}"
