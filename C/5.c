#include <stdio.h>
#include <string.h>
#include <ctype.h>
int timpass(char mk[]) {
    int n = strlen(mk);
    int dem1 = 0;
    int dem2 = 0;
    int dem3 = 0;

    if (n < 10) {
        return 0;
    }

    for (int i = 0; i < n; i++) {
        if (!isalnum(mk[i])) {
            return 0;
        } else if (isdigit(mk[i])) {
            dem1= 1;
        } else if (isupper(mk[i])) {
            dem2 = 1;
        } else if (islower(mk[i])) {
            dem3 = 1;
        }
    }

    if (dem1&&dem2&&dem3) {
        return 1;
    } else {
        return 0;
    }
}

int main() {
    char mk[100];
    scanf("%s",mk);

    if (timpass(mk)) {
        printf("True\n");
    } else {
        printf("False\n");
    }

    return 0;
}
