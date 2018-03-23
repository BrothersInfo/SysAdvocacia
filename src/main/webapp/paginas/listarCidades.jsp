<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Agenda de Contatos</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--<script type="text/javascript" src="<c:url value='/js/cidades.js'/>"></script>-->

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#filtrar-cidades')
								.click(
										function() {
											var nomeCidade = $("#pesquisar")
													.val();
											$
													.ajax({
														type : "GET",
														url : "listarCidadesAJAX",
														dataType : "json",
														data : {
															'nomeCidade' : nomeCidade
														},
														success : function(
																response) {

															var tabela = $("#listagemCidades");
															var linhas = "";

															linhas += "<tr>";
															linhas += "<th class='col-md-1'>Código</th>";
															linhas += "<th class='com-md-12'>Nome da Cidade</th>";
															linhas += "<th class='text-center' colspan='2'>OPÇÕES</th>";
															linhas += "</tr>";

															tabela.find(
																	"tbody td")
																	.remove();
															for (var i = 0; i < response.listaCidades.length; i++) {
																linhas += "<tr>";
																linhas += "<td class='col-md-1'>"
																		+ response.listaCidades[i].codigo
																		+ "</td>";
																linhas += "<td class='col-md-12'>"
																		+ response.listaCidades[i].cidade
																		+ "</td>";
																linhas += "<td class='col-md-2 btn btn-success'><a href=http://localhost:8080/SysAdv/paginas/alterarCidade?codigoCidade="
																		+ response.listaCidades[i].codigo
																		+ " style='text-decoration: none; color: white;'>ALTERAR</a></td>";
																linhas += "<td class='col-md-2 btn btn-warning'>EXCLUIR</td>";
																linhas += "</tr>";
															}
															tabela
																	.find(
																			"tbody")
																	.html(
																			linhas);
														}
													});
										});
					});
</script>

<style type="text/css">
.cor {
	color: blue;
}

.branco {
	color: white;
}
</style>

</head>
<body>
	<div id="main" class="container">
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

		<s:form id="formu" style="padding-top: 50px;" method="post"
			action="listarCidades">
			<fieldset>
				<legend class="cor">CIDADES CADASTRADAS NO SISTEMA</legend>

				<div class="row">
					<div class="col-md-6" style="padding-right: 0px;">
						<input type="text" class="form-control" id="pesquisar"
							name="nomeCidade"
							placeholder="Digite o nome da cidade a pesquisar">
					</div>
					<p id="filtrar-cidades" class="btn btn-primary">Buscar</p>
				</div>

				<table id="listagemCidades"
					class="display jqueryDataTable table table-condesed table-hover">
					<tr>
						<th>Código</th>
						<th>Nome da Cidade</th>
						<th class="text-center" colspan="2">OPÇÕES</th>
					</tr>
					<s:iterator var="c" value="listaCidades">
						<s:url id="url" action="alterarCidade">
							<s:param name="codigoCidade" value="codigo" />
						</s:url>
						<s:url id="excluir" action="excluirCidade">
							<s:param name="codigoCidade" value="codigo" />
						</s:url>
						<tr>
							<td class="col-md-1">${c.codigo}</td>
							<td class="col-md-12">${c.cidade}</td>
							<td class="col-md-2 btn btn-success"><s:a class="branco"
									style="text-decoration: none;" href="%{url}">ALTERAR</s:a></td>
							<td class="col-md-2 btn btn-warning"><s:a class="branco"
									href="%{excluir}">EXCLUIR</s:a></td>
						</tr>
					</s:iterator>
				</table>
			</fieldset>
		</s:form>
	</div>
</body>
</html>