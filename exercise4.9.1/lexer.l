%{
#include "y.tab.h"
%}

%%

or      { return OR; }
and     { return AND; }
not     { return NOT; }
true    { return TRUE; }
false   { return FALSE; }
"("     { return '('; }
")"     { return ')'; }
\n      { /* Ignore line breaks*/ }
.       { /* Ignore other characters */ }

%%

/* It always returns 1, which means that no more input tokens are needed */
int yywrap() {
    return 1;
}