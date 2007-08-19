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

	<ec:table 
		tableId="state"	
		var="pres" 
		action="${pageContext.request.contextPath}/public/demo/state.jsp" 
		state="persist"
		title="State Presidents"
		showPagination="true"
		queryService="queryService"
		namedQueryId="presidents"
		>
		
		<ec:exportPdf 
			fileName="output.pdf" 
			tooltip="Export PDF" 
			headerColor="black" 
			headerBackgroundColor="#b6c2da" 
			headerTitle="Presidents"
			/>
		<ec:export 
			view="xls" 
			fileName="output.xls" 
			tooltip="Export Excel"
			imageName="xls"
			/>
		
		<ec:row highlightRow="true">
		
			<ec:column property="fullName" title="Name">
				<a href="http://www.whitehouse.gov/history/presidents/" target="new">${pres.fullName}</a>
			</ec:column>
			<ec:column property="nickName" />
			<ec:column property="term" />
			<ec:column property="born" cell="date" format="MM/dd/yyyy"/>
			<ec:column property="died" cell="date" format="MM/dd/yyyy"/>
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
    var="pres" 
    action="${pageContext.request.contextPath}/public/demo/presidents.jsp" 
    title="Presidents"
    &gt;
    &lt;ec:exportPdf 
       fileName="output.pdf" 
       tooltip="Export PDF" 
       headerColor="black" 
       headerBackgroundColor="#b6c2da" 
       headerTitle="Presidents"/&gt;
    &lt;ec:export 
       view="xls" 
       fileName="output.xls" 
       tooltip="Export Excel"/&gt;
    &lt;ec:row highlightRow="true"&gt;
    
        &lt;ec:column property="fullName" title="Name"&gt;
           &lt;a href="http://www.whitehouse.gov/history/presidents/" target="new"&gt;${pres.fullName}&lt;/a&gt;
        &lt;/ec:column&gt;
        &lt;ec:column property="nickName" /&gt;
        &lt;ec:column property="term" /&gt;
        &lt;ec:column property="born" cell="date"/&gt;
        &lt;ec:column property="died" cell="date"/&gt;
        &lt;ec:column property="career" /&gt;
    &lt;/ec:row&gt;
&lt;/ec:table&gt;
</pre>		

	</div>	
	
</body>

</html>

	
