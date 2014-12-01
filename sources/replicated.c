#include <stdio.h>

int main() {
	return 0;
}

int a(int a, int b) {
	a++;
	a += b;
	b = a;
	return a+b+2;
}

int b(int aa, int bb) {
	aa++;
	aa += bb;
	bb = aa;
	return aa+bb+2;
}
