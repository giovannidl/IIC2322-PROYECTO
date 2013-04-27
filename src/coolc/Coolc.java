package coolc;

import coolc.parser.*;

import java.io.*;
import java.util.*;

public class Coolc {

    public static void printInstructions() {
        System.out.println(
            "Usage Coolc <action> file1 file2 ... filen\n" +
            "Available actions: \n" +
            "scan - scans each files and outputs a token list\n" +
            "parse - parses each file and outputs the syntax tree\n"
            );
    }

    public static void main(String[] args) throws FileNotFoundException, IOException {

        if (args.length < 2) {
            printInstructions();
            return;
        }


        String action = args[0];

        List<String> files = Arrays.asList(args).subList(1, args.length);

        switch(action) {

            case "scan":
                scan(files);
                break;

            case "parse":
                parse(files);
                break;

            default:
                printInstructions();
                return;
        }


    }

    private static void scan(List<String> files) throws FileNotFoundException, IOException {

        for(String filename: files) {
            File f = new File(filename);
            Reader r = new FileReader(f);
            Lexer lex = new Lexer(r);
            Random rand = new Random();

            for(int token = lex.yylex(); token != Parser.EOF; token = lex.yylex()) {

                Position pos = lex.getStartPos();

                switch(token) {

                    case Parser.ID:
                        System.out.printf("%s:%2d:%2d  Id<%s>\n", f.getPath(), pos.line, pos.column, ((ValueNode)lex.getLVal()).getValue());
                        break;

                    case Parser.INTEGER:
                        System.out.printf("%s:%2d:%2d  Int<%s>\n", f.getPath(), pos.line, pos.column, ((ValueNode)lex.getLVal()).getValue());
                        break;
                        

                    case Parser.BOOL:
                        System.out.printf("%s:%2d:%2d  Boolean<%s>\n", f.getPath(), pos.line, pos.column, ((ValueNode)lex.getLVal()).getValue());
                        break;
                        
                    case Parser.TYPE:
                        System.out.printf("%s:%2d:%2d  Type<%s>\n", f.getPath(), pos.line, pos.column, ((ValueNode)lex.getLVal()).getValue());
                        break;

                    case Parser.STRING:
                        
                        String strval =(((ValueNode)lex.getLVal()).getValue()).replace("\n","").replace("\b", "").replace("\t", "").replace("\f", "").replace(">", "");
                        
                        strval = strval.substring(0, Math.min(strval.length(), 20));


                        System.out.printf("%s:%2d:%2d  String<%s>\n", f.getPath(), pos.line, pos.column, strval);
                        break;

                    default:
                        System.out.printf("%s:%2d:%2d  %s\n", f.getPath(), pos.line, pos.column, Parser.getTokenName(token));
                        break;
                }

            }
        }
    }

    private static void parse(List<String> files) throws FileNotFoundException, IOException { 

        System.err.println("error: not implemented");

    }



}  
