#include <iostream>
#include <math.h>
using namespace std;
int main(){
	int i;
	cout << "Input: ";
	cin >> i;
	int array[10];
	int arr_index = 0;
	for(int a = 0; arr_index < 10; ++a){
		int res = (int)(cos(a)*1000);
		//OR int res = (int)(cos(a * 3.141592653589793 / 180.0)*1000);
		if(res == i){
			array[arr_index] = a;
			++arr_index;
		}
	}
	for(int a = 0; a < 10; ++a){
		cout << array[a] << endl;
	}
	
}
