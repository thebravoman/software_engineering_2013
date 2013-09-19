#include <iostream>

using namespace std;

main()
{
	int number;
	do
	{
		cout << "Enter a number between 0 and 10!" << endl;
		cin >> number;
		if((number <= 0)||(number >= 10))
		{
			cout << "The number MUST be between 0 and 10!!!" << endl; 
		}
	}while((number <= 0)||(number >= 10));
	
	int array[10];
	int times_done;
	int increasing_num = 0;
	int i = 0;
	int sum = 0;
	
	for(times_done = 1; times_done <= 10; times_done++)
	{
		for(increasing_num = 0; increasing_num < 1000; increasing_num++)
		{
			if((increasing_num % (number * times_done)) == 0)
			{
				sum += increasing_num;
			}
		}
		array[i] = sum;
		i++;
		sum = 0;
	}
	
	for(i = 0; i < 10; i++)
	{
		cout << array[i] << endl;
	}
	
}
