<%@ include file="/WEB-INF/jsp/common/tags-head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta-head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/common/ldod-header.jsp"%>

	<div class="container">
		<div class="hero-unit">
			<h1>Ocorreu um erro:</h1>
			<br>
			<div class="alert alert-error">
				<a class="close" data-dismiss="alert">�</a> <strong>${exception.message}
				</strong>
			</div>
		</div>
	</div>

</body>
</html>