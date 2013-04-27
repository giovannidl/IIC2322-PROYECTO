%{
    import coolc.ast.*;
%}

%language "Java"

%define package coolc.parser;
%define parser_class_name "Parser"
%define public

%code {
    private AstNode _root;
    public AstNode getRoot() {
        return _root;
    }

    public static String getTokenName(int t) {
        return yytname_[t-255];
    }

}

%define stype AstNode

%right "<-"
%nonassoc "not"
%left "<=" "<" "="
%left "+" "-" 
%left "*" "/"
%nonassoc "isvoid"
%nonassoc "~"
%nonassoc "@"
%nonassoc "."

%locations

%token  T_LPAREN "(" T_RPAREN ")"
%token  T_LCURLY "{" T_RCURLY "}"
%token  T_COLON ":" T_SEMICOLON ";"
%token  T_DOT "." T_COMMA ","

%token T_CLASS      "class"
%token T_ELSE       "else"
%token T_FI         "fi"
%token T_IF         "if"
%token T_IN         "in"
%token T_INHERITS   "inherits"
%token T_ISVOID     "isvoid"
%token T_LET        "let"
%token T_LOOP       "loop"
%token T_POOL       "pool"
%token T_THEN       "then"
%token T_WHILE      "while"
%token T_CASE       "case"
%token T_ESAC       "esac"
%token T_NEW        "new"
%token T_OF         "of"
%token T_NOT        "not"

%token <Boolean> T_TRUE       "true"
%token <Boolean>T_FALSE      "false"

%token T_CAST "@"
%token T_NEGATE "~"
%token T_MULT "*" T_DIV "/"
%token T_PLUS "+" T_MINUS "-"
%token T_LTE "<=" T_LT "<" T_EQUALS "="
%token T_ASSIGN "<-"
%token T_FAT "=>"

%token T_UNKNOWN

%token <ValueNode> BOOL
%token <ValueNode> TYPE
%token <ValueNode> ID
%token <ValueNode> STRING
%token <ValueNode> INTEGER

%type <AstNode> class_list feature_list feature formal_list formal_list_not_empty
%type <AstNode> expr expr_list expr_list_not_empty expr_semicolon_list
%type <AstNode> id_type_list id_type_plus_list

%type <FormalNode> formal
%type <ClassNode> class

%%

start 
    : class_list            { root = $1; }
    ;

class_list
	: class                 { $$ = $1; }
	| class_list[list] class      { if($list != null) { $list.children.add($class); $$ = $list;} else $$ = $class; }
	;

class
	: "class" TYPE "{" "}"  { $$ = new ClassNode((String)$TYPE.getValue()); }
	| "class" TYPE "inherits" TYPE "{""}" { $$ = new ClassNode((String)(((ValueNode)$2).getValue()), (String)(((ValueNode)$4).getValue())); }
	| "class" TYPE "{" feature_list "}" {$$ = new ClassNode((String)$TYPE.getValue(), $feature_list); }
	| "class" TYPE "inherits" TYPE "{" feature_list "}" {$$ = new ClassNode((String)(((ValueNode)$2).getValue()), (String)(((ValueNode)$4).getValue()), $feature_list); }
	;

feature_list
	: /* empty */ {$$ = null; }
	| feature_list[list] feature ";" {if($list != null) { $list.children.add($feature); $$ = $list; } else $$ = $feature; }
	;

feature
	: ID "(" formal_list ")" ":" TYPE "{" expr "}" { MethodNode method = new MethodNode((String)$ID.getValue(), (String)$TYPE.getValue(), $expr); method.setParams($formal_list.children); $$ = method;}
	| formal "<-" expr { $$ = new FieldNode($formal.getId(), $formal.getType(), $expr); }
	| formal           { $$ = new FieldNode($formal.getId(), $formal.getType()); }
	;

formal_list
	: /* empty */      { $$ = null; }
	| formal_list_not_empty   { $$ = $1; }
	;

formal_list_not_empty
	: formal           { $$ = $1; }
	| formal_list_not_empty[list] "," formal { $list.children.add($formal); $$ = $list;}
	;

formal
	: ID ":" TYPE      { $$ = new FormalNode($ID.getValue(), $TYPE.getValue()); }
	;

expr
	: ID "<-" expr     { $$ = new AssignNode((String)$ID.getValue(), $3); }
	| expr "@" TYPE "." ID "(" expr_list ")"   { $$ = new CallNode($1, (String)$ID.getValue(), (String)$TYPE.getValue(), $expr_list); }
	| expr "." ID "(" expr_list ")"            { $$ = new CallNode($1, (String)$ID.getValue(), $expr_list); }
	| ID "(" expr_list ")"                     { $$ = new CallNode((String)$ID.getValue(), $expr_list); }
	| "if" expr "then" expr "else" expr "fi"   { $$ = new ConditionalNode($2, $4, $6); }
	| "while" expr "loop" expr "pool"          { $$ = new LoopNode($2, $4); }
	| "{" expr_semicolon_list "}"              { $$ = new AstNode("block", $2)}
	| "let" ID ":" TYPE "<-" expr id_type_list "in" expr
	| "let" ID ":" TYPE id_type_list "in" expr
	| "case" expr "of" id_type_plus_list "esac"
	| "new" TYPE
	| "isvoid" expr
	| expr "+" expr
	| expr "-" expr
	| expr "*" expr
	| expr "/" expr
	| "~" expr
	| expr "<" expr
	| expr "<=" expr
	| expr "=" expr
	| "not" expr
	| "(" expr ")"
	| ID
	| INTEGER
	| STRING
	| "true"
	| "false"
	;

expr_list
	: /* empty */
	| expr_list_not_empty
	;

expr_list_not_empty
	: expr
	| expr_list_not_empty "," expr
	;

expr_semicolon_list
	: expr ";"
	| expr_semicolon_list expr
	;

id_type_list
	: /* empty */ { $$ = null; }
	| id_type_list "," ID ":" TYPE "<-" expr 
	| id_type_list "," ID ":" TYPE
	;

id_type_plus_list
	: ID ":" TYPE "=>" expr ";" { $$ = new AstNode("id_type_plus_list", $ID, $TYPE, $expr); }
	| id_type_plus_list[list] ID ":" TYPE "=>" expr ";" {$list.children}
	;
%%



