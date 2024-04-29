#include <stdio.h>
#include <string.h>
int main()
{
    char a[100];
    fgets(a,100,stdin);
    a[strlen(a)-1]='\0';
    printf("%s",a);
    return 0;

}
