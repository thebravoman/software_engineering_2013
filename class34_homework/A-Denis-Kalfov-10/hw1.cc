#include <iostream>
#include <cstdlib>
#include <math.h>
#include <ctime>
using namespace std;

int p,q;
int n;
int fn;    
int e;
int d;

int prime_nums[] = { 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509 };


int generate_n () {
    p = rand() % 65 + 0;  
    q = rand() % 65 + 0;  
    
    while (p==q) 
        q = rand() % 65 + 0;   

    n = prime_nums[p] * prime_nums[q];

    return n;
}


int gcdr (int a, int b) {
    if (a == 0) {
        return b;
    }
        return gcdr(b % a , a);
}


int main() {
    srand((unsigned)time(NULL));

    generate_n();
 
    fn = (prime_nums[p]-1)*(prime_nums[q]-1);

    do {
        e = generate_n();
    } while (gcdr(fn, e)!=1);


    for (int i=1 ; ; i++) {
        if ( ((i*e) % fn)==1) {
            d=i;
            break;
        }    
    }   

    cout << "pub " << n << " " << e << endl;
    cout << "pri " << n << " " << d << endl;


    return 0;

}
