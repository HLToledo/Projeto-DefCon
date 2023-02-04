<%@page import="br.com.projetodefcon.model.Postagem"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Postagens</title>
    </head>
    <body>
        <table border="1">
            <%
                List<Postagem> postagens = (List<Postagem>) request.getAttribute("postagens");
                for (Postagem postagem : postagens) {
            %>
            <tr>
                <td><%=postagem.getIdPostagem()%></td>
                <td><%=postagem.getTituloPostagem()%></td>
                <td><%=postagem.getDescricaoPostagem()%></td>
                <td align="center"><a href="ListarComentarioConsumidor?idPostagem=<%=postagem.getIdPostagem()%>">Abrir Postagem</a></td>
            </tr>
            <%
                }
            %>
        </table>
        <form name="cadastrar" action="CadastrarPostagemConsumidor" method="POST">
            <table border="1">
                <tr>Título:</tr>
                <tr><input type="text" name="tituloPostagem"></tr>
                <br>
                <tr><input type="text" name="descricaoPostagem"></tr>
                <tr><input type="submit" name="cadastrar" value="Enviar"></tr>
                <tr>
                    <td align="center" colspan="9"><a href="homeConsumidor.jsp">Voltar</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
