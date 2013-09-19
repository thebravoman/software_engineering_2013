puts "Write x (x>0)"
 x = gets.to_f
while x<0
 puts "Write x (x>0)"
 x = gets.to_f
end

puts "Write y (y>0)"
y = gets.to_f
while y<0
 puts "Write y (y>0)"
 y = gets.to_f
end

puts "Write w (w>0)"
w = gets.to_f
while w<0 and w>x
 puts "Write w (w>0)"
 w = gets.to_f
end

puts "Write h (h>0)"
h = gets.to_f
while h<0 and h>y
 puts "Write h (h>0)"
 h = gets.to_f
end

i = 0
w2 = w
while i<10
 while w<x do
  puts w2
  w2 += w
  i += 1
 end
end
