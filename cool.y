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

%token CLASS "class"
%token ELSE "else"
%token IF "if"
%token FI "fi"
%token IN "in"
%token INHERITS "inherits"
%token ISVOID "isvoid"
%token LET "let"
%token LOOP "loop"
%token POOL "pool"
%token THEN "then"
%token WHILE "while"
%token CASE "case"
%token ESAC "esac"
%token NEW "new"
%token OF "of"
%token NOT "not"

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
%token T_LCURLY "{" T_RCURLY "}"
%token  T_SEMICOLON ";"
%token T_COLON ":"
%token  T_COMMA ","
%token T_DOT "."
%token T_TILDE "~"
%token T_AT "@"

%token T_PLUS "+"

%token <String> ID
%token <String> TYPE
%token <String> STRING
%token <String> BOOLEAN
%token <Int> INT

%%

expr
    : INT
    | expr "+" expr
    | ID "(" param_list ")"
    | "[" matrix "]"
    | ID
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
