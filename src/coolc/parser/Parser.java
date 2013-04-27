/* A Bison parser, made by GNU Bison 2.5.  */

/* Skeleton implementation for Bison LALR(1) parsers in Java
   
      Copyright (C) 2007-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

package coolc.parser;
/* First part of user declarations.  */

/* Line 32 of lalr1.java  */
/* Line 1 of "cool.y"  */

    import coolc.ast.*;


/**
 * A Bison parser, automatically generated from <tt>cool.y</tt>.
 *
 * @author LALR (1) parser skeleton written by Paolo Bonzini.
 */
public class Parser
{
    /** Version number for the Bison executable that generated this parser.  */
  public static final String bisonVersion = "2.5";

  /** Name of the skeleton that generated this parser.  */
  public static final String bisonSkeleton = "lalr1.java";


  /** True if verbose error messages are enabled.  */
  public boolean errorVerbose = false;


  /**
   * A class defining a pair of positions.  Positions, defined by the
   * <code>Position</code> class, denote a point in the input.
   * Locations represent a part of the input through the beginning
   * and ending positions.  */
  public class Location {
    /** The first, inclusive, position in the range.  */
    public Position begin;

    /** The first position beyond the range.  */
    public Position end;

    /**
     * Create a <code>Location</code> denoting an empty range located at
     * a given point.
     * @param loc The position at which the range is anchored.  */
    public Location (Position loc) {
      this.begin = this.end = loc;
    }

    /**
     * Create a <code>Location</code> from the endpoints of the range.
     * @param begin The first position included in the range.
     * @param end   The first position beyond the range.  */
    public Location (Position begin, Position end) {
      this.begin = begin;
      this.end = end;
    }

    /**
     * Print a representation of the location.  For this to be correct,
     * <code>Position</code> should override the <code>equals</code>
     * method.  */
    public String toString () {
      if (begin.equals (end))
        return begin.toString ();
      else
        return begin.toString () + "-" + end.toString ();
    }
  }



  /** Token returned by the scanner to signal the end of its input.  */
  public static final int EOF = 0;

/* Tokens.  */
  /** Token number, to be returned by the scanner.  */
  public static final int T_LPAREN = 258;
  /** Token number, to be returned by the scanner.  */
  public static final int T_RPAREN = 259;
  /** Token number, to be returned by the scanner.  */
  public static final int T_LCURLY = 260;
  /** Token number, to be returned by the scanner.  */
  public static final int T_RCURLY = 261;
  /** Token number, to be returned by the scanner.  */
  public static final int T_COLON = 262;
  /** Token number, to be returned by the scanner.  */
  public static final int T_SEMICOLON = 263;
  /** Token number, to be returned by the scanner.  */
  public static final int T_DOT = 264;
  /** Token number, to be returned by the scanner.  */
  public static final int T_COMMA = 265;
  /** Token number, to be returned by the scanner.  */
  public static final int T_CLASS = 266;
  /** Token number, to be returned by the scanner.  */
  public static final int T_ELSE = 267;
  /** Token number, to be returned by the scanner.  */
  public static final int T_FI = 268;
  /** Token number, to be returned by the scanner.  */
  public static final int T_IF = 269;
  /** Token number, to be returned by the scanner.  */
  public static final int T_IN = 270;
  /** Token number, to be returned by the scanner.  */
  public static final int T_INHERITS = 271;
  /** Token number, to be returned by the scanner.  */
  public static final int T_ISVOID = 272;
  /** Token number, to be returned by the scanner.  */
  public static final int T_LET = 273;
  /** Token number, to be returned by the scanner.  */
  public static final int T_LOOP = 274;
  /** Token number, to be returned by the scanner.  */
  public static final int T_POOL = 275;
  /** Token number, to be returned by the scanner.  */
  public static final int T_THEN = 276;
  /** Token number, to be returned by the scanner.  */
  public static final int T_WHILE = 277;
  /** Token number, to be returned by the scanner.  */
  public static final int T_CASE = 278;
  /** Token number, to be returned by the scanner.  */
  public static final int T_ESAC = 279;
  /** Token number, to be returned by the scanner.  */
  public static final int T_NEW = 280;
  /** Token number, to be returned by the scanner.  */
  public static final int T_OF = 281;
  /** Token number, to be returned by the scanner.  */
  public static final int T_NOT = 282;
  /** Token number, to be returned by the scanner.  */
  public static final int T_TRUE = 283;
  /** Token number, to be returned by the scanner.  */
  public static final int T_FALSE = 284;
  /** Token number, to be returned by the scanner.  */
  public static final int T_CAST = 285;
  /** Token number, to be returned by the scanner.  */
  public static final int T_NEGATE = 286;
  /** Token number, to be returned by the scanner.  */
  public static final int T_MULT = 287;
  /** Token number, to be returned by the scanner.  */
  public static final int T_DIV = 288;
  /** Token number, to be returned by the scanner.  */
  public static final int T_PLUS = 289;
  /** Token number, to be returned by the scanner.  */
  public static final int T_MINUS = 290;
  /** Token number, to be returned by the scanner.  */
  public static final int T_LTE = 291;
  /** Token number, to be returned by the scanner.  */
  public static final int T_LT = 292;
  /** Token number, to be returned by the scanner.  */
  public static final int T_EQUALS = 293;
  /** Token number, to be returned by the scanner.  */
  public static final int T_ASSIGN = 294;
  /** Token number, to be returned by the scanner.  */
  public static final int T_FAT = 295;
  /** Token number, to be returned by the scanner.  */
  public static final int T_UNKNOWN = 296;
  /** Token number, to be returned by the scanner.  */
  public static final int BOOL = 297;
  /** Token number, to be returned by the scanner.  */
  public static final int TYPE = 298;
  /** Token number, to be returned by the scanner.  */
  public static final int ID = 299;
  /** Token number, to be returned by the scanner.  */
  public static final int STRING = 300;
  /** Token number, to be returned by the scanner.  */
  public static final int INTEGER = 301;



  
  private Location yylloc (YYStack rhs, int n)
  {
    if (n > 0)
      return new Location (rhs.locationAt (n-1).begin, rhs.locationAt (0).end);
    else
      return new Location (rhs.locationAt (0).end);
  }

