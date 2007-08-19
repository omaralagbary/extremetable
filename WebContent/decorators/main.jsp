<%@ taglib uri="/tld/sitemesh-decorator" prefix="decorator" %>
<%@ taglib uri="/tld/c" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

	<head>
		<link rel="stylesheet" type="text/css" href="<c:url value="/styles/extremesite.css"/>"></link>
		<link rel="stylesheet" type="text/css" href="<c:url value="/styles/extremecomponents.css"/>"></link>
		<title>eXtremeComponents</title>
		<decorator:head/>
	</head>

	<body style="background-repeat: repeat-x;background-color: #107daf;background-image: url('<c:url value="/images/body_bg.gif"/>')">
		
		<c:import url="/embeds/header.jsp"/>
		
		<div>
			<div id="bodyContent">
				<decorator:body/>			
			</div>
		</div>
		
		<div id="email">
			<hr style="width:600px"/>
		</div>

	</body>

</html>
