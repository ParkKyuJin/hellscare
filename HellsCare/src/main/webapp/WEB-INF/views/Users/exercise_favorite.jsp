<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp"%>
<html>
<body>
	<%@ include file="../include/header.jsp"%>

	<!-- Content
		============================================= -->
	<nav class="navbar navbar-light bg-light justify-content-between">
		<a class="navbar-brand" style="margin:0 auto;">즐겨찾기한 운동</a>
	</nav>
	<section id="content">

		<div class="content-wrap">

			<div class="container clearfix">

				<div class="table-responsive">
					<table class="table cart">
						<thead>
							<tr>
								<th class="cart-product-remove">&nbsp;</th>
								<th class="cart-product-thumbnail">&nbsp;</th>
								<th class="cart-product-name">운동명</th>
								<th class="cart-product-price">주소</th>
								<th class="cart-product-subtotal">날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr class="cart_item">
								<td class="cart-product-remove"><a href="#" class="remove"
									title="Remove this item"><i class="icon-trash2"></i></a></td>

								<td class="cart-product-thumbnail">
								</td>

								<td class="cart-product-name">걷기</td>

								<td class="cart-product-price"><span class="amount"><button>바로가기</button></span>
								</td>

								<td class="cart-product-subtotal"><span class="amount">2019-08-13</span>
								</td>
							</tr>
							<tr class="cart_item">
								<td class="cart-product-remove"><a href="#" class="remove"
									title="Remove this item"><i class="icon-trash2"></i></a></td>

								<td class="cart-product-thumbnail">
								</td>

								<td class="cart-product-name">달리기</td>

								<td class="cart-product-price"><span class="amount"><button>바로가기</button></span>
								</td>

								<td class="cart-product-subtotal"><span class="amount">2019-08-01</span>
								</td>
							</tr>
							<tr class="cart_item">
								<td class="cart-product-remove"><a href="#" class="remove"
									title="Remove this item"><i class="icon-trash2"></i></a></td>

								<td class="cart-product-thumbnail">
								</td>

								<td class="cart-product-name">수영</td>

								<td class="cart-product-price"><span class="amount"><button>바로가기</button></span>
								</td>

								<td class="cart-product-subtotal"><span class="amount">2019-08-12</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</section>
	<!-- #content end -->
	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/footerScript.jsp"%>
</body>
</html>