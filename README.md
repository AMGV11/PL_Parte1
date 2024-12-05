RESUMEN

Con la ayuda de herramientas como JFlex, Cup y Ant, se ha desarrollado un procesador de lenguaje capaz procesar la parte léxica y sintáctica de un lenguaje de programación hecho desde 0.

ANÁLISIS LÉXICO

Usando la herramienta JFlex, programamos el código fuente en Java de un scanner capaz de identificar todos los Tokens de un programa fuente en el lenguaje pedido así como detectar posibles errores léxicos que éste pudiera contener. El archivo programado se puede encontrar en doc/specs/scanner.flex . 

ANÁLISIS SINTÁCTICO

Utilizando la herramienta Cup, se escribe la gramática del lenguaje. Al integrar el análisis léxico de JFlex con el código programado en Cup permite que el compilador pueda reconocer sentencias del programa fuente y detectar posibles errores sintácticos, indicando por pantalla elnúmero de línea en que ha ocurrido.

