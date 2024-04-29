#include <stdio.h>

int main() {
    int n, i, a = 0, b = 1, c;
    scanf("%d", &n);
    if (n == 1) {
        printf("%d\n",a);
    } else if (n == 2) {
        printf("%d\n", b);
    } else {
        for (i =3; i <= n; i++) {
            c = a + b;
            a = b;
            b = c;
        }
        printf("%d\n",c);
    }

    return 0;
}
