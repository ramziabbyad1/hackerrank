#include <stdio.h>
#include <string.h>
#include <math.h>
void nextMove(int n, int r, int c, char grid[101][101]){
    int found = 0;
    int to_the_left = 0;
    int to_the_right = 0;
    for(int i = 0; i <= r; i++) {
        for(int j =0; j < n; j++) {
            if(grid[i][j] == 'p') {
                found = 1;
                if(i == r && j < c) {
                    to_the_left = 1;
                }
                else if (i == r && j > c) {
                    to_the_right = 1;
                }
                break;
            }
        }
    }
    if(found && to_the_left) {
        printf("%s\n", "LEFT");
    }
    else if(found && to_the_right) {
        printf("%s\n", "RIGHT");
    }
    else if(found) {
        printf("%s\n", "UP");
    }
    else {
        printf("%s\n", "DOWN");
    }
}
int main(void) {

    int n, r, c;

    scanf("%d", &n);
    scanf("%d", &r);
    scanf("%d", &c);

   char grid[101][101];
    
    for(int i=0; i<n; i++) {
        scanf("%s[^\n]%*c", grid[i]);
    }

    nextMove(n, r, c, grid);
    return 0;
}
