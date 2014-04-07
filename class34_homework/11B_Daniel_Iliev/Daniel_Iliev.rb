require 'prime'

pub_key = 0
priv_key = 0

#Generate two random prime numbers

priv_rand = 1 + rand(100)
pub_rand = 1 + rand(100)
lock = 0

while (lock != 1)
	if (priv_rand.prime?)
		priv_key = priv_rand
		lock = 1
	else
		priv_rand = 1 + rand(100)
	end
end

lock = 0

while (lock != 1)
	if (pub_rand.prime?)
		pub_key = pub_rand
		lock = 1
	else
		pub_rand = 1 + rand(100)
	end
end

#End of generation

puts priv_key, pub_key
