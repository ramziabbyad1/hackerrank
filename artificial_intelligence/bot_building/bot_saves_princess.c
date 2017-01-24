#include <stdio.h>
#include <string.h>
#include <math.h>
void displayPathtoPrincess(int n, char grid[101][101]){
    /*int top_left[2] = {0, 0}; int top_right[2] = {0, n-1}; int bottom_left[2] = {n-1, 0}; int bottom_right[2] = {n-1, n-1};*/
    //need n/2 up moves and n/2 left
    const char *lateral_direction;
    const char *vertical_direction;
    if(grid[0][0] == 'p') {
        vertical_direction = "UP";
        lateral_direction = "LEFT";
    }
    else if (grid[0][n-1] == 'p') {
        vertical_direction = "UP";
        lateral_direction = "RIGHT";
    }
    else if (grid[n-1][0] == 'p') {
        vertical_direction = "DOWN";
        lateral_direction = "LEFT";
    }
    else if (grid[n-1][n-1] == 'p') {
        vertical_direction = "DOWN";
        lateral_direction = "RIGHT";
    }
    
    for(int i = 0; i < n/2; i++) {
        printf("%s \n", vertical_direction);
        printf("%s \n", lateral_direction);
    }
}
int main(void) {

    int m;
    scanf("%d", &m);
    char grid[101][101]={};
    char line[101];

    for(int i=0; i<m; i++) {
        scanf("%s", line);
        strcpy(grid[i], line);
    }
    displayPathtoPrincess(m,grid);
    return 0;
}
