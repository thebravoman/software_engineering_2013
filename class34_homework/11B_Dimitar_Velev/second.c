#include<stdio.h>


int main(){
	int n=25021;
	int o;
	int actual_e=163;
	int actual_crypt;
	int message=12;
	for(o=0;o<actual_e;o++){
		message=message*12;
	}
	actual_crypt=message%n;
	int actual_d=1212;
	int decrypt;
	for(o=0;o<actual_d;o++){
		actual_crypt*=actual_crypt;
	}
	decrypt=actual_crypt%n;
	
	printf("%d %d\n",actual_crypt,decrypt);
	
	return 0;
}
