%{
#include <stdio.h>
int max_length = 0;
int current_length = 0;
%}

%%
[a-zA-Z]+   { current_length = yyleng;
              if (current_length > max_length) {
                  max_length = current_length;
              }
            }
.|\n        ; /* Ignore other characters */

%%

int yywrap() {
    return 1;  // Indicate end of input
}

int main() {
    yylex();
    printf("The length of the longest word is: %d\n", max_length);
    return 0;
}
