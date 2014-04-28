#include <cmath>
#include <iostream>
#include <vector>
#include <stdlib.h>
#include "InfInt.h"
using namespace std;

int n_bytes(unsigned int num){
	return ceil(log2(num));
}

string utf8fit(vector<unsigned int> msg){
	string s;
	for(int i = 0; i < msg.size(); ++i){
		int b = n_bytes(msg[i]);
		if(b <= 7){
			s += (char*)(&msg[i])[0];
		}
		else if(b <= 11){
			s += 0x06 | (char)((msg[i] & 0x07C0)>>6);
			s += 0x80 | (char)((msg[i] & 0x003F)>>0);
		}
		else if(b <= 16){
			s += 0x0E | (char)((msg[i] & 0xF000)>>12);
			s += 0x80 | (char)((msg[i] & 0x0FC0)>>6);
			s += 0x80 | (char)((msg[i] & 0x003F)>>0);
		}
		else if(b <= 21){
			s += 0x1E | (char)((msg[i] & 0x1C0000)>>18);
			s += 0x80 | (char)((msg[i] & 0x3F000)>>12);
			s += 0x80 | (char)((msg[i] & 0x0FC0)>>6);
			s += 0x80 | (char)((msg[i] & 0x003F)>>0);
		}
		else if(b <= 26){
			s += 0xF8 | (char)((msg[i] & 0x3000000)>>24);
			s += 0x80 | (char)((msg[i] & 0xFC0000)>>18);
			s += 0x80 | (char)((msg[i] & 0x3F000)>>12);
			s += 0x80 | (char)((msg[i] & 0x0FC0)>>6);
			s += 0x80 | (char)((msg[i] & 0x003F)>>0);
		}
		else if(b <= 31){
			s += 0xFC | (char)((msg[i] & 0x40000000)>>30);
			s += 0x80 | (char)((msg[i] & 0x3F000000)>>24);
			s += 0x80 | (char)((msg[i] & 0xFC0000)>>18);
			s += 0x80 | (char)((msg[i] & 0x3F000)>>12);
			s += 0x80 | (char)((msg[i] & 0x0FC0)>>6);
			s += 0x80 | (char)((msg[i] & 0x003F)>>0);
		}
		else cout << "code fail - too big for utf8" << endl;
	}
	return s;
}

vector<unsigned int> fromutf8(string msg){
	vector<unsigned int> ret;
	unsigned int curr, tmp;
	int count = 0;
	for(int i = 0; i < msg.length(); ++i){
		if(count = 0)curr = 0;
		if(msg[i] >> 6 == 2){
			tmp = (msg[i] & 0x3F) << count*6;
			curr += tmp;
			++count;
		}
		else{
			count = 0;
			for(int j = 0; j < 8; ++j){
				//cout << ((unsigned char)(msg[i] << j) & 0x80) << endl;
				if( ((unsigned char)(msg[i] << j) & 0x80) == 0 ){
					count = 0;
					tmp = (msg[i] << j) >> j;
					curr += tmp;
					ret.push_back(curr);
					break;
				}
			}
		}
	}
	return ret;
}

InfInt power(InfInt value, InfInt power){
	InfInt pow = 1;
	while (power > 0){
		if (power % 2 == 1)pow *= value;
		value *= value;
		power /= 2;
	}
	return pow;
}


int main(int argc, char** argv){
	unsigned int n, e, d, m;
	if(argc < 6)exit(0);
	n = atoi(argv[1]);
	e = atoi(argv[2]);
	d =	atoi(argv[3]);
	string msg = argv[4];
	char* op = argv[5];
	vector<unsigned int> code;
	if(op[0] == 'e'){
		for(int i = 0; i < msg.size(); ++i){
			unsigned int c = (power(msg[i], e)%n).toUnsignedInt();
			code.push_back(c);
		}
		cout << utf8fit(code) << endl;
	}
	else{
		code = fromutf8(msg);
		for(int i = 0; i < code.size(); ++i){
			unsigned int dm = (power(code[i], d)%n).toUnsignedInt();
			cout << (char)dm << endl;
		}
	}

	return 0;
}
