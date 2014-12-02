#include <stdio.h>
#include <stdlib.h>


int main() {
	int var = 1;
	printf("%d\n", var);
	var = 12;
	printf("%d\n", var);
	/*
	scanf("%d\n", &j);
	
	p = (int*)malloc(sizeof(int) * ( j + 1));
	p[0] = 0;
	p[1] = 1;

	for(i = 2; i < j; ++i) {
		p[i] = p[i-1] + p[i-2];
	}

	for(i = 0; i < j; ++i) {
		printf("%d\n", p[i]);
	}
	*/
}

int h(int i) {
	i += 2;
}

int x = 0;
