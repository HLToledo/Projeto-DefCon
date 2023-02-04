<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Cadastro</title>
        <style>
            * {font-family: calibri;}
            h1 {text-align: center; font-size: 60px}
            table {margin: auto;}
            #titulotb {font-size: 30px}
            #tabela {text-align: right; font-size: 20px; align-content: center;}
            #voltar {text-align: center; font-size: 25px;}
            #cadastrar {text-align: center;}
            #cadastrar1 {font-size: 20px; margin-top: 10px}
            #tipo {font-family: calibri; font-weight: normal; font-size: 20px;}
        </style>
    </head>
    <body><font face = "calibri">
        <h1 align="center">Alterar Cadastro</h1>
        <hr/>
        <form name="AlterarAdvogado" action="AlterarAdvogado" method="POST">
            <table align="center" border="0">
                <tr>
                    <th id="titulotb" colspan="2" align="center">Alterar Dados</th>
                </tr>

                <tr>
                    <th colspan="2" align="center">${mensagem}</th>
                </tr>
                <tr hidden="">
                    <td><input type="text" name="idPessoa" value="${advogado.idPessoa}"></td>
                    <td><input type="text" name="idAdvogado" value="${advogado.idAdvogado}"></td>
                </tr>

                <tr>
                    <td id="tabela">Nome Completo:</td>
                    <td><input type="text" name="nomePessoa" value="${advogado.nomePessoa}"></td>
                </tr>

                <tr>
                    <td id="tabela">Login:</td>
                    <td><input type="text" name="loginPessoa" value="${advogado.loginPessoa}"></td>
                </tr>

                <tr>
                    <td id="tabela">Senha:</td>
                    <td><input type="text" name="senhaPessoa" value="${advogado.senhaPessoa}"></td>
                </tr>

                <tr>
                    <td id="tabela">CEP:</td>
                    <td><input type="text" name="cepPessoa" value="${advogado.cepPessoa}"></td>
                </tr>
                <tr>
                    <td id="tabela">Estado:</td>
                    <td><input type="text" name="estadoPessoa" value="${advogado.estadoPessoa}"></td>
                </tr>
                <tr>
                    <td id="tabela">Cidade:</td>
                    <td><input type="text" name="cidadePessoa" value="${advogado.cidadePessoa}"></td>
                </tr>
                <tr>
                    <td id="tabela">Endereço:</td>
                    <td><input type="text" name="enderecoPessoa" value="${advogado.enderecoPessoa}"></td>
                </tr>
                <tr>
                    <td id="tabela">Bairro:</td>
                    <td><input type="text" name="bairroPessoa" value="${advogado.bairroPessoa}"></td>
                </tr>
                <tr>
                    <td id="tabela">Telefone:</td>
                    <td><input type="text" name="telefonePessoa" value="${advogado.telefonePessoa}"></td>
                </tr>
                <tr>
                    <td id="tabela">OAB:</td>
                    <td><input type="text" name="oabAdvogado" value="${advogado.oabAdvogado}"></td>
                </tr>
                
                <tr>
                    <td id= "cadastrar" colspan="2" align="center"> 
                        <input id="cadastrar1" type="submit" name="alterar" value="Alterar">
                    </td>
                </tr>
                <tr>
                    <td id="voltar" align="center" colspan="2"><a href="homeAdvogado.jsp">Voltar</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
