#include <stdio.h>

int le(int *a,int size)
{   int cout=0;
    for(int i=0;i<size;i++)
    {
        if(*(a+i)%2!=0)
        cout++;

    }
    return cout;
}
int main()
{
    int a[5]={1,2,3,4,5};
    printf("\n so phan tu le:%d",le(a,5));
    return 0;
}

