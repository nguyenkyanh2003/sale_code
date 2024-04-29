#include <stdio.h>
void time(int a,int b,int c)
{
    if(a>=0&&a<=23&&b>=0&&b<=59&&c>=0&&c<=59)
        printf("1");
    else
        printf("0");
}
int main()
{
    int a,b,c;
    scanf("%d %d %d",&a,&b,&c);
    time(a,b,c);
    return 0;
}
