
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logar</title>
        <style>
            * {font-family: calibri;}
            h1 {text-align: center; font-size: 60px}
            table {margin: auto;}
            #titulotb {font-size: 30px}
            #tabela {text-align: right; font-size: 20px; align-content: center;}
            #voltar {text-align: center; font-size: 22px;}
            #cadastrar {text-align: center;}
            #cadastrar1 {font-size: 24px; margin-top: 10px}
            #tipo {font-family: calibri; font-weight: normal; font-size: 20px;}
        </style>
    </head>
    <body>
        <h1>Login</h1>
        <form name="logarPessoa" action="LogarPessoa" method="POST">
            <table border="0">
                <tr>
                    <th id="titulotb" colspan="2" >Cadastro</th>
                </tr>    
                <tr></tr>                
                <tr>
                    <th colspan="2">${mensagem}</th>
                </tr>
                <tr>
                    <td id="tabela">Login: </td>
                    <td><input type="text" name="loginPessoa"></td>
                </tr>
                <tr>
                    <td id="tabela">Senha: </td>
                    <td><input type="text" name="senhaPessoa"></td>
                </tr>
                <td id= "cadastrar" colspan="2">
                        <input id="cadastrar1" type="submit" name="LogarPessoa" value="Logar-se">
                </td>
                <tr>
                    <td id="voltar" colspan="2" align="center"><a href="index.jsp">Voltar</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
