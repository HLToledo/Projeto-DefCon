
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Advogado</title>
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
        <script>

            function limpa_formulário_cep() {
                //Limpa valores do formulário de cep.
                document.getElementById('rua').value = ("");
                document.getElementById('bairro').value = ("");
                document.getElementById('cidade').value = ("");
                document.getElementById('uf').value = ("");
            }

            function meu_callback(conteudo) {
                if (!("erro" in conteudo)) {
                    //Atualiza os campos com os valores.
                    document.getElementById('rua').value = (conteudo.logradouro);
                    document.getElementById('bairro').value = (conteudo.bairro);
                    document.getElementById('cidade').value = (conteudo.localidade);
                    document.getElementById('uf').value = (conteudo.uf);
                } //end if.
                else {
                    //CEP não Encontrado.
                    limpa_formulário_cep();
                    alert("CEP não encontrado.");
                }
            }

            function pesquisacep(valor) {

                //Nova variável "cep" somente com dígitos.
                var cepPessoa = valor.replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cepPessoa != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if (validacep.test(cepPessoa)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        document.getElementById('rua').value = "...";
                        document.getElementById('bairro').value = "...";
                        document.getElementById('cidade').value = "...";
                        document.getElementById('uf').value = "...";

                        //Cria um elemento javascript.
                        var script = document.createElement('script');

                        //Sincroniza com o callback.
                        script.src = 'https://viacep.com.br/ws/' + cepPessoa + '/json/?callback=meu_callback';

                        //Insere script no documento e carrega o conteúdo.
                        document.body.appendChild(script);

                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            }
            ;

        </script>
    </head>
    <body>
        <h1>Cadastrar Advogado</h1>
        <hr>
        <form name="cadastrar" action="CadastrarAdvogado" method="POST">
            <table border="0">
                <tr>
                    <th id="titulotb" colspan="2">Cadastro de Advogado</th>
                </tr>    
                <tr></tr>                
                <tr>
                    <th colspan="2">${mensagem}</th>
                </tr>

                <tr>
                    <td id="tabela">Nome Completo:</td>
                    <td><input type="text" name="nomePessoa"></td>
                </tr>
               
                <tr>
                    <td id="tabela">Login:</td>
                    <td><input type="text" name="loginPessoa"></td>
                </tr>
                
                <tr>
                    <td id="tabela">Senha:</td>
                    <td><input type="text" name="senhaPessoa"></td>
                </tr>
                <tr>
                    <td id="tabela">Cep:</td>
                    <td><input name="cepPessoa" type="text" id="cep" value="" maxlength="9" onblur="pesquisacep(this.value);"/></td>
                </tr>
                <tr>
                    <td id="tabela">Endereço:</td>
                    <td><input name="enderecoPessoa" type="text" id="rua"/></td>
                </tr>
                <tr>
                    <td id="tabela">Bairro:</td>
                    <td><input name="bairroPessoa" type="text" id="bairro"/></td>
                </tr>
                <tr>
                    <td id="tabela">Cidade:</td>
                    <td><input name="cidadePessoa" type="text" id="cidade"/></td>
                </tr>
                <tr>
                    <td id="tabela">Estado:</td>
                    <td><input name="estadoPessoa" type="text" id="uf"/></td>
                </tr>
                </form>
                <tr>
                    <td id="tabela">Telefone:</td>
                    <td><input type="text" name="telefonePessoa"></td>
                </tr>
                
                <tr>
                    <td id="tabela">OAB:</td>
                    <td><input type="text" name="oabAdvogado"></td>
                </tr>
                
                <tr hidden="">
                    <td id="tabela">Tipo</td>
                    <td><input type="text" name="tipoPessoa" value="A"></td>
                </tr>
                
                <td id= "cadastrar" colspan="2">
                        <input id="cadastrar1" type="submit" name="cadastrar" value="Cadastrar">
                </td>
                <tr>
                    <td id="voltar" colspan="2" align="center"><a href="index.jsp">Voltar</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
