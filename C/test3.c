#include <stdio.h>
int main()
{
    int t,n,x;
    scanf("%d",&t);
    int a[100000];
    while(t--)
    {
        scanf("%d",&n);
        for(int j=1;j<=n;j++)
        {
            a[j]=0;
        }
        for(int j=0;j<n;j++)
        {
            scanf("%d",&x);
            if(x>0&&x<=n)
                a[x]++;
        }
        int dem=1;
        for(int j=1;j<=n;j++)
        {
            if(a[j]!=1)
               {

                dem=0;
                break;}
        }
        if(dem==1)
            printf("1\n");
        else
            printf("0\n");
    }
    return 0;
}
