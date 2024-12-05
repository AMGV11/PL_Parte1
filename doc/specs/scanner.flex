package compiler.lexical;

import compiler.syntax.sym;
import compiler.lexical.Token;
import es.uned.lsi.compiler.lexical.ScannerIF;
import es.uned.lsi.compiler.lexical.LexicalError;
import es.uned.lsi.compiler.lexical.LexicalErrorManager;

%%
 
%public
%class Scanner
%char
%line
%column
%cup
%ignorecase
%unicode
%notunix  

%implements ScannerIF
%scanerror LexicalError

%{
  LexicalErrorManager lexicalErrorManager = new LexicalErrorManager ();
 
 //Creamos una función para crear los tokens, consiguiendo así no repetir código y que este quede más claro. 
  private Token crearToken(int simbolo){
  			Token token = new Token (simbolo);
            token.setLine (yyline + 1);
            token.setColumn (yycolumn + 1);
            token.setLexema (yytext ());
            return token;
  			}
  			
 //Creamos una función específica para el token cadena para no enviar al analizador sintáctico las "" de las cadenas.
  private Token crearCadena(int simbolo){
 			Token token = new Token (simbolo);
            token.setLine (yyline + 1);
            token.setColumn (yycolumn + 1);
            token.setLexema (yytext ().substring(1,yytext().length()-1));
            return token;
  			}
  			
  private void crearError(String msg){
   			LexicalError error = new LexicalError (msg);
            error.setLine (yyline + 1);
            error.setColumn (yycolumn + 1);
            error.setLexema (yytext ());
            lexicalErrorManager.lexicalError (error);
            }
%}  
  
//Definimos macros para facilitar la comprensión
ESPACIO_BLANCO=[ \t\r\n\f]
letra = [A-Za-z]

%%

<YYINITIAL> 
{
//Definimos las expresiones regulares que daran forma a nuestro analizador léxico.

//Comentario          		
    "--".*					{}

//Números 			   
    0 | [1-9][0-9]*		   	{return crearToken(sym.NUM);}
    0 [0-9]+		    	{crearError("ENTERO NO VALIDO");}
 
//Cadenas    
    \"[^\"]*\"				{return crearCadena(sym.CADENA);}
           			       
//Identificadores reservados
    "true"					{return crearToken(sym.TRUE);}
    "false"					{return crearToken(sym.FALSE);}
    "and"					{return crearToken(sym.AND);}			
    "begin"					{return crearToken(sym.BEGIN);}
    "boolean"				{return crearToken(sym.BOOL);}
    "constant"				{return crearToken(sym.CONSTANT);}
    "else"					{return crearToken(sym.ELSE);}
    "end"					{return crearToken(sym.END);}
    "function"				{return crearToken(sym.FUNCTION);}
    "if"					{return crearToken(sym.IF);}
    "integer"				{return crearToken(sym.INT);}
    "is"					{return crearToken(sym.IS);}
    "loop"					{return crearToken(sym.LOOP);}
    "out"					{return crearToken(sym.OUT);}
    "procedure"				{return crearToken(sym.PROCEDURE);}
    "put_line"				{return crearToken(sym.PUTLINE);}
    "record"				{return crearToken(sym.RECORD);}
    "return"				{return crearToken(sym.RETURN);}
    "then"					{return crearToken(sym.THEN);}
    "type"					{return crearToken(sym.TYPE);}
    "while"					{return crearToken(sym.WHILE);}
    
//Símbolos
    "("						{return crearToken(sym.APERTURA);}
    ")"						{return crearToken(sym.CIERRE);}
    ","						{return crearToken(sym.COMA);}
    ";"						{return crearToken(sym.PUNTOCOMA);}
    \:						{return crearToken(sym.DOSPUNTOS);}
    \-						{return crearToken(sym.MENOS);}
    \*						{return crearToken(sym.MULTIP);}
    \>						{return crearToken(sym.MAYOR);}
    "/="					{return crearToken(sym.DISTINTO);}
    ":="					{return crearToken(sym.DECLARACION);}
    \.						{return crearToken(sym.PUNTO);}
    
//Identificador
  {letra}({letra} | [0-9])* {return crearToken(sym.IDENTIFICADOR);}
      
   {ESPACIO_BLANCO}	{}

    
//Lanza un error en caso de no coincidir con algún patron
	[^]     
                 	       {crearError("null");}
    
}
