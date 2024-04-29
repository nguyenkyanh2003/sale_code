#include <stdio.h>
int main()
{
    int a[100],n;
    scanf("%d",&n);
    int dem=1;
    for(int i=0;i<n;i++)
    {
        scanf("%d",&a[i]);
    }
    for(int i=0;i<n;i++)
    {
        dem=1;
        for(int j=i+1;j<n;j++)
        {
            if(a[i]==a[j])
            {
                dem++;
                a[j]=-1;
            }
        }
        if(a[i]!=-1)
        {
            printf("%d %d\n",a[i],dem);
        }
    }
    return 0;
}
