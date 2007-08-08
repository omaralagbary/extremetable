<%@ taglib uri="/tld/c" prefix="c" %>

<html>

<head>
	<title>eXtremeComponents</title>

	<script type="text/javascript" src="<c:url value="/dwr/interface/Assembler.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/dwr/engine.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/dwr/util.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/extremecomponents.js"/>"></script>
</head>

<body>

	<ul id="tabmenu">
		<li><a href="<c:url value="/index.jsp"/>">Home</a></li>
		<li><a class="active" href="<c:url value="/public/demo/examples.jsp"/>">Examples</a></li>
		<li><a href="<c:url value="/public/documentation.jsp"/>">Documentation</a></li>
	</ul>
	
	<div id="content">

	<span class="title">Assemble Table with Java API (Now With AJAX!)</span>

	<p>
		The eXtremeTable has a rich API that makes building a table with Java code feel just like using the JSP tags. 
		In fact the JSP tags are merely a front end for the eXtremeTable Java API now.
	</p>
	
	<div id="tableDiv" style="margin-top:20px">
    	<c:out value="${assembler}" escapeXml="false"/> 
	</div>
	
	</div>
	
<script type="text/javascript">
function buildTable(formId) {
	var parameterMap = getParameterMap(formId);   
	Assembler.getTable(parameterMap, showTable);
}

function showTable(table) {
	document.getElementById('tableDiv').innerHTML=table;
}
</script>

</body>

</html>
	