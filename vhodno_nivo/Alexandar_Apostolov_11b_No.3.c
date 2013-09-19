#include <stdio.h>
#include <stdlib.h>
int main ()
{
    float x, pi = 4;
    scanf("%f", x);
    int sign = 1, i;
    
    for (i = 3; 4/i >= x; i += 2)
    {
        if (sign == 0)
        {
            pi = pi + 4/i;
            sign = 1;
        }
        
        else if (sign == 1)
        {
            pi = pi - 4/i;
            sign = 0;
        }
       
    }
    
    printf("%f", pi);
    
    return 0;
}
