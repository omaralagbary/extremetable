<%@ taglib uri="/tld/c" prefix="c" %>

<html>

<head>
	<title>eXtremeComponents</title>
</head>

<body>

	<ul id="tabmenu">
		<li><a href="<c:url value="/index.jsp"/>">Home</a></li>
		<li><a class="active" href="<c:url value="/public/demo/examples.jsp"/>">Examples</a></li>
		<li><a href="<c:url value="/public/documentation.jsp"/>">Documentation</a></li>
	</ul>
	
	<div id="content">

	<span class="title">Examples</span>

	<ul>
		<li><a href="<c:url value="/assembler.run"/>">AJAX enabled eXtremeTable</a></li>
		<li><a href="<c:url value="/autoGenerateColumns.run"/>">AutoGenerateColumns</a></li>
		<li><a href="<c:url value="/compact.run"/>">Compact View</a></li>
		<li><a href="<c:url value="/presidents.run"/>">Default View</a></li>
		<li><a href="<c:url value="/filteredDroplist.run"/>">FilterCell</a></li>
		<li><a href="<c:url value="/filteredDroplist.run"/>">FilterRowsCallback</a></li>
		<li><a href="<c:url value="/selectedPresidentsController.run"/>">Form</a></li>
		<li><a href="<c:url value="/intercept.run"/>">Interceptor</a></li>
		<li><a href="<c:url value="/limit.run"/>">Limit</a></li>
		<li><a href="<c:url value="/messages.run"/>">Messages</a></li>
		<li><a href="<c:url value="/preferences.run"/>">Preferences</a></li>
	</ul>

	</div>

</body>

</html>
	