require_relative 'drawer'

puts 'A = '
A = gets.chomp.to_f
if (A == 0)
	puts ("Tova ne e kvadratno u-nie!")
	Process.exit
end
puts 'B = '
B = gets.chomp.to_f
puts 'C = '
C = gets.chomp.to_f

D = B*B - 4*A*C
if (D<0)
	puts'Nqma realni koreni!'
	Process.exit
else
X = (-B/(2*A))
XX=(X*X)
Y = ((A*XX)+(B*X)+C)

x1= (((-B+Math.sqrt(D))/2*A)*10).to_s
x2= (((-B-Math.sqrt(D))/2*A)*10).to_s


 
	if (D == 0)
  	  puts 'x1=x2= '+((-B-Math.sqrt(D))/2*A).to_s
	else

   if (D > 0)
      puts 'x1 = '+((-B+Math.sqrt(D))/2*A).to_s
      puts 'x2 = '+((-B-Math.sqrt(D))/2*A).to_s
   end
end
end

drawer = Drawer.new "result.svg", 650,300
drawer.start
	
	
	drawer.text "A=", -600, 200
	drawer.text A, -578, 200
	drawer.text "B=", -540, 200
	drawer.text B, -520, 200
	drawer.text "C=", -480, 200
	drawer.text C, -460, 200
	drawer.text "D=", -600, 180
	drawer.text D, -578, 180
	drawer.text "X1=", -600, 160
	drawer.text ((-B+Math.sqrt(D))/2*A).to_f, -567, 160
	drawer.text "X2=", -600, 140
	drawer.text ((-B-Math.sqrt(D))/2*A).to_f, -567, 140
	drawer.text "V(", -600, 120
	drawer.text X, -580, 120
	drawer.text ";", -555, 120
	drawer.text Y, -550, 120
	drawer.text ")", -505, 120
	
if (D==0)
	drawer.point1 ((-B-Math.sqrt(D))/2*A)*10.to_f, 0
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)+3.to_f, 1
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)+10.to_f, 6
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)+20.to_f, 14
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)+30.to_f, 28
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)+40.to_f, 54
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)+60.to_f, 108
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)+70.to_f, 200

	drawer.point1 ((-B-Math.sqrt(D))/2*A)*10.to_f, 0
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)-3.to_f, 1
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)-10.to_f, 6
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)-20.to_f, 14
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)-30.to_f, 28
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)-40.to_f, 54
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)-60.to_f, 108
	drawer.point1 (((-B-Math.sqrt(D))/2*A)*10)-70.to_f, 200
else	

if (A > 0)
	drawer.point1 X*10, Y*10
	drawer.point1 x2.to_f , 0
	drawer.point1 x1.to_f , 0


		drawer.point1 (x2.to_f+((x2.to_f+(X*10+x2.to_f)/2)/2))/2, (Y*10-Y*10/1.8)/2
		drawer.point1 (x2.to_f+(X*10+x2.to_f)/2)/2, Y*10-Y*10/1.8
		drawer.point1 (((x2.to_f+(X*10+x2.to_f)/2)/2)+(X*10+x2.to_f)/2)/2, ((Y*10-Y*10/1.8)+(Y*10-Y*10/4.8))/1.9
		drawer.point1 (X*10+x2.to_f)/2, Y*10-Y*10/4.8
		drawer.point1 (X*10+(X*10+x2.to_f)/2)/2, Y*10-Y*10/13.8
		drawer.point1 (X*10+(X*10+(X*10+x2.to_f)/2)/2)/2, Y*10-Y*10/50.8
		drawer.point1 x2.to_f-8, Y*10-Y*10-Y*10/2.8
		drawer.point1 x2.to_f-18, Y*10-Y*10-Y*10/0.8


		drawer.point1 (x1.to_f+((x1.to_f+(X*10+x1.to_f)/2)/2))/2, (Y*10-Y*10/1.8)/2
		drawer.point1 (x1.to_f+(X*10+x1.to_f)/2)/2, Y*10-Y*10/1.8
		drawer.point1 (((x1.to_f+(X*10+x1.to_f)/2)/2)+(X*10+x1.to_f)/2)/2, ((Y*10-Y*10/1.8)+(Y*10-Y*10/4.8))/1.9
		drawer.point1 (X*10+x1.to_f)/2, Y*10-Y*10/4.8
		drawer.point1 (X*10+(X*10+x1.to_f)/2)/2, Y*10-Y*10/13.8
		drawer.point1 (X*10+(X*10+(X*10+x1.to_f)/2)/2)/2, Y*10-Y*10/50.8
		drawer.point1 x1.to_f+8, Y*10-Y*10-Y*10/2.8
		drawer.point1 x1.to_f+18, Y*10-Y*10-Y*10/0.8
end