  /**
   * Communication interface between the scanner and the Bison-generated
   * parser <tt>Parser</tt>.
   */
  public interface Lexer {
    /**
     * Method to retrieve the beginning position of the last scanned token.
     * @return the position at which the last scanned token starts.  */
    Position getStartPos ();

    /**
     * Method to retrieve the ending position of the last scanned token.
     * @return the first position beyond the last scanned token.  */
    Position getEndPos ();

    /**
     * Method to retrieve the semantic value of the last scanned token.
     * @return the semantic value of the last scanned token.  */
    AstNode getLVal ();

    /**
     * Entry point for the scanner.  Returns the token identifier corresponding
     * to the next token and prepares to return the semantic value
     * and beginning/ending positions of the token.
     * @return the token identifier corresponding to the next token. */
    int yylex () throws java.io.IOException;

    /**
     * Entry point for error reporting.  Emits an error
     * referring to the given location in a user-defined way.
     *
     * @param loc The location of the element to which the
     *                error message is related
     * @param s The string for the error message.  */
     void yyerror (Location loc, String s);
  }

  /** The object doing lexical analysis for us.  */
  private Lexer yylexer;
  
  



  /**
   * Instantiates the Bison-generated parser.
   * @param yylexer The scanner that will supply tokens to the parser.
   */
  public Parser (Lexer yylexer) {
    this.yylexer = yylexer;
    
  }

  private java.io.PrintStream yyDebugStream = System.err;

  /**
   * Return the <tt>PrintStream</tt> on which the debugging output is
   * printed.
   */
  public final java.io.PrintStream getDebugStream () { return yyDebugStream; }

  /**
   * Set the <tt>PrintStream</tt> on which the debug output is printed.
   * @param s The stream that is used for debugging output.
   */
  public final void setDebugStream(java.io.PrintStream s) { yyDebugStream = s; }

  private int yydebug = 0;

  /**
   * Answer the verbosity of the debugging output; 0 means that all kinds of
   * output from the parser are suppressed.
   */
  public final int getDebugLevel() { return yydebug; }

  /**
   * Set the verbosity of the debugging output; 0 means that all kinds of
   * output from the parser are suppressed.
   * @param level The verbosity level for debugging output.
   */
  public final void setDebugLevel(int level) { yydebug = level; }

  private final int yylex () throws java.io.IOException {
    return yylexer.yylex ();
  }
  protected final void yyerror (Location loc, String s) {
    yylexer.yyerror (loc, s);
  }

  
  protected final void yyerror (String s) {
    yylexer.yyerror ((Location)null, s);
  }
  protected final void yyerror (Position loc, String s) {
    yylexer.yyerror (new Location (loc), s);
  }

  protected final void yycdebug (String s) {
    if (yydebug > 0)
      yyDebugStream.println (s);
  }

  private final class YYStack {
    private int[] stateStack = new int[16];
    private Location[] locStack = new Location[16];
    private AstNode[] valueStack = new AstNode[16];

    public int size = 16;
    public int height = -1;

    public final void push (int state, AstNode value			    , Location loc) {
      height++;
      if (size == height)
        {
	  int[] newStateStack = new int[size * 2];
	  System.arraycopy (stateStack, 0, newStateStack, 0, height);
	  stateStack = newStateStack;
	  
	  Location[] newLocStack = new Location[size * 2];
	  System.arraycopy (locStack, 0, newLocStack, 0, height);
	  locStack = newLocStack;

	  AstNode[] newValueStack = new AstNode[size * 2];
	  System.arraycopy (valueStack, 0, newValueStack, 0, height);
	  valueStack = newValueStack;

	  size *= 2;
	}

      stateStack[height] = state;
      locStack[height] = loc;
      valueStack[height] = value;
    }

    public final void pop () {
      pop (1);
    }

    public final void pop (int num) {
      // Avoid memory leaks... garbage collection is a white lie!
      if (num > 0) {
	java.util.Arrays.fill (valueStack, height - num + 1, height + 1, null);
        java.util.Arrays.fill (locStack, height - num + 1, height + 1, null);
      }
      height -= num;
    }

    public final int stateAt (int i) {
      return stateStack[height - i];
    }

    public final Location locationAt (int i) {
      return locStack[height - i];
    }

    public final AstNode valueAt (int i) {
      return valueStack[height - i];
    }

    // Print the state stack on the debug stream.
    public void print (java.io.PrintStream out)
    {
      out.print ("Stack now");

      for (int i = 0; i <= height; i++)
        {
	  out.print (' ');
	  out.print (stateStack[i]);
        }
      out.println ();
    }
  }

  /**
   * Returned by a Bison action in order to stop the parsing process and
   * return success (<tt>true</tt>).  */
  public static final int YYACCEPT = 0;

  /**
   * Returned by a Bison action in order to stop the parsing process and
   * return failure (<tt>false</tt>).  */
  public static final int YYABORT = 1;

  /**
   * Returned by a Bison action in order to start error recovery without
   * printing an error message.  */
  public static final int YYERROR = 2;

  // Internal return codes that are not supported for user semantic
  // actions.
  private static final int YYERRLAB = 3;
  private static final int YYNEWSTATE = 4;
  private static final int YYDEFAULT = 5;
  private static final int YYREDUCE = 6;
  private static final int YYERRLAB1 = 7;
  private static final int YYRETURN = 8;

  private int yyerrstatus_ = 0;

  /**
   * Return whether error recovery is being done.  In this state, the parser
   * reads token until it reaches a known state, and then restarts normal
   * operation.  */
  public final boolean recovering ()
  {
    return yyerrstatus_ == 0;
  }

