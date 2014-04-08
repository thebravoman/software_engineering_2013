#ruby -v => 2.0.0
require 'prime'

class RSA	

  def generate_keys
    begin
      p = generate_prime 128, 256
      q = generate_prime 128, 256
    end while p == q
  
    n = p*q
    fn = (p-1)*(q-1)
  
    e = 2
    for i in 2..fn
      if(i.gcd(fn) == 1)
        e = i
        break
      end
    end
  
    d = 0
    for i in 1..(fn+1)
      if (i * e - 1) % fn == 0
        d = i
        break
      end
    end
  
  return d, n, e
  end

private
  
  def generate_prime from, to
    primes = Array.new
  
    for i in from..to
      primes << i	if i.prime?
    end
    return primes[Random::rand(primes.count)]
  end

end
