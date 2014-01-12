#!/usr/bin/env ruby
@places = Array.new(27,0){ |d| Array.new(2) { |i| 0 } }
@group_checker = Array.new(2)

# Checks if group can be added and sends an appropriate
# message, returns true if plane is not full else returns
# false
def check_add_group size_of_group
  if @group_checker[size_of_group] == size_of_group
    puts "Can't seat group of #{size_of_group} at any place."
    return true
  end
  
  @row = 0
  while @row < 27
     @seat = 0
    while @seat < 2
      if @places[@row][@seat] <= 3-size_of_group          
          @places[@row][@seat] += size_of_group
          puts "Seated a group of #{size_of_group} at #{@row}, #{@seat}(Places left : #{3 - @places[@row][@seat]}) "
          return true
      end
      @seat+=1
    end
    @row+=1
  end
  
  if size_of_group == 1 and @row == 27 && @seat == 2
    puts "Plane full"
    return false
  else
    puts "Can't seat group of #{size_of_group} at any place."
    @group_checker[size_of_group] = size_of_group 
    return true
  end
  
end

# Generates random group in the range of 1 to 3
def group_creator
  group = Random.new.rand(1..3)
  return group
end

#Waits for the user to press Enter and fills seats
def fill_seats
  begin
    gets
  end while check_add_group group_creator 
end

fill_seats
  