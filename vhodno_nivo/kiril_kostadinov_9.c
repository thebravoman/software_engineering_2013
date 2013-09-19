#include<stdio.h>
#include<stdlib.h>
#include <math.h>

main ()
{
    int x;
    double array [10];
    scanf("%d", &x);
    double c;
    int i = 0, a = 0, b;
    while (i != 11)
    {
        c = cos((double)a);
        c = c * 1000;
        b = (int)c;
        b = b % 10;
        b = b % 10;
        if (b == x)
        {
            array[i] = cos ((double)a);
            i++;
        }
        a++;
    }
    for (i=0; i < 10; i++)
    {
        printf ("%f ", array[i]);
    }
    printf("/n");
    return 0;
}

