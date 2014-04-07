#include <iostream>
using namespace std;

int power(long long int n, long long int p) {
	long long int nn=1;
	
	for(int i=1;i<=p;++i) {
		nn*=n;
	}
	return nn;
}

int main() {
	long long int n, d, e, m, c, dm;
	char check;
	
	cout << "Molq vavedete 'n': ";cin >> n;
	cout << "Molq vavedete 'e': ";cin >> e;
	cout << "Molq vavedete 'd': ";cin >> d;
	cout << "Molq vavedete suobshtenie: ";cin >> m;
	cout << "Molq izberete 'c' ili 'd': ";cin >> check;
	
	if(check=='c') {
		c=power(m, e)%n;
		cout << c << endl;
	} else if(check=='d') {
		dm=power(m, d)%n;
		cout << dm << endl;
	} else {
		cout << "Wrong choice!" << endl;
	}

	return 0;
}//34059
