#include <stdio.h>
#include <math.h>

int is_intersect(int x1, int y1, int x2, int y2, int x, int y, int r) {
    int left = x1 < x2 ? x1 : x2;
    int right = x1 > x2 ? x1 : x2;
    int top = y1 < y2 ? y1 : y2;
    int bottom = y1 > y2 ? y1 : y2;
    int dx = x - fmax(left, fmin(x, right));
    int dy = y - fmax(top, fmin(y, bottom));
    if (dx * dx + dy * dy > r * r) {
        return 0;
    }
    if (x < left) {
        dx = left - x;
    }
    else if (x > right) {
        dx = x - right;
    }
    else {
        dx = 0;
    }
    if (dx > r) {
        return 0;
    }
    return 1;
}

int main() {
    int t, x1, y1, x2, y2, x, y, r;

    scanf("%d", &t);
    while (t--) {
        scanf("%d%d%d%d%d%d%d", &x1, &y1, &x2, &y2, &x, &y, &r);

        if (is_intersect(x1, y1, x2, y2, x, y, r)) {
            printf("1\n");
        }
        else {
            printf("0\n");
        }
    }

    return 0;
}
