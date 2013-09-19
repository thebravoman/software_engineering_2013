#include <stdio.h>

void main()
{
int x,m[10],i=1,k=0,n[10],j;

do
{
scanf("%d",&x);
}
while(x<0);
do
{
if(i%2)
if(x%i=0)
{
m[k]=i;
k++;
}
i++;
}
while(k<10);
for(i=0;i<10;i++)
printf("%d",m[i]);
j=0;
for(i=0;i<10;i++)
{
k=1;
do
{
k++;
if(m[i]%k=0)
{
if(k==m[i])
{
n[j]=m[i];
j++;
}
else break;
}
}
while(i<10);
}
}
