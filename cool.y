%{
package coolc.parser;

%}

%output  "Parser.java"
%language "Java"


%define parser_class_name "Parser"
%define public

%code {

    public static String getTokenName(int t) {
        return yytname_[t-255];
    }

}

%token T_UNKNOWN

%token CLASS
%token ELSE
%token FALSE
%token IF
%token FI
%token IN
%token INHERITS
%token ISVOID
%token LET
%token LOOP
%token POOL
%token THEN
%token WHILE
%token CASE
%token ESAC
%token NEW
%token OF
%token NOT
%token TRUE

%token T_ASSIGN "<-"
%token T_SET "=>"
%token T_EQ "="
%token T_MOREEQ "<="
%token T_MORE "<"
%token T_LESS "-"
%token T_MULTI "*"
%token T_DIVIDE "/"
%token  T_LPAREN "(" T_RPAREN ")"
%token  T_LBRACE  "[" T_RBRACE "]"
%token  T_SEMICOLON ";"
%token T_COLON ":"
%token  T_COMMA ","

%token T_PLUS "+"

%token <String> IDENTIFIER
%token <String> TYPE
%token <String> STRING
%token <Int> INT

%%

expr
    : INT
    | expr "+" expr
    | IDENTIFIER "(" param_list ")"
    | "[" matrix "]"
    | IDENTIFIER
    ;

param_list
    : /* empty */ 
    | param_list "," expr
    ;

matrix
    : vector
    | matrix ";" vector
    ;

vector
    : expr
    | vector "," expr
    ;

%%
