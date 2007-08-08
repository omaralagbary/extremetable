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

	<span class="title">Custom FilterCell And FilterRowsCallback</span>
	
	<p>
		This example combines both a custom filterCell and filterRowsCallback. 
		What you will notice is that by selecting the first name droplist filter 
		it will limit the values that you see for the last name droplist filter. The 
		last name column is implementing a custom filterCell. Another thing to 
		notice is how the column values no longer do a fuzzy match, but rather 
		will only match on exact values by doing a custom filterRowsCallback.
	</p>
	
	<br/>

	<ec:table 
		items="presidents"
		action="${pageContext.request.contextPath}/filteredDroplist.run" 
		title="Presidents"
		showTooltips="false"
		filterRowsCallback="exactMatch"
		width="700px"
		>
		<ec:row>
			<ec:column property="firstName" filterCell="droplist"/>
			<ec:column property="lastName" filterCell="filteredDroplist"/>
			<ec:column property="nickName" filterable="false"/>
			<ec:column property="term" filterable="false"/>
			<ec:column property="died" cell="date" filterable="false"/>
			<ec:column property="career" filterable="false"/>
		</ec:row>
	</ec:table>
	
	<p>
		** James and Andrew are two good first names to select to see this functionality in action.
	</p>
	
	<br/>		
	
	<p>
		Below is the code that generates the above display.	
	</p>
			
<pre>
&lt;ec:table 
	items="presidents"
	action="${pageContext.request.contextPath}/filteredDroplist.run" 
	title="Presidents"
	showTooltips="false"
	<b>filterRowsCallback="exactMatch"</b>
	&gt;
	&lt;ec:row&gt;
		&lt;ec:column property="firstName" filterCell="droplist"/&gt;
		&lt;ec:column property="lastName" <b>filterCell="filteredDroplist"</b>/&gt;
		&lt;ec:column property="nickName" filterable="false"/&gt;
		&lt;ec:column property="term" filterable="false"/&gt;
		&lt;ec:column property="born" cell="date" filterable="false"/&gt;
		&lt;ec:column property="died" cell="date" filterable="false"/&gt;
		&lt;ec:column property="career" filterable="false"/&gt;
	&lt;/ec:row&gt;
&lt;/ec:table&gt;
</pre>	
	
	</div>	

</body>

</html>
