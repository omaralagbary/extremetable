<%@ taglib uri="/tld/extremecomponents" prefix="ec" %>
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

	<span class="title">Intercept</span>
	
	<p>
		An example using the Interceptor feature. This example shows 
		that the rows with the "Soldier" career is highlighted.
	</p>
	
	<br/>

	<ec:table 
		items="presidents"
		action="${pageContext.request.contextPath}/intercept.run" 
		title="Presidents"
		showTooltips="false"
		width="700px"
		>
		<ec:row highlightRow="false" interceptor="marker">
			<ec:column property="fullName" title="Name" />
			<ec:column property="nickName" />
			<ec:column property="term" />
			<ec:column property="died" cell="date"/>
			<ec:column property="career"/>
		</ec:row>
	</ec:table>
	
	<br/>		
	
	<p>
		Below is the code that generates the above display.	
	</p>
			
<pre>
&lt;ec:table 
    items="presidents"
    action="${pageContext.request.contextPath}/intercept.run" 
    title="Presidents"
    showTooltips="false"
    &gt;
    &lt;ec:row highlightRow="false" <b>intercept="marker"</b>&gt;
        &lt;ec:column property="fullName" title="Name" /&gt;
        &lt;ec:column property="nickName" /&gt;
        &lt;ec:column property="term" /&gt;
        &lt;ec:column property="born" cell="date"/&gt;
        &lt;ec:column property="died" cell="date"/&gt;
        &lt;ec:column property="career"/&gt;
    &lt;/ec:row&gt;
&lt;/ec:table&gt;
</pre>		

	</div>	
	
</body>

</html>
