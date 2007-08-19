<%@ taglib uri="/tld/extremecomponents" prefix="ec" %>
<%@ taglib uri="/tld/c" prefix="c" %>
<%@ taglib uri="/tld/extremesite" prefix="extremesite" %>

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

	<span class="title">AutoGenerateColumns</span>

	<p>
		The auto-generation of columns has been made very easy. All you have to do is implement
		the AutoGenerateColumns interface and reference it in the autoGenerateColumns attribute on the ColumnsTag.
	</p>
	
	<br/>

	<ec:table 
		items="presidents"
		action="${pageContext.request.contextPath}/autoGenerateColumns.run" 
		title="Presidents"
		width="700px"
		>
		<ec:exportXls 
            fileName="output.xls" 
            tooltip="Export Excel"
            />
		<ec:row>
			<ec:columns autoGenerateColumns="impl"/>
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
    action="${pageContext.request.contextPath}/autoGenerateColumns.run" 
    title="Presidents"
	&gt;
    &lt;ec:export 
       view="xls" 
       fileName="output.xls" 
       tooltip="Export Excel"/&gt;
    &lt;ec:row&gt;          
	    <b>&lt;ec:columns autoGenerateColumns="impl"/&gt;</b>
	    &lt;ec:column property="career"/&gt;
    &lt;/ec:row&gt;    
&lt;/ec:table&gt;
</pre>		

	</div>
	
</body>

</html>
