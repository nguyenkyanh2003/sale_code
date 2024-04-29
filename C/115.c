#include <stdio.h>
int main()
{
    int x,y,z,*p,*q,*r;
    scanf("%d %d %d",&x,&y,&z);
    printf("\n %d %d %d",x,y,z);
    p=&x;
    q=&y;
    r=&z;
    printf("\n%d %d %d",p,q,z);
    printf("\n %d %d %d",*p,*q,*r);
    int tem=x;
    x=y;
    y=z;
    z=tem;
    printf("\n %d %d %d",x,y,z);
    printf("\n%d %d %d",p,q,z);
    printf("\n %d %d %d",*p,*q,*r);
    int k=p;
    p=q;
    q=r;
    r=k;
    printf("\n %d %d %d",x,y,z);
     printf("\n%d %d %d",p,q,z);
    printf("\n %d %d %d",*p,*q,*r);
    return 0;
}
