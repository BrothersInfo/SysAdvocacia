<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <title>Novo Cadastro</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.12/jquery.mask.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.12/jquery.mask.min.js"></script>

        <style type="text/css">
            .cor {
                color: blue;
            }
            .modal {
                text-align: center;
            }
            @media screen and (min-width: 768px) {
                .modal:before {
                    display: inline-block;
                    vertical-align: middle;
                    content: " ";
                    height: 100%;
                }
            }
            .modal-dialog {
                display: inline-block;
                text-align: left;
                vertical-align: middle;
            }
        </style>

        <script type="text/javascript">
            $(document).ready(function () {

                $(".file-upload").hide();
                $("#photo").hide();
                $("#idContato").hide();

                var mascara = function (val) {
                    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
                },
                        spOptions = {
                            onKeyPress: function (val, e, field, options) {
                                field.mask(mascara.apply({}, arguments), options);
                            }
                        };

                $('#txttelefone').mask(mascara, spOptions);

                var readURL = function (input) {
                    var size = input.files[0].size;
                    if (size >= 1048576) {
                        //alert("Tamanho máximo da FOTO 1MB");
                        $(".maxSize").click();
                        return;
                    }
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            $('.foto').attr('src', e.target.result);
                            var f = $('.foto').attr('src');
                            $('#photo').val(f);
                        }
                        reader.readAsDataURL(input.files[0]);
                    }
                }
                $(".file-upload").on('change', function () {
                    readURL(this);
                });
                $("#upload-button").on('click',
                        function () {
                            var avatar = $(".foto").attr("src");
                            var imagemAtual = "data:image/png;base64,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";
                            if (avatar == imagemAtual) {
                                $(".file-upload").click();
                            } else {
                                $("#photo").val(imagemAtual);
                                $(".foto").attr("src", imagemAtual);
                            }

                        });
            });
        </script>

    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-inverse navbar-fixed-top"
                 style="background-color: #ececec;">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                                aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span> <span
                                class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand"
                           href="http://localhost:8080/SistemaAdvocacia">Sistema
                            Advocacia</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><s:a action="novoContato">Novo Cliente</s:a></li>
                            <li><s:a action="listarContatos">Listar Clientes</s:a></li>
                            <li><s:a action="novaCidade">Cadastrar Cidades</s:a></li>
                            <li><s:a action="listarCidades">Listar Cidades</s:a></li>
                                <li><a href="listarContatos">Sair</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>

            <s:form action="confirmarAlteracao" method="post"
                    style="padding-top: 50px;">

                <fieldset>
                    <legend class="cor">ALTERAR DADOS DO CLIENTE</legend>

                    <div class="row" id="idContato">
                        <div class="form-group col-md-2">
                            <label for="nome">Código</label> <input
                                class="form-control text-center" id="codigo" name="contato.codigo"
                                value="${contato.codigo}" readonly="readonly" />
                        </div>
                    </div>

                    <div class="col-md-10" style="padding: 0px;">
                        <div class="form-group col-md-12" style="padding-left: 0px;">
                            <label for="nome">Nome</label> 
                            <input class="form-control" id="nome" name="contato.nome" placeholder="Digite o nome completo" value="${contato.nome}" />
                        </div>
                        <div class="form-group col-md-2" style="padding-left: 0px;">
                            <label for="telefone">Telefone</label> <input class="form-control" id="txttelefone" name="contato.telefone" placeholder="Digite o telefone" value="${contato.telefone}" />
                        </div>
                        <div class="form-group col-md-10">
                            <label for="endereco">Endereço</label> <input class="form-control" id="txtEndereco" name="contato.rua" value="${contato.rua}" placeholder="Digite o endereço" />
                        </div>
                    </div>

                    <div id="upload-button" class="col-md-2" style="float: right;">
                        <img class="foto" height="128" data-src="default.jpg"
                             data-holder-rendered="true" name="contato.foto"
                             style="width: 140px; height: 140px;"
                             src="${contato.foto}" />
                    </div>
                    <!--src="https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png"-->
                    <input class="file-upload" type="file" accept="image/png, image/jpg, image/jpeg, image/bmp" style="display: none;" />
                    <input id="photo" type="text" name="contato.foto" value="${contato.foto}" />

                    <div class="row">
                        <div class="form-group col-md-8">
                            <label for="bairro">Bairro</label> <input class="form-control"
                                                                      id="txtBairro" name="contato.bairro" value="${contato.bairro}"
                                                                      placeholder="Digite o bairro" />
                        </div>
                        <div class="form-group col-md-4">
                            <label for="cidade">Cidade</label>
                            <select class="form-control" id="estado-endereco"
                                    name="contato.endereco.codigo">
                                <option value=""></option>
                                <c:forEach items="${listaCidades}" var="cidade">
                                    <option value="${cidade.codigo}"
                                            ${contato.endereco.codigo == cidade.codigo ? 'selected' : ''}>${cidade.cidade}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-12">
                            <label for="lblEmail">Email</label> <input class="form-control"
                                                                       id="txtEmail" name="contato.email" value="${contato.email}" placeholder="Digite o email" />
                        </div>
                    </div>

                    <hr />

                    <div class="row">
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-success">Alterar</button>
                            <s:a action="listarContatos" class="btn btn-warning">Cancelar</s:a>
                            </div>
                        </div>
                    </fieldset>
            </s:form>

            <!-- Modal -->
            <div class="maxSize" data-toggle="modal" data-target="#modalMAX"></div>
            <div class="modal fade" id="modalMAX" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title text-center" id="myModalLabel" style="color: red;">FOTO MUITO GRANDE</h4>
                        </div>
                        <div class="modal-body text-center">
                            Foto muito grande, a foto deve ser menor que 1MB
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>