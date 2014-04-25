def isPrime(a)
	for i in 2..a
		if a%i == 0
			return false
		end
	end
	return true
end


while (isPrime(13))
	p "df"
end