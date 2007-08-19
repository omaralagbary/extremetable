<%@ taglib uri="/tld/extremecomponents" prefix="ec" %>
<%@ taglib uri="/tld/spring" prefix="spring" %>
<%@ taglib uri="/tld/c" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>

<head>
	<style>
		.toolbar {
			font-weight: bold;
		}
		
		.toolbar span {
			background-color: #308dbb;
			color: white;
			padding-right: 3px;
			padding-left: 3px;
			padding-top: 1px;
		}

		.filterButtons {
			font-weight: bold;
		}
		
		.filterButtons span {
			background-color: #308dbb;
			color: white;
			padding-right: 3px;
			padding-left: 3px;
			padding-top: 1px;
		}
	</style>


	<title>Messages</title>

</head>

<body>

	<ul id="tabmenu">
		<li><a href="<c:url value="/index.jsp"/>">Home</a></li>
		<li><a class="active" href="<c:url value="/public/demo/examples.jsp"/>">Examples</a></li>
		<li><a href="<c:url value="/public/documentation.jsp"/>">Documentation</a></li>
	</ul>
	
	<div id="content">

	<span class="title">Messages</span>

	<p>
		You can see the locale support in action by selecting different 
		languages from the droplist. Also know that the images can also be 
		defined in the resource bundle and will show up locale specific. 
		<i>Note: Some of the example translations are a work in progress. 
		Also, the transalations reflect the latest messages submitted to me, not 
		necessarily the latest release.</i>
	</p>

	<form id="localeForm" action="<c:url value="/messages.run"/>">
	
	<div>
		<select name="locale" onchange="document.forms.localeForm.submit()">
			<c:forEach items="${options}" var="option">
				<c:forEach items="${option}" var="opt">
					<option value="<c:out value="${opt.key}"/>" 
					<c:if test="${opt.key == param.locale}">
						selected
					</c:if>
					>
						<c:out value="${opt.value}"/> 
					</option>
				</c:forEach> 
			</c:forEach>
		</select>
	</div>
		
	</form>

	<br/>

	<ec:table 
		items="presidents"
		var="pres" 
		action="${pageContext.request.contextPath}/messages.run" 
		title="table.title.president"
		locale="${param.locale}"
		view="messages"
		showExports="false"
		width="700px"
		>
		<ec:exportPdf 
			fileName="output.pdf" 
			tooltip="Export PDF" 
			headerColor="black" 
			headerBackgroundColor="#b6c2da" 
			headerTitle="Presidents"
			/>
		<ec:exportXls
			fileName="output.xls" 
			tooltip="Export Excel"
			/>
		<ec:row>
			<ec:column property="fullName" title="table.column.fullName">
				<a href="http://www.whitehouse.gov/history/presidents/">${pres.fullName}</a>
			</ec:column>
			<ec:column property="nickName" title="table.column.nickName" />
			<ec:column property="term" title="table.column.term" />
			<ec:column property="died" cell="date" title="table.column.died" />
			<ec:column property="career" title="table.column.career" />
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
    <b>title="table.title.president"</b>
    <b>locale="${param.locale}"</b>
    view="messages"
    &gt;
    &lt;ec:row&gt;
        &lt;ec:column property="fullName" <b>title="table.column.fullName"</b>&gt;
           &lt;a href="http://www.whitehouse.gov/history/presidents/" target="new"&gt;${pres.fullName}&lt;/a&gt;
        &lt;/ec:column&gt;
        &lt;ec:column property="nickName" <b>title="table.column.nickName"</b>/&gt;
        &lt;ec:column property="term" <b>title="table.column.term"</b>/&gt;
        &lt;ec:column property="born" cell="date" <b>title="table.column.born"</b>/&gt;
        &lt;ec:column property="died" cell="date" <b>title="table.column.died"</b>/&gt;
        &lt;ec:column property="career" <b>title="table.column.career"</b>/&gt;
    &lt;ec:row&gt;
&lt;/ec:table&gt;
</pre>		

	</div>	

</body>

</html>


