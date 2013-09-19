#include<stdio.h>
int func_sum(int input)
{
	if (input==0) return 0;
	return input+func_sum(input-1);
}

void main()
{
	int x,arr_sandvich[10],c_sandvich;
	for(;;)
	{
		scanf("%d",&x);
		if((x>0)&&(x<10)) break;
		else printf("Nevalidno X\n");
	}
	for(c_sandvich=1;c_sandvich<=10;c_sandvich++)
	{
		arr_sandvich[c_sandvich-1]=func_sum(x*c_sandvich);
	}
	for(c_sandvich=0;c_sandvich<10;c_sandvich++)
	{
		printf("%d ",arr_sandvich[c_sandvich]);
	}
}