  private int yyaction (int yyn, YYStack yystack, int yylen) 
  {
    AstNode yyval;
    Location yyloc = yylloc (yystack, yylen);

    /* If YYLEN is nonzero, implement the default value of the action:
       `$$ = $1'.  Otherwise, use the top of the stack.

       Otherwise, the following line sets YYVAL to garbage.
       This behavior is undocumented and Bison
       users should not rely upon it.  */
    if (yylen > 0)
      yyval = yystack.valueAt (yylen - 1);
    else
      yyval = yystack.valueAt (0);

    yy_reduce_print (yyn, yystack);

    switch (yyn)
      {
	  case 2:
  if (yyn == 2)
    
/* Line 351 of lalr1.java  */
/* Line 89 of "cool.y"  */
    { root = ((AstNode)(yystack.valueAt (1-(1)))); };
  break;
    

  case 3:
  if (yyn == 3)
    
/* Line 351 of lalr1.java  */
/* Line 93 of "cool.y"  */
    { yyval = ((ClassNode)(yystack.valueAt (1-(1)))); };
  break;
    

  case 4:
  if (yyn == 4)
    
/* Line 351 of lalr1.java  */
/* Line 94 of "cool.y"  */
    { ((AstNode)(yystack.valueAt (2-(1)))).children.add(((ClassNode)(yystack.valueAt (2-(2))))); yyval = ((AstNode)(yystack.valueAt (2-(1)))); };
  break;
    

  case 5:
  if (yyn == 5)
    
/* Line 351 of lalr1.java  */
/* Line 98 of "cool.y"  */
    { yyval = new ClassNode((String)((ValueNode)(yystack.valueAt (4-(2)))).getValue()); };
  break;
    

  case 6:
  if (yyn == 6)
    
/* Line 351 of lalr1.java  */
/* Line 99 of "cool.y"  */
    { yyval = new ClassNode((String)(((ValueNode)((ValueNode)(yystack.valueAt (6-(2))))).getValue()), (String)(((ValueNode)((ValueNode)(yystack.valueAt (6-(4))))).getValue())); };
  break;
    

  case 7:
  if (yyn == 7)
    
/* Line 351 of lalr1.java  */
/* Line 100 of "cool.y"  */
    {yyval = new ClassNode((String)((ValueNode)(yystack.valueAt (5-(2)))).getValue(), ((AstNode)(yystack.valueAt (5-(4))))); };
  break;
    

  case 8:
  if (yyn == 8)
    
/* Line 351 of lalr1.java  */
/* Line 101 of "cool.y"  */
    {yyval = new ClassNode((String)(((ValueNode)((ValueNode)(yystack.valueAt (7-(2))))).getValue()), (String)(((ValueNode)((ValueNode)(yystack.valueAt (7-(4))))).getValue()), ((AstNode)(yystack.valueAt (7-(6))))); };
  break;
    

  case 9:
  if (yyn == 9)
    
/* Line 351 of lalr1.java  */
/* Line 105 of "cool.y"  */
    {yyval = null; };
  break;
    

  case 10:
  if (yyn == 10)
    
/* Line 351 of lalr1.java  */
/* Line 106 of "cool.y"  */
    {((AstNode)(yystack.valueAt (3-(1)))).children.add(((AstNode)(yystack.valueAt (3-(2))))); yyval = ((AstNode)(yystack.valueAt (3-(1)))); };
  break;
    

  case 11:
  if (yyn == 11)
    
/* Line 351 of lalr1.java  */
/* Line 110 of "cool.y"  */
    { MethodNode method = new MethodNode((String)((ValueNode)(yystack.valueAt (9-(1)))).getValue(), (String)((ValueNode)(yystack.valueAt (9-(6)))).getValue(), ((AstNode)(yystack.valueAt (9-(8))))); method.setParams(((AstNode)(yystack.valueAt (9-(3))))); yyval = method;};
  break;
    

  case 12:
  if (yyn == 12)
    
/* Line 351 of lalr1.java  */
/* Line 111 of "cool.y"  */
    { yyval = new FieldNode(((FormalNode)(yystack.valueAt (3-(1)))).getId(), ((FormalNode)(yystack.valueAt (3-(1)))).getType(), ((AstNode)(yystack.valueAt (3-(3))))); };
  break;
    

  case 13:
  if (yyn == 13)
    
/* Line 351 of lalr1.java  */
/* Line 112 of "cool.y"  */
    { yyval = new FieldNode(((FormalNode)(yystack.valueAt (1-(1)))).getId(), ((FormalNode)(yystack.valueAt (1-(1)))).getType()); };
  break;
    

  case 14:
  if (yyn == 14)
    
/* Line 351 of lalr1.java  */
/* Line 116 of "cool.y"  */
    { yyval = null; };
  break;
    

  case 15:
  if (yyn == 15)
    
/* Line 351 of lalr1.java  */
/* Line 117 of "cool.y"  */
    { yyval = ((AstNode)(yystack.valueAt (1-(1)))); };
  break;
    

  case 16:
  if (yyn == 16)
    
/* Line 351 of lalr1.java  */
/* Line 121 of "cool.y"  */
    { yyval = ((FormalNode)(yystack.valueAt (1-(1)))); };
  break;
    

  case 17:
  if (yyn == 17)
    
/* Line 351 of lalr1.java  */
/* Line 122 of "cool.y"  */
    { ((AstNode)(yystack.valueAt (3-(1)))).children.add(((FormalNode)(yystack.valueAt (3-(3))))); yyval = ((AstNode)(yystack.valueAt (3-(1))));};
  break;
    

  case 18:
  if (yyn == 18)
    
/* Line 351 of lalr1.java  */
/* Line 126 of "cool.y"  */
    { yyval = new FormalNode(((ValueNode)(yystack.valueAt (3-(1)))).getValue(), ((ValueNode)(yystack.valueAt (3-(3)))).getValue()); };
  break;
    

  case 19:
  if (yyn == 19)
    
/* Line 351 of lalr1.java  */
/* Line 130 of "cool.y"  */
    { yyval = new AssignNode((String)((ValueNode)(yystack.valueAt (3-(1)))).getValue(), ((AstNode)(yystack.valueAt (3-(3))))); };
  break;
    

  case 20:
  if (yyn == 20)
    
/* Line 351 of lalr1.java  */
/* Line 131 of "cool.y"  */
    { yyval = new CallNode(((AstNode)(yystack.valueAt (8-(1)))), (String)((ValueNode)(yystack.valueAt (8-(5)))).getValue(), (String)((ValueNode)(yystack.valueAt (8-(3)))).getValue(), ((AstNode)(yystack.valueAt (8-(7))))); };
  break;
    

  case 21:
  if (yyn == 21)
    
/* Line 351 of lalr1.java  */
/* Line 132 of "cool.y"  */
    { yyval = new CallNode(((AstNode)(yystack.valueAt (6-(1)))), (String)((ValueNode)(yystack.valueAt (6-(3)))).getValue(), ((AstNode)(yystack.valueAt (6-(5))))); };
  break;
    

  case 22:
  if (yyn == 22)
    
/* Line 351 of lalr1.java  */
/* Line 133 of "cool.y"  */
    { yyval = new CallNode((String)((ValueNode)(yystack.valueAt (4-(1)))).getValue(), ((AstNode)(yystack.valueAt (4-(3))))); };
  break;
    



/* Line 351 of lalr1.java  */
/* Line 628 of "src/coolc/parser/Parser.java"  */
	default: break;
      }

    yy_symbol_print ("-> $$ =", yyr1_[yyn], yyval, yyloc);

    yystack.pop (yylen);
    yylen = 0;

    /* Shift the result of the reduction.  */
    yyn = yyr1_[yyn];
    int yystate = yypgoto_[yyn - yyntokens_] + yystack.stateAt (0);
    if (0 <= yystate && yystate <= yylast_
	&& yycheck_[yystate] == yystack.stateAt (0))
      yystate = yytable_[yystate];
    else
      yystate = yydefgoto_[yyn - yyntokens_];

    yystack.push (yystate, yyval, yyloc);
    return YYNEWSTATE;
  }

