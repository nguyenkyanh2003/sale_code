#include <stdio.h>
int main() {
    int n, i, j, count;
    int a[20];
    scanf("%d", &n);
    for (i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }
    for (i = 0; i < n; i++) {
        count = 1;
        for (j = i + 1; j < n; j++) {
            if (a[i] == a[j]) {
                count++;
                a[j] = -1;
            }
        }
        if (a[i] != -1) {
            printf("%d %d", a[i],count);
            printf("\n");
        }
    }
    return 0;
}
