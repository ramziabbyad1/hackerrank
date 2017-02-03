#include <stdio.h>
#include <string.h>
#include <stdbool.h>

void drawStem(int start_row, int start_col, int size, int matrix[][100])
{
	printf("drawing stem..");
	printf("start_row = %d\n", start_row);
	printf("start_col = %d\n", start_col);
	int i = start_row;
	for (; i < start_row + size; i++) {
		matrix[i][start_col] = true;
	}
}

void drawBranch(int start_row, int start_col, int size, int matrix[][100], 
	const char *lr)
{
	int i = 0;
	for (; i < size; i++) {
		int col = strcmp(lr, "left") == 0 ? start_col + i : start_col - i; 
		matrix[start_row + i][col] = true;
	}
}

void fillY(int start_row, int start_col, int size, int matrix[][100], int counter)
{
	printf("size = %d\n", size);
	drawStem(start_row, start_col, size, matrix);
	drawBranch(start_row + size, start_col + 1, size, matrix, "left");
	drawBranch(start_row + size, start_col - 1, size, matrix, "right");
	if (--counter > 0) {
		fillY(start_row + 2*size, start_col - size, size >> 1, matrix, counter); //recurse
		fillY(start_row + 2*size, start_col + size, size >> 1, matrix, counter); //recurse
	}
}

void printMatrix(int matrix[63][100])
{
	int i, j;
	for (i = 0; i < 63; i++) {
		for(j = 0; j < 100; j++) {
			printf("%s", matrix[i][j] ? "1" : "_");
			//printf("%d", matrix[i][j]);
		}
		printf("\n");
	}
}

int main() 
{
	int N = 5; int size = 16; int matrix[63][100] = {{0}};
	fillY(0, 50, size, matrix, N);
	printMatrix(matrix);	
}
