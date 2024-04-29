#include <stdio.h>
void pitago(int a,int b,int c)
{
    if(a*a==b*b+c*c||b*b==a*a+c*c||c*c==a*a+b*b)
        printf("1");
    else
        printf("0");
}
int main()
{
    int a,b,c;
    scanf("%d%d%d",&a,&b,&c);
    pitago(a,b,c);
    return  0;
}
