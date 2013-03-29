/* Fuentes usadas:
	Manual de jflex
	www.escet.urjc.es/.../Tema2-AnalizadorLexico-JFlex.pdf
	Ayudantia Compiladores
	Ejemplo proyecto
*/
package coolc.parser;

%%

%{

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
        //throw new Exception();
    }

%}

%public
%class Lexer
%unicode
%line
%column


%ignorecase

LINETERMINATOR = \r|\n|\r\n
WHITESPACE     = {LINETERMINATOR} | [ \t]
INTEGER        = [0-9]+
IDENTIFIER     = [a-z][A-Za-z0-9_]*
TYPE           = [A-Z][A-Za-z0-9_]*

%x comment
%x multiline_comment

%implements Parser.Lexer
%int

%state STRING

%%

<YYINITIAL> {
    "class"        {return Parser.CLASS; }
    "else"         {return Parser.ELSE; }
    "false"        {return Parser.FALSE; }
    "if"           {return Parser.IF; }
    "fi"           {return Parser.FI; }
    "in"           {return Parser.IN; }
    "inherits"     {return Parser.INHERITS; }
    "isvoid"       {return Parser.ISVOID; }
    "let"          {return Parser.LET; }
    "loop"         {return Parser.LOOP; }
    "pool"         {return Parser.POOL; }
    "then"         {return Parser.THEN; }
    "while"        {return Parser.WHILE; }
    "case"         {return Parser.CASE; }
    "esac"         {return Parser.ESAC; }
    "new"          {return Parser.NEW; }
    "of"           {return Parser.OF; }
    "not"          {return Parser.NOT; }
    "true"         {return Parser.TRUE; }

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
    ":"            { return Parser.T_COLON; }
    ";"            { return Parser.T_SEMICOLON; }
    ","            { return Parser.T_COMMA; }

    \"             { yylStrVal = ""; yybegin(STRING); }

    {INTEGER}      {
                       yylIntVal = Integer.parseInt(yytext());
                       return Parser.INT;
                   }
    {IDENTIFIER}   {
                       yylStrVal = yytext();
                       return Parser.IDENTIFIER;
                   }
    {TYPE}         {
                       yylStrVal = yytext();
                       return Parser.TYPE;
                   }
    {WHITESPACE}   {
                       // ignoramos el espacio en blanco 
                   }

    <<EOF>>        { return Parser.EOF; }
}

<STRING> {
    \"             {
                       yybegin(YYINITIAL);
                       return Parser.STRING;
                   }
    [^\n\r\"\\]    { yylStrVal += yytext(); }
    \\t            { yylStrVal += "\t"; }
    \\n            { yylStrVal += "\n"; }
    \\b            { yylStrVal += "\b"; }
    \\f            { yylStrVal += "\f"; }
    \\\"           { yylStrVal += "\""; }
    \\\n           { /* no se hace nada */ }
    \\[^nrtf\"\\]  { yylStrVal += yytext().replace("\\", ""); }
    \n|\r          { throw new Error("String ilegal, falta un \\ final para saltar de linea"); }
}

    .           { System.out.printf("Unknown character [%s]\n", yytext());
                       return Parser.T_UNKNOWN;    }

