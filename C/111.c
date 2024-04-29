#include <stdio.h>
int main()
{
    int a,b,c;
    int *d,*e,*f;
    scanf("%d %d %d",&a,&b,&c);
    d=&a;
    e=&b;
    f=&c;
    printf("%d %d %d",*d,*e,*f);
    return 0;
}
