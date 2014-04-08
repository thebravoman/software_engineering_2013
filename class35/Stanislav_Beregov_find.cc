#include <iostream>
using namespace std;

int main(){
	unsigned int n, e, d, fn;
	int p, q;
	cin >> n >> e;
	cout << n << endl;
	unsigned long long int i = 2;
	for(; ; ++i){
		if(!(n%i)){
			p = i;
			break;
		}
	}
	for(++i; ;++i){
		if(!(n%i)){
			q = i;
			break;
		}
	}
	fn = (p-1)*(q-1);
	for(i = 1; i < fn; ++i){
		if((i*e)%fn == 1){
			d = i;
			break;
		}
	}
	cout << p << " " << q << " " << fn << " " << d << endl;
	return 0;
}
