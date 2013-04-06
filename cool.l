/* Fuentes usadas:
	Manual de jflex
	www.escet.urjc.es/.../Tema2-AnalizadorLexico-JFlex.pdf
	Ayudantia Compiladores
	Ejemplo proyecto
*/
package coolc.parser;

%%

%{

    private int commentLevel = 0;

    private int yylIntVal;
    
    private String yylStrVal;

    public Object getLVal(){
        return yylStrVal;
    }

    public int getLIntVal() {
        return yylIntVal;
    }
    
    public String getLStrVal(){
        return yylStrVal;
    }

    public Position getStartPos() {
        return new Position(yyline, yycolumn);
    }

    public Position getEndPos() {
        return new Position(yyline, yycolumn);
    }

    public void yyerror(String msg) {
        System.err.printf("%2d:%2d :: Error<%s>\n", yyline, yycolumn, msg);
    }

%}

%public
%class Lexer
%unicode
%line
%column


%caseless

LINETERMINATOR = \r|\n|\r\n
WHITESPACE     = {LINETERMINATOR} | [ \t]
INTEGER        = [0-9]+
ID             = [a-z][A-Za-z0-9_]*
TYPE           = [A-Z][A-Za-z0-9_]*
NOVALIDID      = [0-9][A-Za-z0-9_]*

A = [Aa]
C = [Cc]
D = [Dd]
E = [Ee]
F = [Ff]
H = [Hh]
I = [Ii]
L = [Ll]
N = [Nn]
O = [Oo]
P = [Pp]
R = [Rr]
S = [Ss]
T = [Tt]
V = [Vv]
W = [Ww]


%implements Parser.Lexer
%int

%state STRING
%state COMMENT

%%

<YYINITIAL>{
    {C}{L}{A}{S}{S}                 {return Parser.CLASS; }
    {E}{L}{S}{E}                     {return Parser.ELSE; }
    {I}{F}                             {return Parser.IF; }
    {F}{I}                             {return Parser.FI; }
    {I}{N}                             {return Parser.IN; }
    {I}{N}{H}{E}{R}{I}{T}{S}     {return Parser.INHERITS; }
    {I}{S}{V}{O}{I}{D}       {return Parser.ISVOID; }
    {L}{E}{T}           {return Parser.LET; }
    {L}{O}{O}{P}         {return Parser.LOOP; }
    {P}{O}{O}{L}         {return Parser.POOL; }
    {T}{H}{E}{N}         {return Parser.THEN; }
    {W}{H}{I}{L}{E}        {return Parser.WHILE; }
    {C}{A}{S}{E}         {return Parser.CASE; }
    {E}{S}{A}{C}         {return Parser.ESAC; }
    {N}{E}{W}          {return Parser.NEW; }
    {O}{F}           {return Parser.OF; }
    {N}{O}{T}          {return Parser.NOT; }

    "true"         {
                       yylStrVal = "True";
                       return Parser.BOOLEAN;
                   }
    "false"        {
                       yylStrVal = "False";
                       return Parser.BOOLEAN;
                   }

    "<-"           { return Parser.T_ASSIGN; }
    "=>"           { return Parser.T_SET; }
    "="            { return Parser.T_EQ; }
    "<="           { return Parser.T_MOREEQ; }
    "<"            { return Parser.T_MORE; }
    "+"            { return Parser.T_PLUS; }
    "-"            { return Parser.T_LESS; }
    "*"            { return Parser.T_MULTI; }
    "/"            { return Parser.T_DIVIDE; }
    "("            { return Parser.T_LPAREN; }
    ")"            { return Parser.T_RPAREN; }
    "["            { return Parser.T_LBRACE; }
    "]"            { return Parser.T_RBRACE; }
    "{"            { return Parser.T_LCURLY; }
    "}"            { return Parser.T_RCURLY; }
    ":"            { return Parser.T_COLON; }
    ";"            { return Parser.T_SEMICOLON; }
    ","            { return Parser.T_COMMA; }
    "."            { return Parser.T_DOT; }
    "~"            { return Parser.T_TILDE; }
    "@"            { return Parser.T_AT; }

    "\""           { yylStrVal = ""; yybegin(STRING); }
    "--"~\n        { /* Es un comentario */ }
    "(*"           {
                       commentLevel++;
                       yybegin(COMMENT);
                   }

    {INTEGER}      {
                       yylIntVal = Integer.parseInt(yytext());
                       return Parser.INT;
                   }
    {ID}           {
                       yylStrVal = yytext();
                       return Parser.ID;
                   }
    {TYPE}         {
                       yylStrVal = yytext();
                       return Parser.TYPE;
                   }
    {NOVALIDID}    {
                       yyerror("Identificador ilegal, no puede empezar con un numero.");
                   }
    {WHITESPACE}   {
                       // ignoramos el espacio en blanco
                   }
}

<STRING> {
    "\""            {
                        yybegin(YYINITIAL);
                        return Parser.STRING;
                    }
    [^\n\r\"\\]     { yylStrVal += yytext(); }
    \\t             { yylStrVal += "\t"; }
    \\n             { yylStrVal += "\n"; }
    \\b             { yylStrVal += "\b"; }
    \\f             { yylStrVal += "\f"; }
    \\\"            { yylStrVal += "\""; }
    \\\n            { /* no pone nada */ }
    \\\0            { yyerror("String ilegal, no puede ir un backslah 0"); }
    \\\\            { yylStrVal += "\\"; }
    \\[^0nrtf\"\\]  { yylStrVal += yytext().replace("\\", ""); }
    {LINETERMINATOR}          { yyerror("String ilegal, falta un \\ final para saltar de linea"); }
}

<COMMENT> {
    "*)"           {
                       commentLevel--;
                       if(commentLevel == 0)
                       {
                           yybegin(YYINITIAL);
                       }
                   }
    "(*"           { commentLevel++; }
    {WHITESPACE}   { /* Comentario */}
    .              { /* Comentario */ }
}

    <<EOF>>        { return Parser.EOF; }

    .           { System.out.printf("Unknown character [%s]\n", yytext());
                       return Parser.T_UNKNOWN;    }