  /* Return YYSTR after stripping away unnecessary quotes and
     backslashes, so that it's suitable for yyerror.  The heuristic is
     that double-quoting is unnecessary unless the string contains an
     apostrophe, a comma, or backslash (other than backslash-backslash).
     YYSTR is taken from yytname.  */
  private final String yytnamerr_ (String yystr)
  {
    if (yystr.charAt (0) == '"')
      {
        StringBuffer yyr = new StringBuffer ();
        strip_quotes: for (int i = 1; i < yystr.length (); i++)
          switch (yystr.charAt (i))
            {
            case '\'':
            case ',':
              break strip_quotes;

            case '\\':
	      if (yystr.charAt(++i) != '\\')
                break strip_quotes;
              /* Fall through.  */
            default:
              yyr.append (yystr.charAt (i));
              break;

            case '"':
              return yyr.toString ();
            }
      }
    else if (yystr.equals ("$end"))
      return "end of input";

    return yystr;
  }

  /*--------------------------------.
  | Print this symbol on YYOUTPUT.  |
  `--------------------------------*/

  private void yy_symbol_print (String s, int yytype,
			         AstNode yyvaluep				 , Object yylocationp)
  {
    if (yydebug > 0)
    yycdebug (s + (yytype < yyntokens_ ? " token " : " nterm ")
	      + yytname_[yytype] + " ("
	      + yylocationp + ": "
	      + (yyvaluep == null ? "(null)" : yyvaluep.toString ()) + ")");
  }

