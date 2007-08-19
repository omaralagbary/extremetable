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

	<span class="title">Compact View</span>
	
	<p>
		An example of a custom view using the new view code.
	</p>

	<ec:table 
		var="pres" 
		items="presidents"
		action="${pageContext.request.contextPath}/compact.run" 
		imagePath="${pageContext.request.contextPath}/images/table/compact/*.gif"
		view="compact"
		title="Compact Toolbar View"
		showTooltips="false"
		width="700px"
		>
		
		<ec:exportPdf 
			fileName="output.pdf" 
			tooltip="Export PDF" 
			headerColor="black" 
			headerBackgroundColor="#b6c2da" 
			headerTitle="Presidents"
			text="PDF"
			/>
		<ec:exportXls
			fileName="output.xls" 
			tooltip="Export Excel"
			text="XLS"
			/>
		
		<ec:row highlightRow="true">
			<ec:column property="fullName" title="Name">
				<a href="http://www.whitehouse.gov/history/presidents/">${pres.fullName}</a>
			</ec:column>
			<ec:column property="nickName"/>
			<ec:column property="term"/>
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
    var="pres" 
    items="presidents"
    action="${pageContext.request.contextPath}/compact.run" 
    <b>imagePath="${pageContext.request.contextPath}/images/table/compact/*.gif"</b>
    <b>view="compact"</b>
    title="Compact Toolbar View"
    showTooltips="false"
    &gt;
      &lt;ec:exportPdf 
           fileName="output.pdf" 
           tooltip="Export PDF" 
           headerColor="black" 
           headerBackgroundColor="#b6c2da" 
           headerTitle="Presidents"
           text="PDF"
           /&gt;
      &lt;ec:exportXls
           fileName="output.xls" 
           tooltip="Export Excel"
           text="XLS"
           /&gt;
        &lt;ec:row&gt;
            &lt;ec:column property="fullName" title="Name"&gt;
               &lt;a href="http://www.whitehouse.gov/history/presidents/"&gt;${pres.fullName}&lt;/a&gt;
            &lt;/ec:column&gt;
            &lt;ec:column property="nickName"/&gt;
            &lt;ec:column property="term"/&gt;
            &lt;ec:column property="born" cell="date"/&gt;
            &lt;ec:column property="died" cell="date"/&gt;
            &lt;ec:column property="career"/&gt;
        &lt;/ec:row&gt;
  &lt;/ec:table&gt;
</pre>		

	</div>
	
</body>

</html>
	
