#include <stdio.h>
#include <string.h>
void demspace(char a[])
{  int dem=0;
    fgets(a,100,stdin);
    a[strlen(a)-1]='\0';
    for(int i=0;i<strlen(a);i++)
    {
        if(a[i]==' ')
            dem++;
    }
    printf("\n so dau cach trong chuoi la:%d",dem);
}
int main()
{
    char a[100];
    demspace(a);
    return 0;
}
