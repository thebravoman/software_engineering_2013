#include <stdio.h>

int main()
{
	int x,y,w,h;
	int array[10];
	int num_tiles;
	
	printf("Enter X:");
	scanf("%d",&x);
	printf("Enter Y:");
	scanf("%d",&y);
	printf("Enter W:");
	scanf("%d",&w);
	printf("Enter H:");
	scanf("%d",&h);
	
	if((x>0) && (y>0) && (w>0) && (h>0))
	{
		num_tiles=(x/w)*(y/h); //finds how much tiles you can cut
		printf("%d\n",num_tiles);
		
		//for(int i;
		
		
	}
	else printf("invalid input\n");
	
	return 0;
}
