#include <stdio.h>
#include <string.h>
int main()
{
char a[100],b[100],c[200];
fgets(a,100,stdin);
fgets(b,100,stdin);
for(int i=0;i<strlen(a);i++)
{
    c[i]=a[i];
}
a[strlen(a)-1]='\0';
for(int i=strlen(a);i<(strlen(a)+strlen(b));i++)
{
    c[i]=b[i-strlen(a)];
}
b[strlen(b)-1]='\0';
c[strlen(a)+strlen(b)]='\0';
printf("\n%s",c);
return 0;

}
