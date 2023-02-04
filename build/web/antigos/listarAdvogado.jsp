<%@page import="br.com.projetodefcon.model.Advogado"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advogados</title>
    </head>
    <body><font face = "Calibri">
        <h1 align="center">Advogados</h1>
        <hr>
        <table align="center" border="1">
            <tr>
                <td colspan="9" align="center">Lista de Advogados</td>
            </tr>

            <tr><th align="center" hidden="">ID</th>
                <th align="center">Nome</th>
                <th align="center">Estado</th>
                <th align="center">Cidade</th>
            </tr>

            <%
                List<Advogado> advogados = (List<Advogado>) request.getAttribute("advogados");
                for (Advogado advogado : advogados) {
            %>
            <tr>    
                <td align="center" hidden=""><%=advogado.getIdAdvogado()%></td>
                <td align="center"><%=advogado.getNomePessoa()%></td>
                <td align="center"><%=advogado.getEstadoPessoa()%></td>
                <td align="center"><%=advogado.getCidadePessoa()%></td>
            </tr>
            <%
                }
            %>

            <tr>
                <td align="center" colspan="9"><a href="homeConsumidor.jsp">Voltar</a></td>
            </tr>
        </table>
    </body>
</html>
