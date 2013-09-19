#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main()
{
        char c;
        int numb = 0;
        while ((c = getchar()) != '\n')
        {
               if((c >= '0') && (c <= '9'))
               {
                        numb = numb*10+(c-'0');
               } 
        }
        if (numb > 10)
        {
                printf("Max number is 10\n");
        }
        if (numb < 0)
        {
                printf("Min number is 0\n");
        }
        int *massiv = (int *) calloc(10,sizeof(int));
        int i;
        for (i = 0; i <= numb; i++)
        {
                massiv[0] = massiv[0] + cos(i);
        }
        for (i = numb; i <= numb*2; i++)
        {
                massiv[1] = massiv[1] + cos(i);
        }
        
        for (i = 0; i < 10; i++)
        {
                printf("%d ",massiv[i]);
        }
        return 0;
}
