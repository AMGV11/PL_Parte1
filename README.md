RESUMEN

Con la ayuda de herramientas como JFlex, Cup y Ant, se ha desarrollado un procesador de lenguaje capaz procesar la parte léxica y sintáctica de un lenguaje de programación hecho desde 0.

ANÁLISIS LÉXICO

Usando la herramienta JFlex, programamos el código fuente en Java de un scanner capaz de identificar todos los Tokens de un programa fuente en el lenguaje pedido así como detectar posibles errores léxicos que éste pudiera contener. El archivo programado se puede encontrar en doc/specs/scanner.flex . 

ANÁLISIS SINTÁCTICO

Utilizando la herramienta Cup, se escribe la gramática del lenguaje. Al integrar el análisis léxico de JFlex con el código programado en Cup permite que el compilador pueda reconocer sentencias del programa fuente y detectar posibles errores sintácticos, indicando por pantalla el  número de línea en que ha ocurrido. El archivo programado se puede encontrar en doc/specs/parser.cup .

ENTRADA
Para cambiar la entrada, modificamos en la carpeta doc/config/build.xml la línea "<property name="test-file-name" value="Prueba Detallada"/>". Ponemos en "value" el nombre del archivo que se encuentra en la carpeta doc/test que queramos probar.




