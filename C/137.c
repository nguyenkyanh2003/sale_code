#include <stdio.h>
#include <string.h>
int main()
{
    char tim[5][50]={
        "TV127 31 inch Television",
        "CD057 CD Player",
        "TA877 Answering Machine",
        "CS409 Car Stereo",
        "PC655 Personal Computrer",
    };
    char search[50];
    printf("\n nhap dia chi can tim:");
    scanf("%s",&search);
    int k=0;
    for(int i=0;i<5;i++)
    {
        if(strstr(tim[i],search)!=NULL)
        {
            printf("\n%s",tim[i]);
            k=1;
        }
    }
    if(k==0)
        printf("\n khong co dia chi can tim!!");
    return 0;
}
