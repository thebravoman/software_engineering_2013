//ZAD 9
#include<stdio.h>
#include<math.h>

int main()
{
    int a[10];
    int i;
    int x;
    int b;
    int xx=10;

    printf("vavedi x: "); scanf("%d",&x);

    if ((0<=x)&&(x<10))
    {

        for(i=0;b<xx;i++)
        { x++;
            a[i]=cos(i);
            if (a[i]%3==x)
            { b++;
                a[i]=cos(i);
                printf("%d",a[i]);
            }else xx++;

        }
    }else printf("0<=x)&&(x<10");

}
