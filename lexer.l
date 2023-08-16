%{
#include<stdio.h>
#include<string.h>
#define MAX_KEYWORDS 100
#define MAX_REL_OP 100
#define MAX_ARITH_OP 100
#define MAX_ASSIGN_OP 100
#define MAX_LOGICAL_OP 100
#define MAX_NUMBERS 100
#define MAX_IDENTIFIERS 100
#define MAX_FUNCTIONS 100
#define MAX_OTHER_SYMBOLS 100
#define MAX_STRINGS 100
#define MAX_BLANK 1000

char keywords[MAX_KEYWORDS][100]={"main"};
char relOperators[MAX_REL_OP][100];
char arithOperators[MAX_ARITH_OP][100];
char assignOperators[MAX_ASSIGN_OP][100];
char logicalOperators[MAX_LOGICAL_OP][100];
char numbers[MAX_NUMBERS][100];
char identifiers[MAX_IDENTIFIERS][100];
char functions[MAX_FUNCTIONS][100];
char otherSymbols[MAX_OTHER_SYMBOLS][100];
char strings[MAX_STRINGS][100];
char Blank[MAX_BLANK][100];

int numKeywords = 1;
int numRelOp = 0;
int numArithOp = 0;
int numAssignOp = 0;
int numLogicalOp = 0;
int numNumbers = 0;
int numIdentifiers = 0;
int numFunctions = 0;
int numOtherSymbols = 0;
int numStrings = 0;
int numBlank = 0;

%}

%%
"if"|"then"|"also"|"int"|"char"|"main"|"return"|"printf"|"include"|"stdio.h"        	        {strcpy(keywords[numKeywords++], yytext);}			
"else"|"while"|"for"|"do"|"switch"|"case"|"default"|"break"|"continue"|"string.h"  		{strcpy(keywords[numKeywords++], yytext);}		
"short"|"long"|"float"|"double"|"void"|"signed"|"unsigned"|"struct"|"union"|"enum"|"typedef" 	{strcpy(keywords[numKeywords++], yytext);}	
"const"|"volatile"|"extern"|"static"|"register"|"auto"|"goto"|"sizeof"|"define"  		{strcpy(keywords[numKeywords++], yytext);}
   
">"|"<"|">="|"<="|"=="|"!="                                        { strcpy(relOperators[numRelOp++], yytext); }

"+"|"-"|"*"|"/"|"++"|"--"                                          { strcpy(arithOperators[numArithOp++], yytext); }

"="|"+="|"*="|"-="|"/="|"%="                                       { strcpy(assignOperators[numAssignOp++], yytext); }

"&&"|"\|\|"|"!"                                                    { strcpy(logicalOperators[numLogicalOp++], yytext); }

[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?				   { strcpy(numbers[numNumbers++], yytext); }

\"[^\"]*\"             				           	   { strcpy(strings[numStrings++], yytext); }

[a-zA-Z_][a-zA-Z0-9_]+\([^)]*\) {
    int functionNameLength = strcspn(yytext, "(");
    strncpy(functions[numFunctions++], yytext, functionNameLength);
    functions[numFunctions - 1][functionNameLength] = '\0';

    char* strStart = strchr(yytext, '"');
    while (strStart) {
        char* strEnd = strchr(strStart + 1, '"');
        if (strEnd) {
            strncpy(strings[numStrings++], strStart, strEnd - strStart + 1);
            strings[numStrings - 1][strEnd - strStart + 1] = '\0';
            strStart = strchr(strEnd + 1, '"');
        } else {
            break;
        }
    }
}

[a-zA-Z_][a-zA-Z0-9_]*   					   { strcpy(identifiers[numIdentifiers++], yytext); }

[{}[\]();,]                                                        { strcpy(otherSymbols[numOtherSymbols++], yytext); }

[\t\n\v\f\r]							   { strcpy(Blank[numBlank++], yytext); }

.                                                                  { /* ignore any other characters */ }
%%
int yywrap()
{
}
void printTokenOccurrences(const char *categoryName, char tokens[][100], int numTokens) 
{
    printf("------------------------------------------------------------------\n");
    printf("%-*s\t:\toccurrence\n", 25, categoryName);
    printf("------------------------------------------------------------------\n");
    
    for (int i = 0; i < numTokens; i++) {
        int isNewToken = 1;
        for (int j = 0; j < i; j++) {
            if (strcmp(tokens[i], tokens[j]) == 0) {
                isNewToken = 0;
                break;
            }
        }

        if (isNewToken) {
            int count = 0;
            for (int j = 0; j < numTokens; j++) {
                if (strcmp(tokens[i], tokens[j]) == 0) {
                    count++;
                }
            }
            printf("%-*s\t:\t%d\n", 25, tokens[i], count);
        }
    }

    printf("\n");
}
void Modify()
{
	
}
int main() {

    yylex();

    printTokenOccurrences("Keywords", keywords, numKeywords);
    printTokenOccurrences("Relational Operators", relOperators, numRelOp);
    printTokenOccurrences("Arithmetic Operators", arithOperators, numArithOp);
    printTokenOccurrences("Assignment Operators", assignOperators, numAssignOp);
    printTokenOccurrences("Logical Operators", logicalOperators, numLogicalOp);
    printTokenOccurrences("Valid Numbers", numbers, numNumbers);
    printTokenOccurrences("Valid Identifiers", identifiers, numIdentifiers);
    printTokenOccurrences("Functions", functions, numFunctions);
    printTokenOccurrences("Other Symbols", otherSymbols, numOtherSymbols);
    printTokenOccurrences("Strings", strings, numStrings);

    return 0;
}