  /**
   * Parse input from the scanner that was specified at object construction
   * time.  Return whether the end of the input was reached successfully.
   *
   * @return <tt>true</tt> if the parsing succeeds.  Note that this does not
   *          imply that there were no syntax errors.
   */
  public boolean parse () throws java.io.IOException
  {
    /// Lookahead and lookahead in internal form.
    int yychar = yyempty_;
    int yytoken = 0;

    /* State.  */
    int yyn = 0;
    int yylen = 0;
    int yystate = 0;

    YYStack yystack = new YYStack ();

    /* Error handling.  */
    int yynerrs_ = 0;
    /// The location where the error started.
    Location yyerrloc = null;

    /// Location of the lookahead.
    Location yylloc = new Location (null, null);

    /// @$.
    Location yyloc;

    /// Semantic value of the lookahead.
    AstNode yylval = null;

    int yyresult;

    yycdebug ("Starting parse\n");
    yyerrstatus_ = 0;


    /* Initialize the stack.  */
    yystack.push (yystate, yylval, yylloc);

    int label = YYNEWSTATE;
    for (;;)
      switch (label)
      {
        /* New state.  Unlike in the C/C++ skeletons, the state is already
	   pushed when we come here.  */
      case YYNEWSTATE:
        yycdebug ("Entering state " + yystate + "\n");
        if (yydebug > 0)
          yystack.print (yyDebugStream);

        /* Accept?  */
        if (yystate == yyfinal_)
          return true;

        /* Take a decision.  First try without lookahead.  */
        yyn = yypact_[yystate];
        if (yy_pact_value_is_default_ (yyn))
          {
            label = YYDEFAULT;
	    break;
          }

        /* Read a lookahead token.  */
        if (yychar == yyempty_)
          {
	    yycdebug ("Reading a token: ");
	    yychar = yylex ();
            
	    yylloc = new Location(yylexer.getStartPos (),
				            yylexer.getEndPos ());
            yylval = yylexer.getLVal ();
          }

        /* Convert token to internal form.  */
        if (yychar <= EOF)
          {
	    yychar = yytoken = EOF;
	    yycdebug ("Now at end of input.\n");
          }
        else
          {
	    yytoken = yytranslate_ (yychar);
	    yy_symbol_print ("Next token is", yytoken,
			     yylval, yylloc);
          }

        /* If the proper action on seeing token YYTOKEN is to reduce or to
           detect an error, take that action.  */
        yyn += yytoken;
        if (yyn < 0 || yylast_ < yyn || yycheck_[yyn] != yytoken)
          label = YYDEFAULT;

        /* <= 0 means reduce or error.  */
        else if ((yyn = yytable_[yyn]) <= 0)
          {
	    if (yy_table_value_is_error_ (yyn))
	      label = YYERRLAB;
	    else
	      {
	        yyn = -yyn;
	        label = YYREDUCE;
	      }
          }

        else
          {
            /* Shift the lookahead token.  */
	    yy_symbol_print ("Shifting", yytoken,
			     yylval, yylloc);

            /* Discard the token being shifted.  */
            yychar = yyempty_;

            /* Count tokens shifted since error; after three, turn off error
               status.  */
            if (yyerrstatus_ > 0)
              --yyerrstatus_;

            yystate = yyn;
            yystack.push (yystate, yylval, yylloc);
            label = YYNEWSTATE;
          }
        break;

      /*-----------------------------------------------------------.
      | yydefault -- do the default action for the current state.  |
      `-----------------------------------------------------------*/
      case YYDEFAULT:
        yyn = yydefact_[yystate];
        if (yyn == 0)
          label = YYERRLAB;
        else
          label = YYREDUCE;
        break;

      /*-----------------------------.
      | yyreduce -- Do a reduction.  |
      `-----------------------------*/
      case YYREDUCE:
        yylen = yyr2_[yyn];
        label = yyaction (yyn, yystack, yylen);
	yystate = yystack.stateAt (0);
        break;

      /*------------------------------------.
      | yyerrlab -- here on detecting error |
      `------------------------------------*/
      case YYERRLAB:
        /* If not already recovering from an error, report this error.  */
        if (yyerrstatus_ == 0)
          {
            ++yynerrs_;
            if (yychar == yyempty_)
              yytoken = yyempty_;
            yyerror (yylloc, yysyntax_error (yystate, yytoken));
          }

        yyerrloc = yylloc;
        if (yyerrstatus_ == 3)
          {
	    /* If just tried and failed to reuse lookahead token after an
	     error, discard it.  */

	    if (yychar <= EOF)
	      {
	      /* Return failure if at end of input.  */
	      if (yychar == EOF)
	        return false;
	      }
	    else
	      yychar = yyempty_;
          }

        /* Else will try to reuse lookahead token after shifting the error
           token.  */
        label = YYERRLAB1;
        break;

      /*---------------------------------------------------.
      | errorlab -- error raised explicitly by YYERROR.  |
      `---------------------------------------------------*/
      case YYERROR:

        yyerrloc = yystack.locationAt (yylen - 1);
        /* Do not reclaim the symbols of the rule which action triggered
           this YYERROR.  */
        yystack.pop (yylen);
        yylen = 0;
        yystate = yystack.stateAt (0);
        label = YYERRLAB1;
        break;

      /*-------------------------------------------------------------.
      | yyerrlab1 -- common code for both syntax error and YYERROR.  |
      `-------------------------------------------------------------*/
      case YYERRLAB1:
        yyerrstatus_ = 3;	/* Each real token shifted decrements this.  */

        for (;;)
          {
	    yyn = yypact_[yystate];
	    if (!yy_pact_value_is_default_ (yyn))
	      {
	        yyn += yyterror_;
	        if (0 <= yyn && yyn <= yylast_ && yycheck_[yyn] == yyterror_)
	          {
	            yyn = yytable_[yyn];
	            if (0 < yyn)
		      break;
	          }
	      }

	    /* Pop the current state because it cannot handle the error token.  */
	    if (yystack.height == 1)
	      return false;

	    yyerrloc = yystack.locationAt (0);
	    yystack.pop ();
	    yystate = yystack.stateAt (0);
	    if (yydebug > 0)
	      yystack.print (yyDebugStream);
          }

	
	/* Muck with the stack to setup for yylloc.  */
	yystack.push (0, null, yylloc);
	yystack.push (0, null, yyerrloc);
        yyloc = yylloc (yystack, 2);
	yystack.pop (2);

        /* Shift the error token.  */
        yy_symbol_print ("Shifting", yystos_[yyn],
			 yylval, yyloc);

        yystate = yyn;
	yystack.push (yyn, yylval, yyloc);
        label = YYNEWSTATE;
        break;

        /* Accept.  */
      case YYACCEPT:
        return true;

        /* Abort.  */
      case YYABORT:
        return false;
      }
  }

  // Generate an error message.
  private String yysyntax_error (int yystate, int tok)
  {
    if (errorVerbose)
      {
        /* There are many possibilities here to consider:
           - Assume YYFAIL is not used.  It's too flawed to consider.
             See
             <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
             for details.  YYERROR is fine as it does not invoke this
             function.
           - If this state is a consistent state with a default action,
             then the only way this function was invoked is if the
             default action is an error action.  In that case, don't
             check for expected tokens because there are none.
           - The only way there can be no lookahead present (in tok) is
             if this state is a consistent state with a default action.
             Thus, detecting the absence of a lookahead is sufficient to
             determine that there is no unexpected or expected token to
             report.  In that case, just report a simple "syntax error".
           - Don't assume there isn't a lookahead just because this
             state is a consistent state with a default action.  There
             might have been a previous inconsistent state, consistent
             state with a non-default action, or user semantic action
             that manipulated yychar.  (However, yychar is currently out
             of scope during semantic actions.)
           - Of course, the expected token list depends on states to
             have correct lookahead information, and it depends on the
             parser not to perform extra reductions after fetching a
             lookahead from the scanner and before detecting a syntax
             error.  Thus, state merging (from LALR or IELR) and default
             reductions corrupt the expected token list.  However, the
             list is correct for canonical LR with one exception: it
             will still contain any token that will not be accepted due
             to an error action in a later state.
        */
        if (tok != yyempty_)
          {
            // FIXME: This method of building the message is not compatible
            // with internationalization.
            StringBuffer res =
              new StringBuffer ("syntax error, unexpected ");
            res.append (yytnamerr_ (yytname_[tok]));
            int yyn = yypact_[yystate];
            if (!yy_pact_value_is_default_ (yyn))
              {
                /* Start YYX at -YYN if negative to avoid negative
                   indexes in YYCHECK.  In other words, skip the first
                   -YYN actions for this state because they are default
                   actions.  */
                int yyxbegin = yyn < 0 ? -yyn : 0;
                /* Stay within bounds of both yycheck and yytname.  */
                int yychecklim = yylast_ - yyn + 1;
                int yyxend = yychecklim < yyntokens_ ? yychecklim : yyntokens_;
                int count = 0;
                for (int x = yyxbegin; x < yyxend; ++x)
                  if (yycheck_[x + yyn] == x && x != yyterror_
                      && !yy_table_value_is_error_ (yytable_[x + yyn]))
                    ++count;
                if (count < 5)
                  {
                    count = 0;
                    for (int x = yyxbegin; x < yyxend; ++x)
                      if (yycheck_[x + yyn] == x && x != yyterror_
                          && !yy_table_value_is_error_ (yytable_[x + yyn]))
                        {
                          res.append (count++ == 0 ? ", expecting " : " or ");
                          res.append (yytnamerr_ (yytname_[x]));
                        }
                  }
              }
            return res.toString ();
          }
      }

    return "syntax error";
  }

