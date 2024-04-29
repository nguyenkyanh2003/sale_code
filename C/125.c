#include <stdio.h>
void daomang(int *a,int n)
{  int tem=0;
    for(int i=0;i<n/2;i++)
    {
        tem=*(a+i);
        *(a+i)=*(a+n-i-1);
        *(a+n-i-1)=tem;
    }
}
void nhap(int *a,int n)
{
    for(int i=0;i<n;i++)
    {
        scanf("%d",&*(a+i));
    }
}
void xuat(int *a,int n)
{
    for(int i=0;i<n;i++)
    {
        printf("%d\t",*(a+i));
    }
}
int  main()
{
    int a[100],n;
    scanf("%d",&n);
    nhap(a,n);
    printf("\n");
    xuat(a,n);
    printf("mang sau khi dao:\n");
    daomang(a,n);
    xuat(a,n);
    return 0;


}
