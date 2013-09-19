#include <stdio.h>
#include <stdlib.h>

void main()
{
	int i, first_run = 0, counter = 0, p = 0, first_array[10], second_array[5];
	char c;
	while((c = getchar()) != EOF)
	{
		if(first_run == 0)
		{
			first_run = 1;
			i = c - 48;
		}
		else
		{
			i = (i * 10) + (c - 48);
		}
	}
	while(counter < 10)
	{
		first_array[counter] = i + p;
		p =  p + 2;
		counter = counter + 1;
		
	}
	counter = 0;
	p = 1;
	while(counter < 5)
	{
		second_array[counter] = first_array[p];
		p = p + 2;
		counter = counter + 1;
		printf("%d", second_array[counter]);
	}

}
