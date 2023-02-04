<%-- 
    Document   : alterarAdvogado
    Created on : 5 de dez de 2022, 09:12:10
    Author     : Aluno
--%>

<%@page import="br.com.projetodefcon.model.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Home - DEFCON</title>
  <meta name="author" content="Guilherme Grigolin">
  <meta name="description" content="advogados">
  <link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.4/dist/flowbite.min.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
    integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  <link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />

  <style>
    .bg-black-alt {
      background: #191919;
    }

    .text-black-alt {
      color: #191919;
    }

    .border-black-alt {
      border-color: #191919;
    }
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

<body class="bg-black-alt font-sans leading-normal tracking-normal">
<% 
        HttpSession sessao = request.getSession(true);
        Pessoa pessoa = new Pessoa();
        pessoa = (Pessoa)sessao.getAttribute("sessaoP");
    
    %>
  <nav id="header" class="bg-gray-900 fixed w-full z-10 top-0 shadow">


    <div class="w-full container mx-auto flex flex-wrap items-center mt-0 pt-3 pb-3 md:pb-0">

      <div class="w-1/2 pl-2 md:pl-0">
        <a class="text-gray-100 text-base xl:text-xl no-underline hover:no-underline font-bold" href="#">
          <i class="fas fa-moon text-blue-400 pr-3"></i> DEFCON
        </a>
      </div>
      <div class="w-1/2 pr-0">
        <div class="flex relative inline-block float-right">
          <!-- PUXAR O NOME DO USUARIO AQUI EMBAIXO -->
          <div class="relative text-sm text-gray-100">
                        <button id="userButton" class="flex items-center focus:outline-none mr-3">
                            <span class="hidden md:inline-block text-gray-100">Olá <%=pessoa.getNomePessoa()%></span>
                            <svg class="pl-2 h-2 fill-current text-gray-100" version="1.1"
                                xmlns="http://www.w3.org/2000/svg" viewBox="0 0 129 129"
                                xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 129 129">
                                <g>
                                    <path
                                        d="m121.3,34.6c-1.6-1.6-4.2-1.6-5.8,0l-51,51.1-51.1-51.1c-1.6-1.6-4.2-1.6-5.8,0-1.6,1.6-1.6,4.2 0,5.8l53.9,53.9c0.8,0.8 1.8,1.2 2.9,1.2 1,0 2.1-0.4 2.9-1.2l53.9-53.9c1.7-1.6 1.7-4.2 0.1-5.8z" />
                                </g>
                            </svg>
                        </button>
                        <div id="userMenu"
                            class="bg-gray-900 rounded shadow-md mt-2 absolute mt-12 top-0 right-0 min-w-full overflow-auto z-30 invisible">
                            <ul class="list-reset">
                                <li><a href="EncerraSessao"
                                        class="px-4 py-2 block text-gray-100 hover:bg-gray-800 no-underline hover:no-underline">Sair</a>
                                </li>
                            </ul>
                        </div>
                    </div>


          <div class="block lg:hidden pr-4">
            <button id="nav-toggle"
              class="flex items-center px-3 py-2 border rounded text-gray-500 border-gray-600 hover:text-gray-100 hover:border-teal-500 appearance-none focus:outline-none">
              <svg class="fill-current h-3 w-3" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <title>Menu</title>
                <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z" />
              </svg>
            </button>
          </div>
        </div>

      </div>


      <div class="w-full flex-grow lg:flex lg:items-center lg:w-auto hidden lg:block mt-2 lg:mt-0 bg-gray-900 z-20"
        id="nav-content">
        <ul class="list-reset lg:flex flex-1 items-center px-4 md:px-0">
                    <li class="mr-6 my-2 md:my-0">
                        <a href="homeAdvogado.jsp"
                            class="block py-1 md:py-3 pl-1 align-middle text-blue-400 no-underline hover:text-gray-100 border-b-2 border-blue-400 hover:border-blue-400">
                            <i class="fas fa-home fa-fw mr-3 text-blue-400"></i><span
                                class="pb-1 md:pb-0 text-sm">Home</span>
                        </a>
                    </li>

                    <li class="mr-6 my-2 md:my-0">
                        <a href="ListarConsumidor"
                            class="block py-1 md:py-3 pl-1 align-middle text-gray-500 no-underline hover:text-gray-100 border-b-2 border-gray-900  hover:border-purple-400">
                            <i class="fa fa-envelope fa-fw mr-3"></i><span class="pb-1 md:pb-0 text-sm">Consumidores</span>
                        </a>
                    </li>
                    <li class="mr-6 my-2 md:my-0">
                        <a href="ListarPostagemAdvogado"
                            class="block py-1 md:py-3 pl-1 align-middle text-gray-500 no-underline hover:text-gray-100 border-b-2 border-gray-900  hover:border-green-400">
                            <i class="fas fa-chart-area fa-fw mr-3"></i><span
                                class="pb-1 md:pb-0 text-sm">Postagens</span>
                        </a>
                    </li>
                </ul>

        <div class="relative pull-right pl-4 pr-4 md:pr-0">
          <input type="search" placeholder="Procurar"
            class="w-full bg-gray-900 text-sm text-gray-400 transition border border-gray-800 focus:outline-none focus:border-gray-600 rounded py-1 px-2 pl-10 appearance-none leading-normal">
          <div class="absolute search-icon" style="top: 0.375rem;left: 1.75rem;">
            <svg class="fill-current pointer-events-none text-gray-500 w-4 h-4" xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 20 20">
              <path
                d="M12.9 14.32a8 8 0 1 1 1.41-1.41l5.35 5.33-1.42 1.42-5.33-5.34zM8 14A6 6 0 1 0 8 2a6 6 0 0 0 0 12z">
              </path>
            </svg>
          </div>
        </div>

      </div>

    </div>
  </nav>

  <!--Container-->
  <div class="container mx-auto">

    <form name="AlterarAdvogado" action="AlterarAdvogado" method="POST">
      <div class="grid gap-6 mb-6 md:grid-cols-2 pt-32">
        <div>
          <label for="nome" class="block mb-2 text-sm font-medium text-white">Nome</label>
          <input type="text" name="nomePessoa" value="${advogado.nomePessoa}" id="nome"
            class=" border  text-sm rounded-lg block w-full p-2.5 bg-gray-700 border-gray-600 placeholder-gray-400 text-white focus:ring-red-500 focus:border-red-500"
            placeholder="Nome Sobrenome" required>
        </div>
        <div>
          <label for="oab" class="block mb-2 text-sm font-medium text-white">OAB</label>
          <input type="text" id="oab" name="oabAdvogado" value="${advogado.oabAdvogado}"
            class="oab border text-sm rounded-lg  block w-full p-2.5 bg-gray-700 border-gray-600 placeholder-gray-400 text-white focus:ring-red-500 focus:border-red-500"
            placeholder="123456" required>
        </div>
        <div>
          <label for="email" class="block mb-2 text-sm font-medium text-white">Login</label>
          <input type="text" id="email" name="loginPessoa" value="${advogado.loginPessoa}"
            class="border text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-full p-2.5 bg-gray-700 border-gray-600 placeholder-gray-400 text-white"
            placeholder="login" required>
        </div>
        <div>
          <label for="password" class="block mb-2 text-sm font-medium text-white">Senha</label>
          <input type="password" id="password" name="senhaPessoa" value="${advogado.senhaPessoa}"
            class=" border text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-full p-2.5 bg-gray-700 border-gray-600 placeholder-gray-400 text-white"
            placeholder="•••••••••" required>
        </div>
        <div>
          <label for="CEP" class="block mb-2 text-sm font-medium text-white">CEP</label>
          <input type="text" id="cep" name="cepPessoa" onblur="pesquisacep(this.value);" value="${advogado.cepPessoa}"
            class="cep border text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-full p-2.5 bg-gray-700 border-gray-600 placeholder-gray-400 text-white "
            placeholder="12345-678" required>
        </div>
        <div>
          <label for="telefone" class="block mb-2 text-sm font-medium text-white">Telefone</label>
          <input type="text" id="telefone" name="telefonePessoa" value="${advogado.telefonePessoa}"
            class="telefone border text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-full p-2.5 bg-gray-700 border-gray-600 placeholder-gray-400 text-white"
            placeholder="(11) 99111-1110" required>
        </div>
                <input hidden="" name="estadoPessoa" type="text" id="uf" value="${advogado.estadoPessoa}">
                <input hidden="" type="text" name="cidadePessoa" id="cidade" value="${advogado.cidadePessoa}">
                <input hidden="" type="text" name="enderecoPessoa" id="rua" value="${advogado.enderecoPessoa}">
                <input hidden="" type="text" name="bairroPessoa" id="bairro" value="${advogado.bairroPessoa}">
                <input hidden="" type="text" name="idPessoa" value="${advogado.idPessoa}">
                <input hidden="" type="text" name="idAdvogado" value="${advogado.idAdvogado}">
      <div>
        <button type="submit" name="alterar" value="Alterar"
          class="text-white  focus:ring-4 focus:outline-none  font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center bg-red-600 hover:bg-red-700 focus:ring-red-800">Alterar</button>
      </div>
    </form>
  </div>
  <script>

    /*Toggle dropdown list*/
    /*https://gist.github.com/slavapas/593e8e50cf4cc16ac972afcbad4f70c8*/

    var userMenuDiv = document.getElementById("userMenu");
    var userMenu = document.getElementById("userButton");

    var navMenuDiv = document.getElementById("nav-content");
    var navMenu = document.getElementById("nav-toggle");

    document.onclick = check;

    function check(e) {
      var target = (e && e.target) || (event && event.srcElement);

      //User Menu
      if (!checkParent(target, userMenuDiv)) {
        // click NOT on the menu
        if (checkParent(target, userMenu)) {
          // click on the link
          if (userMenuDiv.classList.contains("invisible")) {
            userMenuDiv.classList.remove("invisible");
          } else { userMenuDiv.classList.add("invisible"); }
        } else {
          // click both outside link and outside menu, hide menu
          userMenuDiv.classList.add("invisible");
        }
      }

      //Nav Menu
      if (!checkParent(target, navMenuDiv)) {
        // click NOT on the menu
        if (checkParent(target, navMenu)) {
          // click on the link
          if (navMenuDiv.classList.contains("hidden")) {
            navMenuDiv.classList.remove("hidden");
          } else { navMenuDiv.classList.add("hidden"); }
        } else {
          // click both outside link and outside menu, hide menu
          navMenuDiv.classList.add("hidden");
        }
      }

    }

    function checkParent(t, elm) {
      while (t.parentNode) {
        if (t == elm) { return true; }
        t = t.parentNode;
      }
      return false;
    }


  </script>
  <script src="https://unpkg.com/flowbite@1.5.4/dist/flowbite.js"></script>
  <script src="script/cleave.min.js"></script>
  <script>
    var cleave = new Cleave('.oab', {
      blocks: [6],
      uppercase: true,
      numericOnly: true
    });

    new Cleave('.cep', {
      delimiters: ['-'],
      blocks: [5, 3],
      uppercase: true,
      numericOnly: true
    });

    new Cleave('.telefone', {
      delimiters: ['(', ') ', '-'],
      blocks: [0, 2, 5, 4],
      numericOnly: true,
    });
  </script>
</body>

</html>
