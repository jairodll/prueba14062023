SET JAVA_HOME="C:\Program Files\Java\jdk1.8.0_261\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%;
cd C:\Users\jairo\OneDrive\Documentos\NetBeansProjects\compi\src\java\Analizadores
java -jar c:\Users\jairo\OneDrive\Escritorio\Fuentes\java-cup-11b.jar -parser parser -symbols sym A_Sintactico.cup
pause
