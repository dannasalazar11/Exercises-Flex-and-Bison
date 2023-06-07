%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char*);

int result;

%}

%token OR AND NOT TRUE FALSE
%left OR
%left AND
%right NOT

%%

start: expr { $$ = $1; }

expr: bexpr {
        $$ = $1;
        printf("Result: %s\n", $$ ? "true" : "false");
        exit(0);
      }

bexpr: bterm
     | bexpr OR bterm   { $$ = $1 || $3; }
     ;

bterm: bfactor
     | bterm AND bfactor { $$ = $1 && $3; }
     ;

bfactor: NOT bfactor    { $$ = !$2; }
       | '(' bexpr ')'  { $$ = $2; }
       | TRUE           { $$ = 1; }
       | FALSE          { $$ = 0; }
       ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char* message) {
    fprintf(stderr, "Error, invalid boolean expression: %s\n", message);
    exit(1);
}
