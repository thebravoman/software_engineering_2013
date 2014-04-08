#include <random>
#include <iostream>
#include "InfInt.h"
using namespace std;

bool is_prime(int number)
{
	if(number <= 1)
	{
		return false;
	}
	else if(number == 2)
	{
		return true;
	}
	else if(number % 2 == 0)
	{
		return false;
	}

	int square_root = sqrt(number*1.0);
	for(int i = 3; i <= square_root; i+=2)
	{
		if(number % i == 0)
		{
			return false;
		}
	}
	return true;
}

long long get_random_number(long long min_value, long long max_value)
{
	default_random_engine eng(std::random_device{}());
  	uniform_int_distribution<> dist(min_value, max_value);
  	return dist(eng);
}

void set_p_q(int& p, int& q)
{
	p = (int)get_random_number(128, 512);
	while(!is_prime(p))
	{
		p = (int)get_random_number(128, 512);
	}

	q = (int)get_random_number(128, 512);
	while(!is_prime(q))
	{
		q = (int)get_random_number(128, 512);
		while(q == p)
		{
			q = (int)get_random_number(128, 512);
		}
	}
}

int gcd(int m, int n)     	
{                         	
   int  r;                	

   while (n != 0) {       	
      r = m % n;          	
      m = n;              	
      n = r;
   }                      	
   return m;              	
}

void set_e(long long& e, long long fn)
{
	e = get_random_number(1, fn - 1);
	while(gcd(e, fn) != 1)
	{
		e = get_random_number(1, fn);
	}
}

void set_d(long long& d, long long e, long long fn)
{
	// Not sure, might want it on 1 
	// TODO: CHECK IT !!!
	d = get_random_number(1, fn);
	while(1)
	{
		if(d*e % fn == 1)
		{
			break;
		}					
		d++;
	}
}

int main() 
{
	int p, q;
	set_p_q(p, q);
	long long n = p*q;
	long long fn = (p-1)*(q-1);
	long long e;
	set_e(e, fn);
	long long d;
	set_d(d, e, fn);
	cout << "Public key: " << n << ' ' << e << endl;
	cout << "Private key: " << n << ' ' << d << endl;
}