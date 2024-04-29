#include <stdio.h>
#include <string.h>
void strend(char s[],char n)
{   printf("\n nhap chuoi:");
    fgets(s,100,stdin);
    printf("\nnhap chu:");
    scanf("%s",&n);
    if(s[strlen(s)-2]==n)
        printf("\n1");
    else printf("\n0");
}
int main()
{
    char s[100],n;
    strend(s,n);
    return 0;
}
