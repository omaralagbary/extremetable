 <%@ taglib uri="/tld/c" prefix="c" %>

<html>

<head>
	<title>eXtremeComponents</title>
</head>

<body>

	<ul id="tabmenu">
		<li><a class="active" href="<c:url value="/index.jsp"/>">Home</a></li>
		<li><a href="<c:url value="/public/demo/examples.jsp"/>">Examples</a></li>
		<li><a href="<c:url value="/public/documentation.jsp"/>">Documentation</a></li>
	</ul>
	
	<div id="content">
	
	<p>
		The eXtremeComponents uses the <a href="http://httpd.apache.org/docs/LICENSE"> Apache License Version 2.0</a> open source license.
	</p>

	<p id="frontImage">
		<a href="<c:url value="/presidents.run"/>"><img src="<c:url value="/images/eXtremeTable.jpg" />" alt="Presidents"/></a>
		<br/>
		<span style="font-style:italic;font-size:12">eXtremeTable. Helping you work smarter!</span>
	</p>
	
	</div>
	
</body>

</html>
