<%@page import="br.com.projetodefcon.model.Consumidor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consumidores</title>
    </head>
    <body><font face = "Calibri">
        <h1 align="center">Consumidores</h1>
        <hr>
        <table align="center" border="1">
            <tr>
                <td colspan="9" align="center">Lista de Consumidores</td>
            </tr>
            
            <tr><th align="center" hidden="">ID</th>
                <th align="center">Nome</th>
                <th align="center">Estado</th>
                <th align="center">Cidade</th>
            </tr>
            
            <%
                List<Consumidor> consumidores = (List<Consumidor>) request.getAttribute("consumidores");
                for(Consumidor consumidor:consumidores){
            %>
            <tr>
                <td align="center" hidden=""><%=consumidor.getIdConsumidor() %></td>
                <td align="center"><%=consumidor.getNomePessoa()%></td>
                <td align="center"><%=consumidor.getEstadoPessoa()%></td>
                <td align="center"><%=consumidor.getCidadePessoa()%></td>
            </tr>
            <%
                }
            %>
            
            <tr>
                    <td align="center" colspan="9"><a href="homeAdvogado.jsp">Voltar</a></td>
            </tr>
        </table>
    </body>
</html>
