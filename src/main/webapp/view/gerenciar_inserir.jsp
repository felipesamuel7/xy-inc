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
			<form class="form-horizontal"
				<c:choose>
				    <c:when test="${empty ponto}">
				        action="<%=request.getContextPath()%>/gerenciar/create"
				    </c:when>
				    <c:otherwise>
				       action="<%=request.getContextPath()%>/gerenciar/edit"
				    </c:otherwise>
				</c:choose>
				method="POST">
				<input type="hidden" name="id" value="${ponto.id }">
				<div class="form-group">
					<label class="control-label col-sm-2">Nome:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="nome"
							placeholder="Digite o nome do local" value="${ponto.nome }">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">Coordenada X:</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" name="coordenadaX"
							placeholder="Digite a coordenada x" value="${ponto.coordenadaX }">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">Coordenada Y:</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" name="coordenadaY"
							placeholder="Digite a coordenada y" value="${ponto.coordenadaY }">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Enviar</button>
						<c:if test="${not empty ponto}">
							<button class="btn btn-default"
								onclick="document.forms[0].action = '<%=request.getContextPath()%>/gerenciar/delete/${ponto.id }'; 
								return true;">Remover</button>
						</c:if>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>