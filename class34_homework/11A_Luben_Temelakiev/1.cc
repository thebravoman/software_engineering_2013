#include <ctime>
#include <cstdlib>
#include <iostream>
#include <time.h>
#include <math.h>
using namespace std;
int getGCD(int a, int b)
{
    a = a % b;
    if (a == 0)
    {
        return b;
        b = b % a;
    }
    if (b == 0)
    {
        return a;
    }
}

int main(){
	int p,q,n,fn,p1,q1,e,i,j;
	
	int array[] = { 131   , 137    ,139,    149 ,   151 ,   157 ,   163 ,   167 ,   173, 
    179 ,   181 ,   191  ,  193  ,  197    ,199  ,  211   , 223   , 227  ,  229, 
    233  ,  239   , 241,    251    ,257   , 263,    269   , 271,    277   , 281 ,
    283   , 293   , 307 ,   311   , 313  ,  317 ,   331  ,  337 ,   347  ,  349 ,
    353    ,359  ,  367  ,  373  ,  379 ,   383  ,  389 ,   397  ,  401 ,   409 ,
    419    ,421 ,   431   , 433 ,   439 ,   443   , 449,    457   , 461,    463 ,
    467   , 479,    487    ,491,    499,    503,509};
    	srand (time(NULL));
	p1 = rand()%66+1;
	p = array[p1];
	cout << p << endl;

	q1 = rand()%66+1;
	q = array[q1];
	cout << q << endl;
	
	n=p*q;
	cout << n << endl;
	
	fn = (p-1)*(q-1);
	cout << fn << endl;

	for(i=2;i<fn; i++){
		if (getGCD(i,fn) == 1){
			e = i;	
			}
	}
	cout << e << endl;
	
	unsigned int d;
	for(int j = 1; j < INT_MAX; ++j){
		if(!((fn*j + 1)%e)){
			d = (fn*j + 1)/e;
			break;
		}
	}
	cout << d << endl;
	
	cout << "pub "<<n<<", "<<e << endl;
	cout << "pri "<<n<<", "<<d << endl;
	
	
	return 0;
}
