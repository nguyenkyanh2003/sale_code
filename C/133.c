#include <stdio.h>
#include <ctype.h>

int check_customer_code(char* code) {
    if (strlen(code) != 7) {
        return 0;
    }
    for (int i = 0; i < 3; i++) {
        if (!isalpha(code[i])) {
            return 0;
        }
    }
    for (int j = 3; j < 7; j++) {
        if (!isdigit(code[j])) {
            return 0;
        }
    }
    return 1;
}

int main() {
    char code[8];
    printf("Nhap ma khach hang cua ban: ");
    scanf("%s", code);
    if (check_customer_code(code)) {
        printf("Ma khach hang hop le.");
    } else {
        printf("Ma khach hang khong hop le.");
    }
    return 0;
}
