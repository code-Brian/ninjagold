<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/app.js"></script>

<meta charset="ISO-8859-1">
<title>Ninja Gold</title>
</head>
<body>
	<div class="container p-3">
		<div class="container">
			<h2 class="text-center mb-3">Ninja Gold</h2>
			<p>Gold balance: <c:out value="${goldBalance}"/></p>
		</div>
		<div class="container d-flex justify-content-center align-items-center">
			<div class="card mx-2">
				<div class="card-header">
					Farm
				</div>
				<div class="card-body">
					<p class="card-text">Earns 10-20 Gold</p>
					<form action="/addGold" method="post">
						<input type="hidden" value="Farm" name="questName">
						<input type="hidden" value="10" name="min">
						<input type="hidden" value="20" name="max">
						<button class="btn btn-primary p-3" type="submit">Find Gold!</button>
					</form>
				</div>
			</div>
			<div class="card mx-2">
				<div class="card-header">
					Cave
				</div>
				<div class="card-body">
					<p class="card-text">Earns 5-10 Gold</p>
					<form action="/addGold" method="post">
						<input type="hidden" value="Cave" name="questName">
						<input type="hidden" value="5" name="min">
						<input type="hidden" value="10" name="max">
						<button class="btn btn-primary p-3" type="submit">Find Gold!</button>
					</form>
				</div>
			</div>
			<div class="card mx-2">
				<div class="card-header">
					House
				</div>
				<div class="card-body">
					<p class="card-text">Earns 2-5 Gold</p>
					<form action="/addGold" method="post">
						<input type="hidden" value="House" name="questName">
						<input type="hidden" value="2" name="min">
						<input type="hidden" value="5" name="max">
						<button class="btn btn-primary p-3" type="submit">Find Gold!</button>
					</form>
				</div>
			</div>
			<div class="card mx-2">
				<div class="card-header">
					House
				</div>
				<div class="card-body">
					<p class="card-text">Earns/Takes 0-50 Gold</p>
					<form action="/addGold" method="post">
						<input type="hidden" value="Quest" name="questName">
						<input type="hidden" value="0" name="min">
						<input type="hidden" value="50" name="max">
						<button class="btn btn-primary p-3" type="submit">Find Gold!</button>
					</form>
				</div>
			</div>
		</div>
		<div class="container my-3">
			<h3 class="mb-3">Activities:</h3>
			<div class="container">
				<c:forEach var="oneMessage" items="${allMessages}">
						<p><c:out value="${oneMessage}"/></p>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>