  /**
   * Whether the given <code>yypact_</code> value indicates a defaulted state.
   * @param yyvalue   the value to check
   */
  private static boolean yy_pact_value_is_default_ (int yyvalue)
  {
    return yyvalue == yypact_ninf_;
  }

  /**
   * Whether the given <code>yytable_</code> value indicates a syntax error.
   * @param yyvalue   the value to check
   */
  private static boolean yy_table_value_is_error_ (int yyvalue)
  {
    return yyvalue == yytable_ninf_;
  }

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
  private static final short yypact_ninf_ = -97;
  private static final short yypact_[] =
  {
        11,   -31,    30,    11,   -97,     1,   -97,   -97,    15,   -12,
     -97,    -4,    27,   -97,    21,    42,    -5,    32,     9,    18,
     -97,    98,   -97,    -3,    47,    58,    55,   -97,   -97,    98,
      98,    98,    98,    22,    98,    98,    24,    98,   -97,   -97,
      98,    -2,   -97,   -97,   243,   -97,    63,     9,   100,   131,
      46,   162,     6,    65,   193,   184,   -97,   243,     6,    98,
      98,    34,    33,    98,    98,    98,    98,    98,    98,    98,
      37,   -97,   -97,   -97,   -97,   243,    98,    38,    98,    41,
     243,    82,    77,   243,    85,    80,     6,     6,    26,    26,
     253,   253,   253,    88,   223,    56,   204,    87,   -17,   -97,
      98,    98,    52,    98,    98,    98,     8,   -97,    57,   -97,
      91,   243,    95,    99,   122,   234,   243,    61,    98,    66,
      68,   -97,    98,   -97,   -97,    10,   101,   243,    98,    74,
     113,    98,    75,   140,    98,   -97,   243,    83,   -97,   171,
      98,   -97,   243
  };

  /* YYDEFACT[S] -- default reduction number in state S.  Performed when
     YYTABLE doesn't specify something else to do.  Zero means the
     default is an error.  */
  private static final byte yydefact_[] =
  {
         0,     0,     0,     2,     3,     0,     1,     4,     9,     0,
       5,     0,     0,     7,     0,     0,    13,     9,    14,     0,
      10,     0,     6,     0,     0,     0,    15,    16,    18,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    44,    45,
       0,    41,    43,    42,    12,     8,     0,     0,     0,     0,
       0,     0,    30,     0,     0,     0,    29,    39,    35,    46,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    17,    40,    50,    25,    51,     0,     0,     0,     0,
      48,     0,    47,    19,     0,     0,    33,    34,    31,    32,
      37,    36,    38,     0,     0,    52,     0,     0,     0,    22,
       0,    46,     0,     0,     0,     0,     0,    24,     0,    28,
       0,    49,     0,     0,     0,     0,    52,     0,     0,     0,
       0,    21,    46,    11,    23,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    20,    26,    54,    55,     0,
       0,    56,    53
  };

  /* YYPGOTO[NTERM-NUM].  */
  private static final byte yypgoto_[] =
  {
       -97,   -97,   -97,   121,   124,   -97,   -97,   -97,   -14,   -21,
     -96,   -97,   -97,    29,   -97
  };

  /* YYDEFGOTO[NTERM-NUM].  */
  private static final byte
  yydefgoto_[] =
  {
        -1,     2,     3,     4,    11,    15,    25,    26,    16,    80,
      81,    82,    50,   106,    98
  };

  /* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule which
     number is the opposite.  If YYTABLE_NINF_, syntax error.  */
  private static final short yytable_ninf_ = -1;
  private static final short
  yytable_[] =
  {
        44,    59,    13,    45,    27,   112,     8,   109,    48,    49,
      51,    52,     5,    54,    55,    61,    57,     9,   117,    58,
     117,    10,     1,   118,    18,   131,   130,   110,    19,    75,
       6,    12,    17,    71,    21,    61,    62,    60,    22,    83,
      14,    14,    86,    87,    88,    89,    90,    91,    92,    29,
      20,    30,    74,    24,    19,    94,    62,    96,    63,    64,
      31,    28,    46,    32,    33,    47,    53,    56,    34,    35,
      70,    36,    77,    37,    38,    39,    85,    40,    84,   111,
      93,    95,   114,   115,   116,    97,    99,   100,   101,   102,
      41,    42,    43,   103,   108,   105,   113,   127,   120,   121,
     119,    29,   122,    30,    72,   126,   128,   133,   132,    61,
     136,   129,    31,   139,   134,    32,    33,   135,   137,   142,
      34,    35,   140,    36,     7,    37,    38,    39,   123,    40,
      62,    61,    63,    64,    65,    66,    67,    68,    69,    73,
      61,    23,    41,    42,    43,   125,     0,     0,   138,    61,
       0,     0,    62,     0,    63,    64,    65,    66,    67,    68,
      69,    62,     0,    63,    64,    65,    66,    67,    68,    69,
      62,    61,    63,    64,    65,    66,    67,    68,    69,   141,
      61,     0,     0,    76,     0,     0,     0,     0,     0,     0,
       0,     0,    62,    61,    63,    64,    65,    66,    67,    68,
      69,    62,    61,    63,    64,    65,    66,    67,    68,    69,
      79,     0,    78,    61,    62,     0,    63,    64,    65,    66,
      67,    68,    69,    62,   107,    63,    64,    65,    66,    67,
      68,    69,    61,     0,    62,   104,    63,    64,    65,    66,
      67,    68,    69,    61,     0,     0,     0,   124,     0,     0,
       0,     0,    61,    62,     0,    63,    64,    65,    66,    67,
      68,    69,    61,     0,    62,     0,    63,    64,    65,    66,
      67,    68,    69,    62,     0,    63,    64,    65,    66,    67,
      68,    69,     0,    62,     0,    63,    64,    65,    66
  };

