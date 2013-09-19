#include <stdio.h>

int main()
{
int x,i,a;
int j=0;
int arr[10];

	scanf("%d", &x);
	if (x<0)
	{
		printf("wrong number");
	}
	else
	{
		for(a=0;a<=x;a++)
		{
			if (x%a == 0)
			{
				arr[j]=a;
				j++;
			}
		}
	}
	for(j=0;j<=10;j++)
	{
		printf("%d", arr);
	}
return (0);
}
