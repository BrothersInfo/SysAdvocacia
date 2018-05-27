<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>

<html>
<head>
<title>Agenda de Contatos</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#filtrar-contatos')
								.click(
										function() {
											var nomeContato = $("#pesquisar")
													.val();
											$.ajax({
														type : "GET",
														url : "listarContatosAJAX",
														dataType : "json",
														data : {
															'nomeContato' : nomeContato
														},
														success : function(
																response) {

															var tabela = $("#listagemContatos");
															var linhas = "";

															linhas += "<tr>";
															linhas += "<th class='col-md-1'>Código</th>";
															linhas += "<th class='com-md-4'>Nome do Contato</th>";
															linhas += "<th class='col-md-2'>Telefone</th>";
															linhas += "<th class='com-md-6'>Email</th>";
															linhas += "<th class='text-center' colspan='2'>OPÇÕES</th>";
															linhas += "</tr>";

															tabela.find(
																	"tbody td")
																	.remove();
															for (var i = 0; i < response.listaContatos.length; i++) {
																linhas += "<tr>";
																linhas += "<td class='col-md-1'>"
																		+ response.listaContatos[i].codigo
																		+ "</td>";
																linhas += "<td class='col-md-4'>"
																		+ response.listaContatos[i].nome
																		+ "</td>";
																linhas += "<td class='col-md-2'>"
																		+ response.listaContatos[i].telefone
																		+ "</td>";
																linhas += "<td class='col-md-6'>"
																		+ response.listaContatos[i].email
																		+ "</td>";
																linhas += "<td class='col-md-2 btn btn-success'><a href=http://localhost:8080/SysAdv/paginas/alterarContato?codigoContato="
																		+ response.listaContatos[i].codigo
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
</style>

</head>
<body>
	<div id="main" class="container">
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

		<s:form id="formu" style="padding-top: 50px;" method="post"
			action="listarContatos">
			<fieldset>
				<legend class="cor">LISTAGEM DE CLIENTES CADASTRADOS NO SISTEMA</legend>

				<div class="row">
					<div class="col-md-6" style="padding-right: 0px;">
						<input type="text" class="form-control" id="pesquisar"
							name="nomeContato"
							placeholder="Digite o nome do contato para pesquisar">
					</div>
					<p id="filtrar-contatos" class="btn btn-primary">Buscar</p>
				</div>

				<table id="listagemContatos"
					class="table table-condesed table-hover">
					<tr>
						<th class="col-md-1">Código</th>
						<th class="col-md-4">Nome do Contato</th>
						<!--<th>Rua</th>
                    <th>Bairro</th>
                    <th>Cidade</th>-->
						<th class="col-md-2">Telefone</th>
						<th class="col-md-6">Email</th>
						<th class="text-center" colspan="2">OPÇÕES</th>
					</tr>
					<s:iterator var="c" value="listaContatos">
						<s:url id="url" action="alterarContato">
							<s:param name="codigoContato" value="codigo" />
						</s:url>
						<s:url id="excluir" action="excluirCliente">
							<s:param name="codigoContato" value="codigo" />
						</s:url>
						<tr>
							<td class="col-md-1">${c.codigo}</td>
							<td class="col-md-4" id="txtnome">${c.nome}</td>
							<td class="col-md-2">${c.telefone}</td>
							<td class="col-md-6">${c.email}</td>
							<td class="col-md-2 btn btn-success"><s:a href="%{url}"
									style="text-decoration:none; color: white;">ALTERAR</s:a></td>
							<!-- <td class="btn btn-warning"><s:a href="%{excluir}"
                                     style="text-decoration:none; color: white;">EXCLUIR</s:a></td>-->
							<td class="col-md-2 btn btn-warning" data-toggle="modal"
								data-target="#confirm">EXCLUIR</td>
						</tr>

						<div class="modal fade" id="confirm" role="dialog">
							<div class="modal-dialog modal-md">

								<div class="modal-content">
									<div class="modal-body">
										<p>Deseja realmente excluir esse cliente</p>
									</div>
									<div class="modal-footer">
										<a href="wfefwe" type="button" class="btn btn-danger"
											id="delete">Excluir Cidade</a>
										<button type="button" data-dismiss="modal"
											class="btn btn-default">Cancelar</button>
									</div>
								</div>

							</div>
						</div>

					</s:iterator>
				</table>
			</fieldset>
		</s:form>
	</div>
</body>
</html>