  /* YYCHECK.  */
  private static final short
  yycheck_[] =
  {
        21,     3,     6,     6,    18,   101,     5,    24,    29,    30,
      31,    32,    43,    34,    35,     9,    37,    16,    10,    40,
      10,     6,    11,    15,     3,    15,   122,    44,     7,    50,
       0,    43,     5,    47,    39,     9,    30,    39,     6,    60,
      44,    44,    63,    64,    65,    66,    67,    68,    69,     3,
       8,     5,     6,    44,     7,    76,    30,    78,    32,    33,
      14,    43,     4,    17,    18,    10,    44,    43,    22,    23,
       7,    25,     7,    27,    28,    29,    43,    31,    44,   100,
      43,    43,   103,   104,   105,    44,     4,    10,     3,     9,
      44,    45,    46,     5,     7,    39,    44,   118,     7,     4,
      43,     3,     3,     5,     4,    44,    40,   128,     7,     9,
     131,    43,    14,   134,    40,    17,    18,     4,    43,   140,
      22,    23,    39,    25,     3,    27,    28,    29,     6,    31,
      30,     9,    32,    33,    34,    35,    36,    37,    38,     8,
       9,    17,    44,    45,    46,   116,    -1,    -1,     8,     9,
      -1,    -1,    30,    -1,    32,    33,    34,    35,    36,    37,
      38,    30,    -1,    32,    33,    34,    35,    36,    37,    38,
      30,     9,    32,    33,    34,    35,    36,    37,    38,     8,
       9,    -1,    -1,    21,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    30,     9,    32,    33,    34,    35,    36,    37,
      38,    30,     9,    32,    33,    34,    35,    36,    37,    38,
      26,    -1,    19,     9,    30,    -1,    32,    33,    34,    35,
      36,    37,    38,    30,    20,    32,    33,    34,    35,    36,
      37,    38,     9,    -1,    30,    12,    32,    33,    34,    35,
      36,    37,    38,     9,    -1,    -1,    -1,    13,    -1,    -1,
      -1,    -1,     9,    30,    -1,    32,    33,    34,    35,    36,
      37,    38,     9,    -1,    30,    -1,    32,    33,    34,    35,
      36,    37,    38,    30,    -1,    32,    33,    34,    35,    36,
      37,    38,    -1,    30,    -1,    32,    33,    34,    35
  };

  /* STOS_[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
  private static final byte
  yystos_[] =
  {
         0,    11,    48,    49,    50,    43,     0,    50,     5,    16,
       6,    51,    43,     6,    44,    52,    55,     5,     3,     7,
       8,    39,     6,    51,    44,    53,    54,    55,    43,     3,
       5,    14,    17,    18,    22,    23,    25,    27,    28,    29,
      31,    44,    45,    46,    56,     6,     4,    10,    56,    56,
      59,    56,    56,    44,    56,    56,    43,    56,    56,     3,
      39,     9,    30,    32,    33,    34,    35,    36,    37,    38,
       7,    55,     4,     8,     6,    56,    21,     7,    19,    26,
      56,    57,    58,    56,    44,    43,    56,    56,    56,    56,
      56,    56,    56,    43,    56,    43,    56,    44,    61,     4,
      10,     3,     9,     5,    12,    39,    60,    20,     7,    24,
      44,    56,    57,    44,    56,    56,    56,    10,    15,    43,
       7,     4,     3,     6,    13,    60,    44,    56,    40,    43,
      57,    15,     7,    56,    40,     4,    56,    43,     8,    56,
      39,     8,    56
  };

  /* TOKEN_NUMBER_[YYLEX-NUM] -- Internal symbol number corresponding
     to YYLEX-NUM.  */
  private static final short
  yytoken_number_[] =
  {
         0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301
  };

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
  private static final byte
  yyr1_[] =
  {
         0,    47,    48,    49,    49,    50,    50,    50,    50,    51,
      51,    52,    52,    52,    53,    53,    54,    54,    55,    56,
      56,    56,    56,    56,    56,    56,    56,    56,    56,    56,
      56,    56,    56,    56,    56,    56,    56,    56,    56,    56,
      56,    56,    56,    56,    56,    56,    57,    57,    58,    58,
      59,    59,    60,    60,    60,    61,    61
  };

