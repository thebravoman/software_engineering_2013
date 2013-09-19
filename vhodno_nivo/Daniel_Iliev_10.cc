#include <iostream>
#include <cstdio>
using namespace std;

int main()
{
	int x = 0;
	cin>>x;
	int array_Fibonachi[10];
	int i = 4;
	int array_size = 0;
	int fibonachi = 0;
	
	cout<<"1, 2 ,3";
	while (array_size < 10)
	{
		fibonachi = (i - 1) + (i - 2);
		if (i == fibonachi)
		{
			if (i % x == 0)
			{
				array_Fibonachi[array_size] = i;
				array_size++;
			}
		}
		i++;
	}
	int counter = 0;
	
	for(counter = 0; counter < 10; counter++)
	{
		cout<<array_Fibonachi[counter];
	}
	
	return 0;
}
