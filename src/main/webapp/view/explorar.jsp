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
			<h2>Digite as coordenadas</h2>
			<form class="form-horizontal"
				action="<%=request.getContextPath()%>/explorar/find" method="POST">
				<div class="form-group">
					<label class="control-label col-sm-2">Coordenada X:</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" name="coordenadaX"
							placeholder="Digite a coordenada x" value="${coordenadaX }">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">Coordenada Y:</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" name="coordenadaY"
							placeholder="Digite a coordenada y" value="${coordenadaY }">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">Distância:</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" name="distancia"
							placeholder="Digite a distância" value="${distancia }">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Procurar</button>
					</div>
				</div>
			</form>
			<c:if test="${not empty pontos}">
				<h3>Resultados</h3>
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