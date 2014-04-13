#include <iostream>
#include <cmath>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <cstdio>
using namespace std;

const uint32_t k[64] = {
	0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee,
	0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
	0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be,
	0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
	0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa,
	0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
	0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
	0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
	0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c,
	0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
	0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05,
	0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
	0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039,
	0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
	0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1,
	0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391 };

const uint32_t r[] = { 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22,
5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20,
4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21 };

#define LEFTROTATE(x, c) (((x) << (c)) | ((x) >> (32 - (c))))

void to_bytes(uint32_t val, uint8_t *bytes)
{
	bytes[0] = (uint8_t)val;
	bytes[1] = (uint8_t)(val >> 8);
	bytes[2] = (uint8_t)(val >> 16);
	bytes[3] = (uint8_t)(val >> 24);
}

uint32_t to_int32(const uint8_t *bytes)
{
	return (uint32_t)bytes[0]
		| ((uint32_t)bytes[1] << 8)
		| ((uint32_t)bytes[2] << 16)
		| ((uint32_t)bytes[3] << 24);
}

void md5(const uint8_t *initial_msg, size_t initial_len, uint8_t *digest) {

	uint32_t h0, h1, h2, h3;

	uint8_t *msg = NULL;

	size_t new_len, offset;
	uint32_t w[16];
	uint32_t a, b, c, d, i, f, g, temp;

	h0 = 0x67452301;
	h1 = 0xefcdab89;
	h2 = 0x98badcfe;
	h3 = 0x10325476;

	for (new_len = initial_len + 1; new_len % (512 / 8) != 448 / 8; new_len++);

	msg = (uint8_t*)malloc(new_len + 8);
	memcpy(msg, initial_msg, initial_len);
	msg[initial_len] = 0x80;
	for (offset = initial_len + 1; offset < new_len; offset++)
		msg[offset] = 0;

	to_bytes(initial_len * 8, msg + new_len);

	to_bytes(initial_len >> 29, msg + new_len + 4);

	for (offset = 0; offset<new_len; offset += (512 / 8)) {

		for (i = 0; i < 16; i++)
			w[i] = to_int32(msg + offset + i * 4);

		a = h0;
		b = h1;
		c = h2;
		d = h3;

		for (i = 0; i<64; i++) {

			if (i < 16) {
				f = (b & c) | ((~b) & d);
				g = i;
			}
			else if (i < 32) {
				f = (d & b) | ((~d) & c);
				g = (5 * i + 1) % 16;
			}
			else if (i < 48) {
				f = b ^ c ^ d;
				g = (3 * i + 5) % 16;
			}
			else {
				f = c ^ (b | (~d));
				g = (7 * i) % 16;
			}

			temp = d;
			d = c;
			c = b;
			b = b + LEFTROTATE((a + f + k[i] + w[g]), r[i]);
			a = temp;

		}

		h0 += a;
		h1 += b;
		h2 += c;
		h3 += d;

	}

	free(msg);

	to_bytes(h0, digest);
	to_bytes(h1, digest + 4);
	to_bytes(h2, digest + 8);
	to_bytes(h3, digest + 12);
}

bool isPrime(unsigned int num){
	for (int i = 2; i < sqrt(num); ++i){
		if (!(num%i))return false;
	}
	return true;
}

#include "InfInt.h"

InfInt power(InfInt value, InfInt power){
	InfInt pow = 1;
	while (power > 0){
		if (power % 2 == 1)pow *= value;
		value *= value;
		power /= 2;
	}
	return pow;
}

unsigned int  modInverse(unsigned int a, unsigned int m) {
	a %= m;
	for (unsigned int  x = 1; x < m; x++) {
		if ((a*x) % m == 1) return x;
	}
}



int main(int argc, char **argv) {
	//int L = 32;
	//int N = 32;
	//PHASE 1:
	int limit = 1024;
	unsigned int p, q;
	InfInt g;
	srand(time(NULL));
	do{
		q = rand()%limit;
	} while (!isPrime(q));
	do{
		p = (q*(rand() % limit)) + 1;
	} while (!isPrime(p));
	g = power(2, (p - 1) / q);
	//PHASE 2:
	unsigned int x = 1+(rand() % (q-1));
	unsigned int y = (power(g, x) % p).toUnsignedInt();
	cout << "public:" << endl << p << endl << q << endl << g << endl << y << endl << endl << endl;
	cout << "private:" << endl << x << endl;
	//PHASE 3:
	string msg, res;
	uint8_t result[16];
	cout << "enter message: ";
	cin >> msg;
	cout << endl;
	md5((uint8_t*)msg.c_str(), msg.length(), result);
	for (int i = 0; i < 16; i++){
		char c[3];
		sprintf(c, "%3.3d", result[i]);
		res += c;
	}
	InfInt message = res;
	//PHASE 4:
	unsigned int k, r, s;
	A:
	k = 1 + rand() % (q - 1);
	r = ((power(g, k) % p) % q).toUnsignedInt();
	if (!r)goto A;
	s = (   ( ((message + r*x))  * modInverse(k, q) )      %q).toUnsignedInt();
	if (!s)goto A;
	cout << "signature:" << endl << r << endl << s << endl;
	//PHASE 5:
	if (r <= 0 || s <= 0 || r >= q || s >= q){
		cout << "wrong signature" << endl;
		exit(0);
	}
	unsigned int w = modInverse(s, q);
	unsigned int u1 = ((message*w) % q).toUnsignedInt();
	unsigned int u2 = ((w*r) % q);
	unsigned int v = ((power(g, u1)*power(y, u2)) % p).toUnsignedInt() % q;

	if (v == r)cout << "valid signature!" << endl;
	else cout << "invalid signature!" << endl;

	return 0;
}
