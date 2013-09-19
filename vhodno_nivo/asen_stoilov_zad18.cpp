#include <iostream>
using namespace std;
int main(){
int x,i,j;
int arr[10];
cout<<"vav x: ";
cin>>x;
cout<<endl;
int a=0;
for (i=0;i<10;++i){
for(j=a;;++j){
if (x%j==0){
if (j%2!=0){
arr[i]=j
a=j;
break;}
}


}for(i=0;i<10;++i){if (arr[i]<10)cout<<arr[i]<<endl;}
}
