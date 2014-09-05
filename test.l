%{
#include <stdio.h>
#include<stdlib.h>
%}

	/*%%
	[ ]+              fprintf(yyout," "); 
	[\n]            fprintf(yyout,"aa "); 
	[\t]+          fprintf(yyout," "); 
	.				fprintf(yyout,"known");
	%%
	*/
	/* 规则一：代码中不允许有tab，每个tab都应该转换成4个空格 */
Keyword_TAB			[\t]+

	/* 规则二：“=”号的前后不能有空格 */
Keyword_EQU1			[ \t]+("=")
Keyword_EQU2			("=")[ \t]+
Keyword_EQU 			{Keyword_EQU1}|{Keyword_EQU2}

%%

title                 	showtitle();
[\n]					{yylineno++;}
{Keyword_TAB}			{fprintf(yyout,"Error(%s)     : '%s' --> line %d\n","011",yytext,yylineno);fprintf(yyout,"011");}
{Keyword_EQU}			{fprintf(yyout,"Error(%s)     : '%s' --> line %d\n","012",yytext,yylineno);fprintf(yyout,"012");}
.						{}
%%

showtitle()
{
    printf("----- Lex Example -----\n");
}

int yywrap(void)
{
  	return 1;
}

main()
{
	char filename[50];
	printf("Input the name of the data file：");
	scanf("%s",filename); 
	yyin = fopen(filename, "r");
	yyout=fopen("p.txt","w");
	yylex();

}