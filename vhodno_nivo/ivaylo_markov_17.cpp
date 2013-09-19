//Task 17

#include<iostream>
#include<cstdlib>
using namespace std;

int main() {

    int x=0;
    int arr[10];
    int a=0, b=1, c=0;
    
    cout << "x = ";
    cin >> x;
    
    if(x<=0 || x >= 10) {
        cout << "0<x10" << endl;
        exit(0);
    }    

    
    for(int i=0;i<10;++i) {
    
        c=a+b;
        a = b;
        b = c;   
    
    if (c%10 == x) {
          arr[i] = b;
            cout << arr[i] << endl;
     }
     else {
     if(i==0);
     else --i;
     
     }
    
    }
    
    
    
}
