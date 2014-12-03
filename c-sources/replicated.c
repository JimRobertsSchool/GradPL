#include <stdio.h>

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
int main() {
	printf("%d\n", a(1, 3));
	printf("%d\n", b(2, 4));
	return 0;
}

