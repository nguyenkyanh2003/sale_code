#include <stdio.h>
void incomeplus(long *luong,int nam)
{
    if(nam>3)
        *luong+=300000;
}
int main()
{
    int luong,nam;
    printf("\n nhap luong va nam:");
    scanf("%d %d",&luong,&nam);
    printf("\n luong ban dau:%d",luong);
    incomeplus(&luong,nam);
    printf("\n luong sau khi kiemtra:%d",luong);
    return 0;
}
