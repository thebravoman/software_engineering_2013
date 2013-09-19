#include <stdio.h>

int main( )
{
	int i, x, a[10], b[5];
	scanf( "%i", &x );
	for( i = 0; i < 10; ++i )
		a[i] = x + i + 1;
	for( i = 0; i < 5; ++i )
		b[i] = a[2*i+1];
	for( i = 0; i < 5; ++i )
		printf( "%i ", b[i] );
	putchar( '\n' );
	return 0;
}
