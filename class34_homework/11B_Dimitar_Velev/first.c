#include<stdio.h>
#include<stdlib.h>

int main(int argc, char** argv){
int arr[] = {131,137,139,149,151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,241,251};
int i=rand()%23;
int p=arr[i];
int c=rand()%23;
int q=arr[c];
int n=p*q;
int fn=(p-1)*(q-1);
int a=rand()%23;
int b=arr[a];
int actual_e;
if(fn%b!=0){
	actual_e=b;
}
int o;
int d;
long int actual_d;
for(o=1;o<10;o++){
	d=((fn*o)+1)/actual_e;
	if(d%2==0){
		actual_d=d;
	}
}

printf("%d %d \n",n,actual_d);
return 0;
}
