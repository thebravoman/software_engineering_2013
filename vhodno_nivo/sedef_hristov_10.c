#include <stdio.h>

main()
{

    int x;
    int m[10];
    int *a = 0;
    int *b = 0;
    int * c;
    scanf("%d", x);
    
    for( i = 0; i<= 10 ; i++)
    {
        *a= 0;
       * b = b++;
       * c = *a + b;      
        if (c%x == 0)
        m[i] = c;
        printf("%d", m[i]);
    }
    
    
    return 0;
}
