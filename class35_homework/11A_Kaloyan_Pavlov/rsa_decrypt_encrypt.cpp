#include <iostream>
#include "InfInt.h"
using namespace std;

InfInt power(InfInt base, int exp)
{
	bool flag=0;

	if(exp<0) 
	{
		flag=1;exp*=-1;
	}

	InfInt result = 1;

	while (exp)
	{
	    if (exp & 1)
	        result *= base;
	    exp >>= 1;
	    base *= base;
	}

	if(flag==0)
	{
		return result;
	}
	else
	{
		InfInt inf = 1;
		return (inf/result);
	}
}


int main()
{
	InfInt message;
	int key1;
	InfInt key2;
	cout << "First the message, then the first key, then the second key" << endl;
	cin >> message >> key1 >> key2;
	InfInt calculation = power(message, key1) % key2; 
	cout << "Your result is: " << calculation << endl;
}