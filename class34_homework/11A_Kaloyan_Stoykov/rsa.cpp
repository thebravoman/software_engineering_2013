#include <iostream>
#include "InfInt.h"
using namespace std;

int main()
{
	int key1,key2;
	InfInt message,messagenew=1;
	
	cout<<"Enter message to crypt/decrypt: ";
	cin>>message;
	cout<<"Enter keys: ";
	cin>>key1;
	cin>>key2;
	for(int i=0;i<key2;i++)
	{
		messagenew=messagenew*message;
	}
	messagenew=messagenew%key1;
	cout<<messagenew<<endl;
	return 0;
}
