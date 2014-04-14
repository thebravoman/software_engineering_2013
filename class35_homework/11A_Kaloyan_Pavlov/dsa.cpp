// dsa.cpp : Defines the entry point for the console application.
//

#include <random>
#include <iostream>
#include "InfInt.h"
using namespace std;

InfInt power(InfInt base, int exp)
{
	bool flag = 0;

	if (exp<0)
	{
		flag = 1; exp *= -1;
	}

	InfInt result = 1;

	while (exp)
	{
		if (exp & 1)
			result *= base;
		exp >>= 1;
		base *= base;
	}

	if (flag == 0)
	{
		return result;
	}
	else
	{
		InfInt inf = 1;
		return (inf / result);
	}
}

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

long long get_random_number(long long min_value, long long max_value)
{
	default_random_engine eng(std::random_device{}());
	uniform_int_distribution<> dist(min_value, max_value);
	return dist(eng);
}

int getQ(int min, int max){
	int q = 0;
	q = get_random_number(min, max);
	while (true)
	{
		if (is_prime(q) && q != 149 && q != 157 && q != 109)
		{
			break;
		}
		q++;
	}

	return q;
}

int getP(int max, int q){
	int p = get_random_number(q, max);
	int i;
	bool flag = true;

	for (i = p; i <= max; i++){
		if (is_prime(i) && (i - 1) % q == 0){
			flag = false;
			break;
		}
	}

	if (flag)
	{
		for (i = p; i > q; i--)
		{
			if (is_prime(i) && (i - 1) % q == 0)
			{
				break;
			}
		}
	}

	p = i;


	return p;
}

void getG(InfInt& g, int q, int p){
	InfInt h = 2;
	InfInt check = 1;
	g = check;
	while (g == check)
	{
		g = power(h, (p - 1) / q) % p;
		h++;
	}
}

void getY(InfInt& y ,InfInt g, int x, int p)
{
	y = 0;
	while (y == 0)
	{
		y = power(g, x) % p;
	}
}

int main()
{
	int q = getQ(1, 160);
	cout << "q = " << q << endl;
	int p = getP(1024, q);
	cout << "p = " << p << endl;
	InfInt g;
	getG(g ,q, p);
	cout << g << endl;
	int x = get_random_number(1, q);
	cout << x << endl;
	InfInt y;
	getY(y, g, x, p);
	cout << y << endl;

	cout << "Public keys: " << ' ' << p  << ' ' << q 
		<< ' ' << g << ' ' << y << endl;

	cout << "Private key: " << x << endl;
	return 0;
}


