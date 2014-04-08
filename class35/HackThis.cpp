// HackThis.cpp : Defines the entry point for the console application.
//

#include <iostream>
using namespace std;

bool is_prime(int number)
{
	if (number <= 1)
	{
		return false;
	}
	else if (number == 2)
	{
		return true;
	}
	else if (number % 2 == 0)
	{
		return false;
	}

	int square_root = sqrt(number*1.0);
	for (int i = 3; i <= square_root; i += 2)
	{
		if (number % i == 0)
		{
			return false;
		}
	}
	return true;
}

void set_d(long long& d, long long e, long long fn)
{
	// Not sure, might want it on 1 
	// TODO: CHECK IT !!!
	d = 1;
	while (1)
	{
		if (d*e % fn == 1)
		{
			break;
		}
		d++;
	}
}


int main()
{
	int primes[1024];
	int prime_counter = 0;
	int prime1, prime2;
	for (int i = 128; i < 1025; i++)
	{
		prime1 = i;
		if (is_prime(prime1))
		{
			for (int j = 128; j < 1025; j++)
			{
				prime2 = j;
				if (is_prime(prime2))
				{
					if (prime1*prime2 == 389371)
					{
						cout << "First prime: " <<prime1 << "\nSecond prime: " << prime2 << endl;
					}
				}
			}
		}
	}
	long long fn = (prime1 - 1) * (prime2 - 1);
	long long d;
	long long e = 1351;
	set_d(d, e, fn);
	cout << d << endl;

}

