#include <stdio.h>

int main(int argc, char** argv) {
	double x = 0.1;
	float a = x;
	double erroEstimado = ((a-x)/x)*100;
	printf("%.25lf\n", erroEstimado);
}

