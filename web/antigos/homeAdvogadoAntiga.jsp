<%@page import="br.com.projetodefcon.model.Pessoa"%>
<%
    HttpServletRequest httpServletRequest = (HttpServletRequest) request;

    HttpSession sessao = httpServletRequest.getSession();

    if (sessao.getAttribute("sessaoP") != null) {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advogado</title>
    </head>
    <body>
        <h1 align="center">Advogado</h1>
        <p align="center"><a href="ListarConsumidor">Listar Consumidores</a></p>
        <p align="center"><a href="ListarPostagemAdvogado">feed de postagem</a></p>
        <p align="center"><a href="CarregarAdvogado?idPessoa=<%sessao.getAttribute("idPessoa");%>">Alterar Perfil</a></p>
        <p align="center"><a href="EncerraSessao">Sair</a></p>
    </body>
</html>
<%
    } else {
        ((HttpServletResponse) response).sendRedirect("index.jsp");
    }
%>