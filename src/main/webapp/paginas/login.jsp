<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.12/jquery.mask.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.12/jquery.mask.min.js"></script>
<title>:::Pagina de Login:::</title>
<style type="text/css">
#login {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -110px;
	margin-top: -40px;
}
</style>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var mascara = function(val) {
							return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000'
									: '(00) 0000-00009';
						}, spOptions = {
							onKeyPress : function(val, e, field, options) {
								field.mask(mascara.apply({}, arguments),
										options);
							}
						};
						$('#txttelefone').mask(mascara, spOptions);

						$(".logar").click(function() {
							alert("OK");
							var email = $("#txtemail").val();
							var senha = $("#txtsenha").val();
							$.ajax({
								type : "GET",
								url : "logarNoSistema",
								dataType : "json",
								data : {
									"usuario" : email,
									"senha" : senha
								},
								success : function(retorno) {
									if (retorno.acessoPermitido == true) {
										window.location = "listarContatos";
									} else {
										$(".loginErrado").click();
									}
								}
							});
						});
					});
</script>

</head>
<body>
	<div class="container">
		<div class="row" id="login" style="height: 200; width: 300;">
			<div class="row">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input id="txtemail"
						type="text" class="form-control" name="email"
						placeholder="Insira seu email">
				</div>
			</div>
			<div class="row">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-lock"></i></span> <input id="txtsenha"
						type="password" class="form-control" name="senha"
						placeholder="Senha">
				</div>
			</div>
			<div class="row" style="padding-top: 15px;">
				<div class="input-group col-md-12">
					<span class="col-md-6 btn btn-default logar">Entrar no
						sistema</span> <span class="col-md-6 btn btn-default" name="senha"
						style="float: right;" data-toggle="modal"
						data-target="#modalCadastro">Faça seu cadastro</span>
				</div>
			</div>
		</div>

		<!-- Modal - Login Errado-->
		<div class="loginErrado" data-toggle="modal" data-target="#modalLogin"></div>
		<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title text-center" id="myModalLabel"
							style="color: red;">DADOS INCORRETOS</h4>
					</div>
					<div class="modal-body text-center">Login ou senha inválidos.
						Tente novamente!</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal - Cadastro-->
		<div class="modal fade" id="modalCadastro" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title text-center" id="myModalLabel"
							style="color: blue;">NOVO CADASTRO</h4>
					</div>
					<div class="modal-body" style="height: 200px;">
						<form action="salvarUsuario" method="POST">
							<div class="col-md-12">
								Nome:<input class="form-control" name="usuario.nome" type="text" />
							</div>
							<div class="col-md-4">
								Telefone:<input class="form-control" name="usuario.telefone"
									id="txttelefone" type="text" />
							</div>
							<div class="col-md-8">
								Endereço:<input class="form-control" name="usuario.endereco"
									type="text" />
							</div>
							<div class="col-md-8">
								Email:<input class="form-control" name="usuario.email"
									type="text" />
							</div>
							<div class="col-md-4">
								Senha:<input class="form-control" name="usuario.senha"
									type="password" />
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default">Enviar</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>