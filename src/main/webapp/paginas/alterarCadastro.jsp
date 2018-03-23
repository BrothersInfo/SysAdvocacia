<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Novo Cadastro</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.cor {
	color: blue;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
	$(".file-upload").hide();
	$("#photo").hide();
						
	var readURL = function(input) {
	  if (input.files && input.files[0]) {
		  var reader = new FileReader();
		  reader.onload = function(e) {
			$('.foto').attr('src', e.target.result);
			var f = $('.foto').attr('src');
			$('#photo').val(f);
	      }
			reader.readAsDataURL(input.files[0]);
	  }
	}
						$(".file-upload").on('change', function() {
							readURL(this);
						var file = $(".file-upload")[0].files[0];
						});
						$("#upload-button")
								.on(
										'click',
										function() {
											var avatar = $(".foto").attr("src");
											var imagemAtual = "https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png";
											if (avatar == imagemAtual) {
												$(".file-upload").click();
											} else {
												$(".foto").attr("src",imagemAtual);
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

		<s:form action="salvarContato" method="post"
			style="padding-top: 50px;">

			<fieldset>
				<legend class="cor">ALTERAR DADOS DO CLIENTE</legend>
				<div class="row">
					<div class="col-md-10" style="padding: 0px;">
						<div class="form-group col-md-12" style="padding-left: 0px;">
							<label for="nome">Nome</label> <input class="form-control"
								id="nome" name="contato.nome"
								placeholder="Digite o nome completo" value="${contato.nome}" />
						</div>
						<div class="form-group col-md-2" style="padding-left: 0px;">
							<label for="telefone">Telefone</label> <input
								class="form-control" id="nome" name="contato.telefone"
								placeholder="Digite o telefone" value="${contato.telefone}" />
						</div>
						<div class="form-group col-md-10">
							<label for="endereco">Endereço</label> <input
								class="form-control" id="txtEndereco" name="contato.rua" value="${contato.rua}"
								placeholder="Digite o endereço" />
						</div>
					</div>
					<div id="upload-button" class="col-md-2" style="float: right;">
						<img class="foto" height="128" data-src="default.jpg"
							data-holder-rendered="true" name="contato.foto"
							style="width: 140px; height: 140px;"
							src="https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png" />
					</div>

					<input class="file-upload" type="file" accept="image/*" />
					<input id="photo" type="text" name="contato.foto" />
					
					<div class="row">
						<div class="form-group col-md-6">
							<label for="bairro">Bairro</label> <input class="form-control"
								id="txtBairro" name="contato.bairro"
								placeholder="Digite o bairro" />
						</div>
						<div class="form-group col-md-6">
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
								id="txtEmail" name="contato.email" placeholder="Digite o email" />
						</div>
					</div>
					
					<hr />

					<div class="row">
						<div class="col-md-12">
							<button type="submit" class="btn btn-success">Salvar</button>
							<s:a action="listarContatos" class="btn btn-warning">Cancelar</s:a>
						</div>
					</div>
			</fieldset>
		</s:form>

	</div>
</body>
</html>