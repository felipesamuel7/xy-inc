<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/">${empresaNome }</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="<%=request.getContextPath()%>/explorar">Explorar</a></li>
				<li><a href="<%=request.getContextPath()%>/gerenciar">Gerenciar Localidades</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Contato</a></li>
			</ul>
		</div>
	</div>
</nav>