if(A < 0)
	drawer.point1 X*10, Y*10
	drawer.point1 x2.to_f , 0
	drawer.point1 x1.to_f , 0
	

		drawer.point1 (x2.to_f+((x2.to_f+(X*10+x2.to_f)/2)/2))/2, (Y*10-Y*10/1.8)/2
		drawer.point1 (x2.to_f+(X*10+x2.to_f)/2)/2, Y*10-Y*10/1.8
		drawer.point1 (((x2.to_f+(X*10+x2.to_f)/2)/2)+(X*10+x2.to_f)/2)/2, ((Y*10-Y*10/1.8)+(Y*10-Y*10/4.8))/2
		drawer.point1 (X*10+x2.to_f)/2, Y*10-Y*10/4.2
		drawer.point1 (X*10+(X*10+x2.to_f)/2)/2, Y*10-Y*10/13.8
		drawer.point1 (X*10+(X*10+(X*10+x2.to_f)/2)/2)/2, Y*10-Y*10/50.8
		drawer.point1 x2.to_f+8, Y*10-Y*10-Y*10/2.8
		drawer.point1 x2.to_f+18, Y*10-Y*10-Y*10/0.8
	

		drawer.point1 (x1.to_f+((x1.to_f+(X*10+x1.to_f)/2)/2))/2, (Y*10-Y*10/1.8)/2
		drawer.point1 (x1.to_f+(X*10+x1.to_f)/2)/2, Y*10-Y*10/1.8
		drawer.point1 (((x1.to_f+(X*10+x1.to_f)/2)/2)+(X*10+x1.to_f)/2)/2, ((Y*10-Y*10/1.8)+(Y*10-Y*10/4.8))/1.9
		drawer.point1 (X*10+x1.to_f)/2, Y*10-Y*10/4.8
		drawer.point1 (X*10+(X*10+x1.to_f)/2)/2, Y*10-Y*10/13.8
		drawer.point1 (X*10+(X*10+(X*10+x1.to_f)/2)/2)/2, Y*10-Y*10/50.8
		drawer.point1 x1.to_f-8, Y*10-Y*10-Y*10/2.8
		drawer.point1 x1.to_f-18, Y*10-Y*10-Y*10/0.8
end
end
drawer.cs

#rigt x

drawer.text "5", 50, -15
drawer.text "10", 100, -15
drawer.text "15", 150, -15
drawer.text "20", 200, -15

drawer.point 10, 0
drawer.point 20, 0
drawer.point 30, 0
drawer.point 40, 0
drawer.point 50, 0
drawer.point 60, 0
drawer.point 70, 0
drawer.point 80, 0
drawer.point 90, 0
drawer.point 100, 0
drawer.point 110, 0
drawer.point 120, 0
drawer.point 130, 0
drawer.point 140, 0
drawer.point 150, 0
drawer.point 160, 0
drawer.point 170, 0
drawer.point 180, 0
drawer.point 190, 0
drawer.point 200, 0

# 0
drawer.text "0", 0, -15

drawer.point 0, 0
#left x

drawer.text "-5", -50, -15
drawer.text "-10", -100, -15
drawer.text "-15", -150, -15
drawer.text "-20", -200, -15

drawer.point -10, 0
drawer.point -20, 0
drawer.point -30, 0
drawer.point -40, 0
drawer.point -50, 0
drawer.point -60, 0
drawer.point -70, 0
drawer.point -80, 0
drawer.point -90, 0
drawer.point -100, 0
drawer.point -110, 0
drawer.point -120, 0
drawer.point -130, 0
drawer.point -140, 0
drawer.point -150, 0
drawer.point -160, 0
drawer.point -170, 0
drawer.point -180, 0
drawer.point -190, 0
drawer.point -200, 0

#up y

drawer.text "5", 5, 50
drawer.text "10", 5, 100
drawer.text "15", 5, 150
drawer.text "20", 5, 200

drawer.point 0, 10
drawer.point 0, 20
drawer.point 0, 30
drawer.point 0, 40
drawer.point 0, 50
drawer.point 0, 60
drawer.point 0, 70
drawer.point 0, 80
drawer.point 0, 90
drawer.point 0, 100
drawer.point 0, 110
drawer.point 0, 120
drawer.point 0, 130
drawer.point 0, 140
drawer.point 0, 150
drawer.point 0, 160
drawer.point 0, 170
drawer.point 0, 180
drawer.point 0, 190
drawer.point 0, 200

#down y

drawer.text "-5", 5, -50
drawer.text "-10", 5, -100
drawer.text "-15", 5, -150
drawer.text "-20", 5, -200

drawer.point 0, -10
drawer.point 0, -20
drawer.point 0, -30
drawer.point 0, -40
drawer.point 0, -50
drawer.point 0, -60
drawer.point 0, -70
drawer.point 0, -80
drawer.point 0, -90
drawer.point 0, -100
drawer.point 0, -110
drawer.point 0, -120
drawer.point 0, -130
drawer.point 0, -140
drawer.point 0, -150
drawer.point 0, -160
drawer.point 0, -170
drawer.point 0, -180
drawer.point 0, -190
drawer.point 0, -200

drawer.finish
