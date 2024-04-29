#include <stdio.h>
#include <string.h>
void thaythe(char a[])
{
    fgets(a,100,stdin);
    a[strlen(a)-1]='\0';
    char n,m;
    printf("\nnhap 2 phan tu n,m:");
    scanf("%c %c",&n,&m);
    for(int i=0;i<strlen(a);i++)
    {
        if(a[i]==n)
        {
            a[i]=m;
        }
    }
    printf("\nchuoi sau khi thay la:\n%s",a);
}
int main()
{
    char a[100];
    thaythe(a);
    return 0;
}
