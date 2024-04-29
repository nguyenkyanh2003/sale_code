#include <stdio.h>
int main()
{
    int a[100],n;
    scanf("%d",&n);
    for(int i=0;i<n;i++)
        scanf("%d",&a[i]);
    for(int i=0;i<n;i++)
    {
        printf("\n%d",a[i]);
        for(int j=i;j<n-1;j++)
        {
            printf("\n");
            for(int k=i;k<=j+1;k++)
                printf("%d\t",a[k]);
        }

    }
    return 0;
}
