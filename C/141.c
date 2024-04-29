#include <stdio.h>
struct date{
int day[10];
int moth[10];
int year[10];
};
typedef struct date d;
void nhap(d a[])
{   for(int i=0;i<2;i++){
    printf("\n nhap ngay:");
    scanf("%d",a[i].day);
    printf("\n nhap thang:");
    scanf("%d",a[i].moth);
    printf("\n nhap nam:");
    scanf("%d",a[i].year);
}

}
void sosanh(d a[])
{
    if(a[0].day<a[1].day||a[0].moth<a[1].moth||a[0].year<a[1].year)
        printf("\n-1");
     if(a[0].day==a[1].day||a[0].moth==a[1].moth||a[0].year==a[1].year)
      printf("\n 0");
      if(a[0].day>a[1].day||a[0].moth>a[1].moth||a[0].year>a[1].year)
      printf("\n 1");
}
int main()
{
   d a[2];
   nhap(a);
   sosanh(a);
   return 0;
}
