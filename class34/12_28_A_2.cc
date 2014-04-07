#include <iostream>
#include <math.h>
#include <stdlib.h>
using namespace std;

int main(int argc, char** argv){
	unsigned int n, e, d, m;
	if(argc < 6)exit(0);
	n = atoi(argv[1]);
	e = atoi(argv[2]);
	d =	atoi(argv[3]);
	m = atoi(argv[4]);
	char* op = argv[5];

	if(op[0] == 'e'){
		long long  int c = (int)pow(m, e)%n;
		cout << c << endl;
	}
	else{
		cout << "DADFUQ" << endl;
		long long  int dm = (int)pow(m, d)%n;
		cout << dm << endl;
	}

	return 0;
}
