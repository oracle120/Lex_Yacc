%{

/**
* (C) Copyright 2008
* @version  v1.0
* @author v-lover
* @brief  分析输入的单词,简单的示例
*                   
* history:
* <p>
        chenli 2008-12-10 1.0 create this moudle;
    </p>
*/

#include "stdio.h"

%}

	/* 规则一：代码中不允许有tab，每个tab都应该转换成4个空格 */
Keyword_TAB			[\t]+

	/* 规则二：“=”号的前后不能有空格 */
Keyword_EQU1			[ \t]+("=")
Keyword_EQU2			("=")[ \t]+
Keyword_EQU 			{Keyword_EQU1}|{Keyword_EQU2}

%%

title                 	showtitle();
[\n]					{yylineno++;}
{Keyword_TAB}			{printf("Error(%s)     : '%s' --> line %d\n","011",yytext,yylineno);}
{Keyword_EQU}			{printf("Error(%s)     : '%s' --> line %d\n","012",yytext,yylineno);}
.						{}
%%

showtitle()
{
    printf("----- Lex Example -----\n");
}

int main()
{

  yylex(); /* 进行分析 */
  printf("\nLine Count: %d\n",yylineno);
  return 0;
}

int yywrap()
{
    return 1;
}