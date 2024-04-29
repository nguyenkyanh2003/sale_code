#include <stdio.h>
int main() {
    int n, i, j, dem = 1;
    int a[20][20];
    scanf("%d", &n);
    if(n>20||n<0)
    {
        printf("nhap sai vui long nhap lai\n");
        scanf("%d",&n);
    }
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            scanf("%d", &a[i][j]);
        }
    }

    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            if (i == j &&a[i][j] != 1) {
                dem= 0;
                break;
            } else if (i != j && a[i][j] != 0) {
                dem = 0;
                break;
            }
        }
        if (!dem) {
            break;
        }
    }
    if (dem) {
        printf("Yes\n");
    } else {
        printf("No\n");
    }
    return 0;
}
