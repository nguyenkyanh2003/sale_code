#include <stdio.h>
double*maximum(double*a,int size)
{
    if(size==0)
        return NULL;
        else
    {
        double*max=a;
        for(int i=1;i<size;i++)
        {
            if(*(a+i)>*max)
                max=&a[i];
        }
        return max;
    }
}
void nhap(int *a,int size)
{
    for(int i=0;i<size;i++)
    {
        scanf("%d",&*(a+i));
    }
}
int main()
{
    double a[100],size;
    scanf("%d",&size);
    nhap(a,size);
    printf("\n gia tri max:%d",maximum(a,size));
    return 0;

}
