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
        <title>Consumidor</title>
    </head>
    <body>
        <h1 align="center">Consumidor</h1>
        <p align="center"><a href="ListarAdvogado">Listar Advogados</a></p>
        <p align="center"><a href="ListarPostagemConsumidor">feed de postagem</a></p>
        <p align="center"><a href="CarregarConsumidor">Alterar Perfil</a></p>
        <p align="center"><a href="EncerraSessao">Sair</a></p>
    </body>
</html>
<%
    } else {
        ((HttpServletResponse) response).sendRedirect("index.jsp");
    }
%>