#include <stdio.h>
void sohh(int n)
{ int sum=0;
    for(int i=2;i<=n;i++)
    {
        for(int j=1;j<i;j++)
        {
            if(i%j==0)
                sum+=j;
        }
        if(sum==i)
            printf("\n%d",i);
        sum=0;
    }
}
int main()
{
    int n;
    scanf("%d",&n);
    sohh(n);
    return 0;
}
