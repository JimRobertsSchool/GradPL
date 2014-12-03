#include <stdio.h>
#include <assert.h>

char getByteChar(int x) {
	char toReturn;
	switch(x) {

		case 0: toReturn = '0';
			break;
		case 1: toReturn = '1';
			break;
		case 2: toReturn = '2';
			break;
		case 3: toReturn = '3';
			break;
		case 4: toReturn = '4';
			break;
		case 5: toReturn = '5';
			break;
		case 6: toReturn = '6';
			break;
		case 7: toReturn = '7';
			break;
		case 8: toReturn = '8';
			break;
		case 9: toReturn = '9';
			break;
		case 10: toReturn = 'a';
			break;
		case 11: toReturn = 'b';
			break;
		case 12: toReturn = 'c';
			break;
		case 13: toReturn = 'd';
			break;
		case 14: toReturn = 'e';
			break;
		case 15: toReturn = 'f';
			break;
		default: toReturn = ':';

	}
	return toReturn;
}

/*
void printByte(int x) {
	char toPrint[3];

	assert(x < 16 * 16);
	
	toPrint[2] = '\0';

	toPrint[1] = getByteChar(0x0000000f & x);
	x >>= 4;
	toPrint[0] = getByteChar(0x0000000f & x);

	printf("%s", toPrint);
	
}
*/
void printBits(int x) {
	int i;
	char result[9];
	result[8] = '\0';

	for(i = 0; i < 32; ++i) {
		printf("%d", (0x80000000 & (x << i)) >> 31);
		if (i % 4 == 3) {
			printf(" ");
		}
	}
	printf("\n");

	for(i = 0; i < 8; ++i) {
		result[7-i] = getByteChar(0x0000000f & (x >> (4*i)));
	}
	printf("0x%s\n", result);
}

int bitAnd(int x, int y) {
	return  ~(~x | ~y);
}

int getByte(int x, int n) {
	return 0x000000ff & (x >> (n << 3));
}

int main(int argc, char * argv[]) {
	int in1, in2;
	int result;

	scanf("%d %d\\n", &in1, &in2);

	in1 = 0x12345678;
	in2 = 3;

	printBits(in1);
	result = getByte(in1, in2);
	printBits(result);

	printf("%d\n", result);

	return 0;
}
