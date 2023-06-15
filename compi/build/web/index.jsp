<%@page import="Analizadores.parser"%>
<%@page import="java.io.StringReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="Analizadores.Lexer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Traductor</title>
        <style>
            .form-container {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .form-container .form-group {
                width: 100%;
                max-width: 400px;
            }

            .form-control {
                height: 150px; /* Ajusta la altura del campo de texto según tu preferencia */
            }

            .btn-traducir {
                background-color: green;
                margin-bottom: 10px;
            }

            .btn-descargar {
                background-color: blue;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <form>

        </div>
    </form>


    <form>
        <div class="form-group">
            <label for="exampleFormControlTextarea1">Ingrese aquí su código en JAVA</label>
            <input class="form-control" name="codeJAVA">
        </div>
        <div class="form-group">
            <label for="exampleFormControlTextarea2">Resultado del código en Python</label>
            <input class="form-control" name="codePython">
        </div>
    </form>
    <button type="submit" class="btn btn-primary btn-traducir">Traducir</button>
        <%
        String datos = request.getParameter("codeJAVA");
        //Se instancia la clase Analizador Lexico
        Lexer lex = new Lexer(new BufferedReader(new StringReader(datos)));
        parser sintactico = new parser(lex);

        try {
            sintactico.parse();
            String resultado = sintactico.resultado();
            out.println("<input class=\"form-control\" value=\"" + resultado + "\">");
    
        } catch (Exception e) {
        }
    %>
    <button type="submit" class="btn btn-primary btn-descargar">Descargar</button>
</div>
</body>
</html>
