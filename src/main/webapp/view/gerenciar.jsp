<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>${empresaNome }</title>
<!-- Importando Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body
	background="https://st.depositphotos.com/1011833/1514/i/950/depositphotos_15147795-stock-photo-aged-treasure-map-with-compass.jpg">
	<div class="container">
		<jsp:include page="topo.jsp" />
		<div class="jumbotron" style="opacity: 0.8;">
			<form action="<%=request.getContextPath()%>/gerenciar/inserir">
				<button class="btn btn-default" type="submit">Adicionar</button>
			</form>
			<c:if test="${not empty pontos}">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Nome</th>
							<th>Coordenada X</th>
							<th>Coordenada Y</th>
							<th>Editar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ponto" items="${pontos}">
							<tr>
								<td>${ponto.nome}</td>
								<td>${ponto.coordenadaX}</td>
								<td>${ponto.coordenadaY}</td>
								<td><a
									href="<%=request.getContextPath()%>/gerenciar/editar/${ponto.id}"><span
										class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>