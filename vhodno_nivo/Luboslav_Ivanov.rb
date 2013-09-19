puts "Enter a value for X, which must be 0<X<10"
x = gets.to_i
while x<= 0 || x>=10
	puts"Your X value MUST be 0<X<10!! Try again:"
	x = gets.to_i
end

def fibonacci( n )
    [ n ] if ( 0..1 ).include? n
    ( fibonacci( n - 1 ) + fibonacci( n - 2 ) ) if n > 1
end



