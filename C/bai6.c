#include <stdio.h>
int main()
{
    float a,b,c;
    scanf("%f %f",&a,&b);
    c=1.324718;
    if(a<=c&&c<=b)
        printf("%.6f",c);
    else
        printf("%.6f",b);
    return 0;
}
