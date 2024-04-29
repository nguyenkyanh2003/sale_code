#include <stdio.h>
void sosanhtime()
{
    int a,b,c,d,e,f;
    scanf("%d %d %d %d %d %d",&a,&b,&c,&d,&e,&f);
    if(a>=0&&a<=23&&b>=0&&b<=59&&c>=0&&c<=59&&d>=0&&d<=23&&e>=0&&e<=59&&f>=0&&f<=59){
    if(a<d||(a==d&&b<e)||(a==d&&b==e&&c<f))
        printf("-1");
     if(a==d&&b==e&&c==f)
        printf("0");
    if(a>d||(a==d&&b>e)||(a==d&&b==e&&c>f))
        printf("1");
    }
    else
        printf("00:00:00");
    }
    int main()
    {
        sosanhtime();
        return 0;
    }

