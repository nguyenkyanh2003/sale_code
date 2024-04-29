#include <stdio.h>

int main() {
    char a;
    int speak=0;
    while((a=getchar())!=EOF)
    {
        if(a==' ')
        {
            if(!speak)
            {
              putchar(a);
              speak=1;
            }
        }
        else{
            putchar(a);
            speak=0;
        }
    }
    return 0;
}
