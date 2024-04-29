#include <stdio.h>
#include <string.h>
int main()
{
    char a[100];
    printf("\n nhap chuoi:");
    fgets(a,100,stdin);
    a[strlen(a)-1]='\0';
    for(int i=0;i<strlen(a);i++)
    {
        if(a[i]==','||a[i]=='.'||a[i]==';'||a[i]==':'||a[i]=='!'||a[i]=='?')
            a[i]=' ';
    }
    printf("\n%s",a);
    return 0;
}
