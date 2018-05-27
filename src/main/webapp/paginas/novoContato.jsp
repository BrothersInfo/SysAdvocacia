<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
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
	$(document)
			.ready(
					function() {
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
						});
						$("#upload-button")
								.on(
										'click',
										function() {
											var avatar = $(".foto").attr("src");
											var imagemAtual = "data:image/png;base64,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";
											if (avatar == imagemAtual) {
												$(".file-upload").click();
											} else {
												$(".foto").attr("src",
														imagemAtual);
											}

										});
					});
</script>

</head>
<body>
	<div class="container">
		<nav class="navbar navbar-inverse navbar-fixed-top" style="background-color: #ececec;">
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
						href="<% ServletActionContext.getContext().getContext(); %>">Sistema
						Advocacia</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><s:a action="novoContato">Novo Cliente</s:a></li>
						<li><s:a action="listarContatos">Listar Clientes</s:a></li>
						<li><s:a action="novaCidade">Cadastrar Cidades</s:a></li>
						<li><s:a action="listarCidades">Listar Cidades</s:a></li>
						<li><s:a action="finalizarSessao">Sair</s:a></li>
					</ul>
				</div>
			</div>
		</nav>

		<s:form action="salvarContato" method="post"
			style="padding-top: 50px;">

			<fieldset>
				<legend class="cor">CADASTRO DE NOVO CLIENTE</legend>
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
								class="form-control" id="txtEndereco" name="contato.rua"
								placeholder="Digite o endereço" />
						</div>
					</div>
					<div id="upload-button" class="col-md-2" style="float: right;">
						<img class="foto" height="128" data-src="default.jpg"
							data-holder-rendered="true" name="contato.foto"
							style="width: 140px; height: 140px;"
							src="data:image/png;base64,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" />
					</div>

					<input class="file-upload" type="file" accept="image/*" /> <input
						id="photo" type="text" name="contato.foto" />

					<div class="row">
						<div class="form-group col-md-6">
							<label for="bairro">Bairro</label> <input class="form-control"
								id="txtBairro" name="contato.bairro"
								placeholder="Digite o bairro" />
						</div>
						<div class="form-group col-md-6">
							<label for="cidade">Cidade</label> <select class="form-control"
								id="estado-endereco" name="contato.endereco.codigo">
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