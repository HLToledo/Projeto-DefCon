<%@page import="br.com.projetodefcon.model.Postagem"%>
<%@page import="br.com.projetodefcon.model.Comentario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comentario</title>
    </head>
    <body>
        <table border="1">
            <%
                List<Postagem> postagens = (List<Postagem>) request.getAttribute("postagens");
                for (Postagem postagem : postagens) {
            %>
            <tr>
                <td hidden="" align="center"><%=postagem.getIdPostagem()%></td>
                <td align="center"><%=postagem.getTituloPostagem()%></td>
                <td align="center"><%=postagem.getDescricaoPostagem()%></td>
            </tr>
            <%
                }
            %>
        </table>

        <table border="1">
            <%
                List<Comentario> comentarios = (List<Comentario>) request.getAttribute("comentarios");
                for (Comentario comentario : comentarios) {
            %>
            <tr>
                <td hidden="" align="center"><%=comentario.getIdComentario()%></td>
                <td align="center"><%=comentario.getDescricaoComentario()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <p align="center"><a href="ListarPostagemConsumidor">Voltar</a></p>
    </body>
</html>
