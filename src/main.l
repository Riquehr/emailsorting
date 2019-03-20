%{

#include <stdio.h>
#include <string.h>
int emailsValidos=0; /* E-mails válidos */
int emailsValidosUnicamp=0; /*E-mails válidos de domínios unicamp.br */
int emailsValidosfee=0; /* E-mails válidos de domínios fee.unicamp.br */


%}

LETRA   [a-zA-Z]
DIGITO  [0-9]

COM      [.][c][o][m]
UNICAMPBR [u][n][i][c][a][m][p][.][b][r]
FEE      [f][e][e][.]
PALAVRA  {LETRA}+
INTEIRO  {DIGITO}+
PREPALAVRA {PALAVRA}[.]
PONTOBR [.][b][r]
%%



{PALAVRA}+[@]{PREPALAVRA}?{FEE}{UNICAMPBR} {
  /*printf("FEE VALIDO\n");*/
  emailsValidosfee++;
  emailsValidos++;
  emailsValidosUnicamp++;
}
{PALAVRA}+[@]{PREPALAVRA}?{UNICAMPBR} {
  /*printf("UNICAMP VALIDO\n");*/
  emailsValidos++;
  emailsValidosUnicamp++;
}
{INTEIRO}?{PALAVRA}+[@]{PREPALAVRA}*{PALAVRA}+{COM}?{PONTOBR}? {
  /*printf("EMAIL VALIDO\n");*/
  emailsValidos++;
}


[[:space:]]+ ;
[[:^space:]]+ ;

[.\n]* ;

%%

int main() {
  yylex();
  printf("%d %d %d\n",emailsValidos,emailsValidosUnicamp,emailsValidosfee);
  return 0;
}
