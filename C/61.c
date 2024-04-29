#include <stdio.h>
void nhap(int a[][100],int n,int m)
{
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<m;j++)
        {
          scanf("%d",&a[i][j]);
        }
    }
}
void xuat(int a[][],int n,int m)
{
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<m;j++)
            scanf("%d\t",a[i][j]);
        printf("\n");
    }
}
