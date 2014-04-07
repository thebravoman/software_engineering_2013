#include <iostream>
#include <stdlib.h>

using namespace std;

bool simple(int test)
{
	for(int i=2;i<test;i++)
	{
		if(test%i==0)
		{
			return false;
		}
	}
	return true;
}

bool gcd(int test1,int test2)
{
	int t;
	while(test2!=0)
	{
		t=test2;
		test2=test1%test2;
		test1=t;
	}
	if(test1==1)
	{
		return true;
	}
	return false;

	/*int *poolTest1=(int*)malloc(0*sizeof(int));
	int *poolTest2=(int*)malloc(0*sizeof(int));
	int countTest1=0;
	int countTest2=0;
	
	for(int i=2;i<test1;i++)
	{
		if(test1%i==0)
		{
			countTest1++;
			poolTest1=(int*)realloc(poolTest1,countTest1*sizeof(int));
			poolTest1[countTest1-1]=i;
		}
	}
	
	for(int i=2;i<test2;i++)
	{
		if(test2%i==0)
		{
			countTest2++;
			poolTest2=(int*)realloc(poolTest2,countTest2*sizeof(int));
			poolTest2[countTest2-1]=i;
		}
	}
	
	for(int i=0;i<countTest1;i++)
	{
		for(int j=0;j<countTest2;j++)
		{
			if(i==j)
			{
				return false;
			}
		}
	}
	
	return true;*/
}

int main()
{
	srand(time(NULL));
	int *pool1=(int*)malloc(0*sizeof(int));
	int *pool2=(int*)malloc(0*sizeof(int));
	int count1=0;
	int count2=0;
	int p,q,n,fn,e,d;
	cin>>p;
	
	for(int i=128;i<512;i++)
	{
		if(simple(i))
		{
			count1++;
			pool1=(int*)realloc(pool1,count1*sizeof(int));
			pool1[count1-1]=i;
		}
	}
	
	p=pool1[rand()%count1];
	q=p;
	for(;q==p;)
	{
		q=pool1[rand()%count1];
	}
	n=p*q;
	fn=(p-1)*(q-1);
	for(int i=2;i<fn;i++)
	{
		if(gcd(i,fn))
		{
			count2++;
			pool2=(int*)realloc(pool2,count2*sizeof(int));
			pool2[count2-1]=i;
		}
	}
	
	e=pool2[rand()%count2];
	
	for(int i=1;;i++)
	{
		for(d=1;((d*e)<=((fn*i)+1));d++)
		{
			if((d*e)==((fn*i)+1))
			{
				break;
			}
		}
		if((d*e)==((fn*i)+1))
		{
			break;
		}
	}
	
	cout<<"pub "<<n<<","<<e<<endl;
	cout<<"pri "<<n<<","<<d<<endl;
	
	return 0;
}
