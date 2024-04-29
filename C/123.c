#include <stdio.h>
void getSale(int *a,int size)
{
    for(int i=0;i<size;i++)
    {
        scanf("%d",&*(a+i));
    }
}
int totalsale(int *a,int size)
{
    int sum=0;
    for(int i=0;i<size;i++)
    {
        sum+=*(a+i);
    }
    return sum;

}
int main()
{
    int a[100],size;
    scanf("%d",&size);
    getSale(a,size);
    printf("\n tong quy:%d",totalsale(a,size));
    return 0;
}