  /* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
  private static final byte
  yyr2_[] =
  {
         0,     2,     1,     1,     2,     4,     6,     5,     7,     0,
       3,     9,     3,     1,     0,     1,     1,     3,     3,     3,
       8,     6,     4,     7,     5,     3,     9,     7,     5,     2,
       2,     3,     3,     3,     3,     2,     3,     3,     3,     2,
       3,     1,     1,     1,     1,     1,     0,     1,     1,     3,
       2,     2,     0,     7,     5,     6,     7
  };

  /* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
     First, the terminals, then, starting at \a yyntokens_, nonterminals.  */
  private static final String yytname_[] =
  {
    "$end", "error", "$undefined", "\"(\"", "\")\"", "\"{\"", "\"}\"",
  "\":\"", "\";\"", "\".\"", "\",\"", "\"class\"", "\"else\"", "\"fi\"",
  "\"if\"", "\"in\"", "\"inherits\"", "\"isvoid\"", "\"let\"", "\"loop\"",
  "\"pool\"", "\"then\"", "\"while\"", "\"case\"", "\"esac\"", "\"new\"",
  "\"of\"", "\"not\"", "\"true\"", "\"false\"", "\"@\"", "\"~\"", "\"*\"",
  "\"/\"", "\"+\"", "\"-\"", "\"<=\"", "\"<\"", "\"=\"", "\"<-\"",
  "\"=>\"", "T_UNKNOWN", "BOOL", "TYPE", "ID", "STRING", "INTEGER",
  "$accept", "start", "class_list", "class", "feature_list", "feature",
  "formal_list", "formal_list_not_empty", "formal", "expr", "expr_list",
  "expr_list_not_empty", "expr_semicolon_list", "id_type_list",
  "id_type_plus_list", null
  };

  /* YYRHS -- A `-1'-separated list of the rules' RHS.  */
  private static final byte yyrhs_[] =
  {
        48,     0,    -1,    49,    -1,    50,    -1,    49,    50,    -1,
      11,    43,     5,     6,    -1,    11,    43,    16,    43,     5,
       6,    -1,    11,    43,     5,    51,     6,    -1,    11,    43,
      16,    43,     5,    51,     6,    -1,    -1,    51,    52,     8,
      -1,    44,     3,    53,     4,     7,    43,     5,    56,     6,
      -1,    55,    39,    56,    -1,    55,    -1,    -1,    54,    -1,
      55,    -1,    54,    10,    55,    -1,    44,     7,    43,    -1,
      44,    39,    56,    -1,    56,    30,    43,     9,    44,     3,
      57,     4,    -1,    56,     9,    44,     3,    57,     4,    -1,
      44,     3,    57,     4,    -1,    14,    56,    21,    56,    12,
      56,    13,    -1,    22,    56,    19,    56,    20,    -1,     5,
      59,     6,    -1,    18,    44,     7,    43,    39,    56,    60,
      15,    56,    -1,    18,    44,     7,    43,    60,    15,    56,
      -1,    23,    56,    26,    61,    24,    -1,    25,    43,    -1,
      17,    56,    -1,    56,    34,    56,    -1,    56,    35,    56,
      -1,    56,    32,    56,    -1,    56,    33,    56,    -1,    31,
      56,    -1,    56,    37,    56,    -1,    56,    36,    56,    -1,
      56,    38,    56,    -1,    27,    56,    -1,     3,    56,     4,
      -1,    44,    -1,    46,    -1,    45,    -1,    28,    -1,    29,
      -1,    -1,    58,    -1,    56,    -1,    58,    10,    56,    -1,
      56,     8,    -1,    59,    56,    -1,    -1,    60,    10,    44,
       7,    43,    39,    56,    -1,    60,    10,    44,     7,    43,
      -1,    44,     7,    43,    40,    56,     8,    -1,    61,    44,
       7,    43,    40,    56,     8,    -1
  };

  /* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
     YYRHS.  */
  private static final short yyprhs_[] =
  {
         0,     0,     3,     5,     7,    10,    15,    22,    28,    36,
      37,    41,    51,    55,    57,    58,    60,    62,    66,    70,
      74,    83,    90,    95,   103,   109,   113,   123,   131,   137,
     140,   143,   147,   151,   155,   159,   162,   166,   170,   174,
     177,   181,   183,   185,   187,   189,   191,   192,   194,   196,
     200,   203,   206,   207,   215,   221,   228
  };

  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
  private static final short yyrline_[] =
  {
         0,    89,    89,    93,    94,    98,    99,   100,   101,   105,
     106,   110,   111,   112,   116,   117,   121,   122,   126,   130,
     131,   132,   133,   134,   135,   136,   137,   138,   139,   140,
     141,   142,   143,   144,   145,   146,   147,   148,   149,   150,
     151,   152,   153,   154,   155,   156,   159,   161,   165,   166,
     170,   171,   174,   176,   177,   181,   182
  };

  // Report on the debug stream that the rule yyrule is going to be reduced.
  private void yy_reduce_print (int yyrule, YYStack yystack)
  {
    if (yydebug == 0)
      return;

    int yylno = yyrline_[yyrule];
    int yynrhs = yyr2_[yyrule];
    /* Print the symbols being reduced, and their result.  */
    yycdebug ("Reducing stack by rule " + (yyrule - 1)
	      + " (line " + yylno + "), ");

    /* The symbols being reduced.  */
    for (int yyi = 0; yyi < yynrhs; yyi++)
      yy_symbol_print ("   $" + (yyi + 1) + " =",
		       yyrhs_[yyprhs_[yyrule] + yyi],
		       ((yystack.valueAt (yynrhs-(yyi + 1)))),
		       yystack.locationAt (yynrhs-(yyi + 1)));
  }

  /* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
  private static final byte yytranslate_table_[] =
  {
         0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46
  };

  private static final byte yytranslate_ (int t)
  {
    if (t >= 0 && t <= yyuser_token_number_max_)
      return yytranslate_table_[t];
    else
      return yyundef_token_;
  }

  private static final int yylast_ = 288;
  private static final int yynnts_ = 15;
  private static final int yyempty_ = -2;
  private static final int yyfinal_ = 6;
  private static final int yyterror_ = 1;
  private static final int yyerrcode_ = 256;
  private static final int yyntokens_ = 47;

  private static final int yyuser_token_number_max_ = 301;
  private static final int yyundef_token_ = 2;

/* User implementation code.  */
/* Unqualified %code blocks.  */

/* Line 927 of lalr1.java  */
/* Line 11 of "cool.y"  */

    private AstNode _root;
    public AstNode getRoot() {
        return _root;
    }

    public static String getTokenName(int t) {
        return yytname_[t-255];
    }




/* Line 927 of lalr1.java  */
/* Line 1401 of "src/coolc/parser/Parser.java"  */

}


/* Line 931 of lalr1.java  */
/* Line 184 of "cool.y"  */





