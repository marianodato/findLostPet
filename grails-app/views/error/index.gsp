<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Grails Runtime Exception</g:if><g:else>Find Lost Pet | Error</g:else></title>
		<meta name="layout" content="main">
	</head>
	<body>
		<g:if env="development">
			<g:renderException exception="${exception}" />
		</g:if>
		<g:else>
				Ocurrió un error inesperado
		</g:else>
	</body>
</html>
