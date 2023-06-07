%{
#include <string.h>
#include <ctype.h>
%}


%%
^[aeiouAEIOU]+[a-zA-Z]*[0-9]+  { printf("%s", yytext); }  
[[(\{ ,.¿¡"'\[][aeiouAEIOU]+[a-zA-Z]*[0-9]+  { printf("%s", yytext); }      
^[aeiouAEIOU]+[a-zA-Z]*  { printf("%s%s", yytext, "ay"); }                                                                         
[[(\{ ,.¿¡"'][aeiouAEIOU]+[a-zA-Z]*  { printf("%s%s", yytext, "ay"); }  
^[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]+[a-zA-Z]*[0-9]+  {printf("%s", yytext); }                                                                              
[[(\{ ,.¿¡"'][bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]+[a-zA-Z]*[0-9]+  {printf("%s", yytext);}  
^[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]+[a-zA-Z]*  {                                              
                           printf("%s%c%s", yytext + 1, tolower(yytext[0]), "ay"); }  
[[(\{ ,.¿¡"'][bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]+[a-zA-Z]*  {                                               
                           printf("%c%s%c%s", yytext[0],yytext + 2, tolower(yytext[1]), "ay"); }      
%%


int main()
{
    yyin = fopen( "input.txt", "r" );
    yylex();
    return 0;
}
