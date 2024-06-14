<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<c:url var="APIurl" value="/api-user-comment" />
<c:url var="APICarturl" value="/api-user-cart" />
<c:url var="APILikeBookurl" value="/api-user-likebook" />
<c:url var="APILikeCommenturl" value="/api-user-likecomment" />
<c:url var="BookdetailURL" value="/user-bookdetail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book detail</title>
</head>
<body>
	<section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${book.thumbnail}" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">${book.authorName}</div>
                        
                        <h1 class="display-5 fw-bolder">${book.title}</h1>
                        <div class="fs-5 mb-5">
                            <span style="font-weight: bold;">${book.price} VND</span>
                            <div class="small">Remaining: ${book.stocks}</div>
                        </div>
                        <c:if test="${not empty cart}">
                        <div>
					      	<button type="button" class="btn btn-outline-dark" id="addtocart" disabled>Added to Cart</button>
						</div>
                        </c:if>
                        <c:if test="${empty cart}">
						<c:if test="${book.stocks > 0}">
						<form id = "cartForm">
                        <div class="d-flex" style="margin-bottom: 0;">
						   <div class="d-flex flex-row" style="margin-bottom: 20px;">
						      <div class="input-group w-auto justify-content-start align-items-start">
						         <input type="button" value="-" class="btn-dark button-minus border rounded-circle  icon-shape icon-sm mx-1 " data-field="quantity">
						         <input type="number" step="1" min="1" max="5" value="1" name="quantity" class="quantity-field border-0 text-center w-25" readonly style="margin: 0;">
						         <input type="button" value="+" class="btn-dark button-plus border rounded-circle icon-shape icon-sm lh-0" data-field="quantity">
						      </div>
						   </div>
						</div>
						<input type="hidden" value ="${book.id}" id="bookId" name="bookId">
						</form>						
						<div>
					      	<button type="button" class="btn btn-outline-dark" id="addtocart" data-bs-toggle="modal"  <c:if test="${book.status == 'notLogin'}">data-bs-target="#alert"</c:if> >Add to Cart</button>
						</div>
                        </c:if>
                        </c:if>
                        <div class="like-button-pair1" style="margin-top: 12px;">
                        	<c:if test="${book.status == 'notLogin'}">
					 		<button id="button-like btn btn-link" class="book-like-btn" style="border: 0; background-color: transparent; font-size: 40px; color: #23272B;" data-bs-toggle="modal" data-bs-target="#alert"><i class="fa-regular fa-heart"></i><p>${book.likeNumber}</p></button>
					 		</c:if>
					 		<c:if test="${book.status != 'notLogin'}">
					 		<button id="button-like btn btn-link" class="book-like-btn" style="display: <c:if test="${not empty book.likeBookModel}"> none </c:if><c:if test="${empty book.likeBookModel}"> block </c:if>  ; border: 0; background-color: transparent; font-size: 40px; color: #23272B;"><i class="fa-regular fa-heart"></i><a id="likeBook"></a></button>
					 		<button id="button-unlike btn btn-link" class=" book-unlike-btn" style="display: <c:if test="${empty book.likeBookModel}"> none </c:if><c:if test="${not empty book.likeBookModel}"> block </c:if>  ; border: 0; background-color: transparent; font-size: 40px; color: #23272B;"><i class="fa-solid fa-heart"></i><a id="unLikeBook"></a></button>
							</c:if>							
						</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="py-5 bg-light" style="margin-top:0;">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">About this product</h2>
                <div class="mb-3">
                        <p class="lead">
                        Type - Genre: ${book.typeName}  - ${book.genreName}  <br>	
                        Description: <br>
                        ${book.description}
                        </p>
				</div>
            </div>
            
        </section>
        <hr>
        
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $40.00 - $80.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View Details</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View Details</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View Details</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View Details</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <hr>
        
        <!-- Comment section -->
        <section class="py-5 bg-light" id="commentSection">
            <form id = "commentForm">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Comments</h2>
                <div class="mb-3">
				  <label for="commentInput" class="form-label">What do you think about this product?</label>
				  <input type="text" class="form-control" id="content" placeholder="Type your comments here..." name="content">
				</div>
				<input type="hidden" value ="${book.id}" id="bookId" name="bookId">
				<input type="hidden" value ="0" id="likes" name="likes">
				<button type="button" class="btn btn-dark" id="comment" data-bs-toggle="modal"  <c:if test="${book.status == 'notLogin'}">data-bs-target="#alert"</c:if>>Post</button>
            </div>
            </form>
            
            
            <c:forEach var="item" items="${comment.resultList}">
            <div class="container px-4 px-lg-5 mt-5">
            <div class="d-flex flex-start">
              <img class="rounded-circle shadow-1-strong me-3"
                src="https://scontent.fsgn5-15.fna.fbcdn.net/v/t39.30808-1/405372159_871851221392800_4877411962768229159_n.jpg?stp=dst-jpg_p200x200&_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeH__uEuwvMUWv1FA9Qrf4c7yzq2hRTIM1bLOraFFMgzVtE7yUYpZRsIeDdpo9kgY_emZ5wQHtFF39R3zS8Cj5vn&_nc_ohc=P78aPtlHgZcQ7kNvgFdukLA&_nc_ht=scontent.fsgn5-15.fna&oh=00_AYBhkhN8e9_s5EkrzkWwFSJhO2ZdiNkxO5yasvhk6heB-A&oe=66607981" alt="avatar" width="60"
                height="60" />
              <div style="width: 100%; margin: auto;">
                <h6 class="fw-bold mb-1">${item.userName}</h6>
                <div class="d-flex align-items-center mb-3">
                  <p class="mb-0">
                    March 15, 2021
                    <span class="badge bg-success">Author</span>
                  </p>
                </div>
                <p class="mb-0 commentContent">
                   ${item.content}
                </p>

              </div>
				<div class="like-button-pair2-${item.id}">
					 <!-- <button id="button-like btn btn-link" style="border: 0; background-color: transparent;"><i class="fa-regular fa-heart"></i><p>0</p></button>
					 <button id="button-unlike btn btn-link" style="display: none; border: 0; background-color: transparent;"><i class="fa-solid fa-heart"></i><p>1</p></button> -->
					 
					 <c:if test="${book.status == 'notLogin'}">
					 		<button id="button-like-${item.id} btn btn-link" class="book-like-btn" style="border: 0; background-color: transparent;" data-bs-toggle="modal" data-bs-target="#alert"><i class="fa-regular fa-heart"></i><p>${item.likeNumber}</p></button>
					 	</c:if>
					 		<c:if test="${book.status != 'notLogin'}">
					 		<button id="button-like-${item.id} btn btn-link" class="book-like-btn" style="display: <c:if test="${not empty item.likeCommentModel}"> none </c:if><c:if test="${empty item.likeCommentModel}"> block </c:if>  ; border: 0; background-color: transparent;"><i class="fa-regular fa-heart"></i><a id="likeComment${item.id}"></a></button>
					 		<button id="button-unlike-${item.id} btn btn-link" class=" book-unlike-btn" style="display: <c:if test="${empty item.likeCommentModel}"> none </c:if><c:if test="${not empty item.likeCommentModel}"> block </c:if>  ; border: 0; background-color: transparent;"><i class="fa-solid fa-heart"></i><a id="unLikeComment${item.id}"></a></button>
							</c:if>
				</div>
            </div>
          </div>
            </c:forEach>


        </section>
        
        <section>
        <div class="modal fade" id="alert" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
									  <div class="modal-dialog modal-dialog-centered">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalLabel">Hang on!</h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
									        You need to log in first.
									      </div>
									      <div class="modal-footer">
									       	<a class=" text-white btn btn-secondary text-decoration-none px-3 py-1 rounded-3" style="background-color: #232323; display: block; width: 90px;" aria-current="page" href='<c:url value="/login?action=login"/>'>Login</a>
									      </div>
									    </div>
									  </div>
		</div>
        </section>
        
        
        
        
        <script>
        $(document).ready(function() {
        	var status = '${book.status}';
        	if (status != null && status == 'comment')
        	window.location.href = "${BookdetailURL}?id=${book.id}#commentSection";
        	
        	var isLike = '${book.likeBookModel}';
        	if (isLike == ''){
        		document.getElementById("likeBook").innerHTML = ${book.likeNumber};
        		document.getElementById("unLikeBook").innerHTML = ${book.likeNumber} + 1;
        	} else {
        		document.getElementById("likeBook").innerHTML = ${book.likeNumber}-1;
        		document.getElementById("unLikeBook").innerHTML = ${book.likeNumber};
        	}
		});
        
        <c:forEach var="item" items="${comment.resultList}">
        $(document).ready(function() {
        	var isLike = '${item.likeCommentModel}';
        	if (isLike == ''){
        		document.getElementById("likeComment" + ${item.id}).innerHTML = ${item.likeNumber};
        		document.getElementById("unLikeComment" + ${item.id}).innerHTML = ${item.likeNumber} + 1;
        	} else {
        		document.getElementById("likeComment" + ${item.id}).innerHTML = ${item.likeNumber}-1;
        		document.getElementById("unLikeComment" + ${item.id}).innerHTML = ${item.likeNumber};
        	}
		});
        </c:forEach>
        
        function incrementValue(e) {
      	  e.preventDefault();
      	  var fieldName = $(e.target).data('field');
      	  var parent = $(e.target).closest('div');
      	  var input = parent.find('input[name=' + fieldName + ']');
      	  var currentVal = parseInt(input.val(), 10);

      	  if (!isNaN(currentVal)) {
      	    var newVal = currentVal + 1;
      	    // Check if the new value exceeds the maximum allowed value
      	    if (newVal <= ${book.stocks}) { // Assuming a maximum of 10 (adjust as needed)
      	      input.val(newVal);
      	    } 
      	  } else {
      	    input.val(0);
      	  }
      	}

      	function decrementValue(e) {
      	  e.preventDefault();
      	  var fieldName = $(e.target).data('field');
      	  var parent = $(e.target).closest('div');
      	  var input = parent.find('input[name=' + fieldName + ']');
      	  var currentVal = parseInt(input.val(), 10);

      	  if (!isNaN(currentVal) && currentVal > 0) {
      	    var newVal = currentVal - 1;
      	    // Check if the new value falls below the minimum allowed value
      	    if (newVal >= 1) { // Assuming a minimum of 0 (adjust as needed)
      	      input.val(newVal);
      	    }
      	  } else {
      	    input.val(0);
      	  }
      	}

      	$('.input-group').on('click', '.button-plus', function(e) {
      	  incrementValue(e);
      	});

      	$('.input-group').on('click', '.button-minus', function(e) {
      	  decrementValue(e);
      	});
        
        
        $("#comment").click(
				function(e) {
					var status = '${book.status}';
					if (status == 'notLogin'){
						window.location.href = "${BookdetailURL}?id=${book.id}#alert";
					} else {
						e.preventDefault();
						var data = {};
						var formdata = $("#commentForm").serializeArray();
						$.each(formdata, function(i, v) {
							data["" + v.name + ""] = v.value;
						});
						create(data);
					}
					
				});
        
        $(document).ready(function() {
        	  $("#content").keypress(function(e) {
        	    if (e.keyCode === 13) { // Check if Enter key is pressed
        	      $("#comment").click(); // Simulate click on the Post button
        	      e.preventDefault(); // Prevent default form submission behavior (optional)
        	    }
        	  });
        	});
        
        function create(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${BookdetailURL}?id=${book.id}&status=comment";
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
        
        
        $("#addtocart").click(
				function(e) {
					var status = '${book.status}';
					if (status == 'notLogin'){
						window.location.href = "${BookdetailURL}?id=${book.id}#alert";
					} else {
					e.preventDefault();
					var data = {};
					var formdata = $("#cartForm").serializeArray();
					$.each(formdata, function(i, v) {
						data["" + v.name + ""] = v.value;
					});
					console.log(data);
					add(data);
					}
				});
        function add(data) {
			$.ajax({
				url : '${APICarturl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${BookdetailURL}?id=${book.id}";
				},
				error : function(error) {
					console.log(error);
				}
			});
		}     	
        
        const buttonPairs1 = document.querySelectorAll('.like-button-pair1');

        buttonPairs1.forEach(pair => {
          const buttonLike = pair.querySelector('button[id^="button-like"]'); // Select button starting with "buttonA"
          const buttonUnlike = pair.querySelector('button[id^="button-unlike"]'); // Select button starting with "buttonB"

          buttonLike.addEventListener('click', function() {
        	var status = '${book.status}';
        	if (status != null && status != 'notLogin'){
        	buttonLike.style.display = 'none';
            buttonUnlike.style.display = 'block';
            
        	
			var data = {};
			data["bookId"] = ${book.id};
			likeBook(data);
        	}
          });

          buttonUnlike.addEventListener('click', function() {
            buttonLike.style.display = 'block';
            buttonUnlike.style.display = 'none';
            
            var status = '${book.status}';
        	if (status != null && status != 'notLogin'){
			var data = {};
			data["bookId"] = ${book.id};
			unLikeBook(data);
        	}
            
          });
        });
        const buttonPairs = {};
        <c:forEach var="item" items="${comment.resultList}">
        buttonPairs['${item.id}'] = document.querySelectorAll('.like-button-pair2-${item.id}');
		
        buttonPairs['${item.id}'].forEach(pair => {
          const buttonLike = pair.querySelector('button[id^="button-like-${item.id}"]'); // Select button starting with "buttonA"
          const buttonUnlike = pair.querySelector('button[id^="button-unlike-${item.id}"]'); // Select button starting with "buttonB"

          buttonLike.addEventListener('click', function() {
            buttonLike.style.display = 'none';
            buttonUnlike.style.display = 'block';
            
            var status = '${book.status}';
        	if (status != null && status != 'notLogin'){
			var data = {};
			data["commentId"] = ${item.id};
			likeComment(data);
        	}
          });

          buttonUnlike.addEventListener('click', function() {
            buttonLike.style.display = 'block';
            buttonUnlike.style.display = 'none';
            
            var status = '${book.status}';
        	if (status != null && status != 'notLogin'){
			var data = {};
			data["commentId"] = ${item.id};
			unLikeComment(data);
        	}
          });
        });
        </c:forEach>
        function likeBook(data) {
			$.ajax({
				url : '${APILikeBookurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					/* window.location.href = "${BookdetailURL}?id=${book.id}"; */
				},
				error : function(error) {
					console.log(error);
				}
			});
		}	
        
        function unLikeBook(data) {
			$.ajax({
				url : '${APILikeBookurl}',
				type : 'DELETE',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					/* window.location.href = "${BookdetailURL}?id=${book.id}"; */
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
        
        function likeComment(data) {
			$.ajax({
				url : '${APILikeCommenturl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					/* window.location.href = "${BookdetailURL}?id=${book.id}"; */
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
        
        function unLikeComment(data) {
			$.ajax({
				url : '${APILikeCommenturl}',
				type : 'DELETE',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					/* window.location.href = "${BookdetailURL}?id=${book.id}"; */
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
        
        </script>
        
</body>
</html>