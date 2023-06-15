package Analizadores;
import java_cup.runtime.*;

%%

%public
%class Lexer
%char
%line
%column
%cup

%{
    public String resultado="";
    public static LinkedList<TError> TablaEs = new LinkedList<TError>();
    private Symbol symbol(int tipo, Object valor) {
        return new Symbol(tipo, yyline, yycolumn, valor);
    }
%}


//------> Expresiones Regulares
numero = [0-9]+

//------> Estados

%%
/*------------  3raa Area: Reglas Lexicas ---------*/

//-----> Simbolos

"+"         { System.out.println("Lexema: "
              + yytext()
              + " columna: "
              + yychar
              + " fila: "
              + yyline ); return symbol(sym.mas, yytext());}
<YYINITIAL> "-"         { System.out.println("Reconocio "+yytext()+" menos"); return new symbol(Simbolos.menos, yycolumn, yyline, yytext()); }
<YYINITIAL> "*"         { System.out.println("Reconocio "+yytext()+" por"); return new symbol(Simbolos.por, yycolumn, yyline, yytext()); }
<YYINITIAL> "/"         { System.out.println("Reconocio "+yytext()+" div"); return new symbol(Simbolos.div, yycolumn, yyline, yytext()); }
<YYINITIAL> "("         { System.out.println("Reconocio "+yytext()+" para"); return new symbol(Simbolos.para, yycolumn, yyline, yytext()); }
<YYINITIAL> ")"         { System.out.println("Reconocio "+yytext()+" parc"); return new symbol(Simbolos.parc, yycolumn, yyline, yytext()); }


//-------> Simbolos ER
<YYINITIAL> {numero}    { System.out.println("Reconocio "+yytext()+" num"); return new symbol(Simbolos.num, yycolumn, yyline, yytext()); }

//------> Espacios
[ \t\r\n\f]             {/* Espacios en blanco, se ignoran */}
