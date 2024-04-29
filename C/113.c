#include<stdio.h>
int main()
{
    int a,b,c;
    scanf("%d",&a);
    scanf("%d %d",&b,&c);
    printf("\n %d %d %d",a,b,c);
    int *pt;
    pt=&a;
    *pt+=100;
    pt=&b;
    *pt+=100;
    pt=&c;
    *pt+=100;
    printf("\n %d %d %d",a,b,c);
    return 0;
}
