<%@ taglib uri="/tld/c" prefix="c" %>

<html>

<head>
	<title>eXtremeComponents</title>
</head>

<body>

	<ul id="tabmenu">
		<li><a href="<c:url value="/index.jsp"/>">Home</a></li>
		<li><a href="<c:url value="/public/demo/examples.jsp"/>">Examples</a></li>
		<li><a class="active" href="<c:url value="/public/documentation.jsp"/>">Documentation</a></li>
	</ul>
	
	<div id="content">

	<span class="title">Documentation</span>

	<ul>
		<li><a href="<c:url value="/public/docs/api/index.html"/>">API Reference (with links to source code)</a></li>
	</ul>
	
	</div>
	
</body>

</html>
	