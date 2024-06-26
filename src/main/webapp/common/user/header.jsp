<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="#!">PT BOOKSHOP</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<c:if test="${not empty USERMODEL}">
					<li class="nav-item"><a class="nav-link active"
					aria-current="page" href='<c:url value="/login?action=login"/>'>Welcome, ${USERMODEL.lastName}</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value="/logout?action=logout"/>">Logout</a></li>
				</c:if>
				
				<c:if test="${empty USERMODEL}">
					<li class="nav-item"><a class="nav-link active"
					aria-current="page" href='<c:url value="/login?action=login"/>'>Login</a></li>
				</c:if>	
				
				
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">Browse</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#!">All Items</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="#!">Top List<	/a></li>
						<li><a class="dropdown-item" href="#!">New Arrivals</a></li>
					</ul></li>
			</ul>
			
			 <div class="container h-100">
		      <div class="d-flex justify-content-center h-100">
		        <div class="search">
		          <input class="search_input" type="text" name="" placeholder="Search here...">
		          <a href="user-booklist" class="search_icon"><i class="fa fa-search"></i></a>
		        </div>
		      </div>
		    </div>
			
			<form class="d-flex" action="user-cart">
				<button class="btn btn-outline-dark" type="submit">
					<i class="bi-cart-fill me-1"></i> Cart <span
						class="badge bg-dark text-white ms-1 rounded-pill">0</span>
				</button>
			</form>
			
			
		</div>
	</div>
	

	
</nav>

