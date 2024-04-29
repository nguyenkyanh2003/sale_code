#include <stdio.h>
struct ame{
  int a[12];
  int b[12];
};
typedef struct ame mua;
void nhap(mua k[])
{
  for(int i=0;i<12;i++)
  {
      printf("\n nhap du lieu thang %d:\n",i+1);
      printf("luong mua:");
      scanf("%d",&k[i].a);
      printf("\n nhiet do:");
      scanf("%d",&k[i].b);
  }
}
void sosanh(mua k[])
{
    int tongmua=0,domax=-100,thangmax=0,domin=100,thangmin=0,dotb=0;
    for(int i=0;i<12;i++)
    {
        tongmua+=k[i].a;
        dotb+=k[i].b;
        if(domax<k[i].b)
        {domax=k[i].b;
        thangmax=i+1;}
        if(domin>k[i].b)
        {
            domin=k[i].b;
            thangmin=i+1;
        }

    }
    printf("\tong luong mua:%d",tongmua);
    printf("\n nhiet do thang %d max:%d",thangmax,domax);
    printf("\n nhiet do thang %d min:%d",thangmin,domin);
    (double)dotb/12;
    printf("\n nhit do trung binh:%lf",dotb);
}
int main()
{
    mua k[12];
    nhap(k);
    sosanh(k);
    return 0;
}
