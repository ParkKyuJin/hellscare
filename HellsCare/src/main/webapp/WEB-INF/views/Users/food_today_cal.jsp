<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 칼로리</title>
</head>
<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Header
		============================================= -->
		<%@ include file="../include/header.jsp" %>
		<!-- #header end -->

		<!-- Page Title
		============================================= -->
		<section id="page-title">

			<div class="container clearfix">
				<h1>오늘의 칼로리</h1>
				<span>오늘 섭취한 칼로리와 영양을 계산하고 분석합니다.</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item"><a href="#">식단</a></li>
					<li class="breadcrumb-item active" aria-current="page">오늘의 칼로리</li>
				</ol>
			</div>

		</section><!-- #page-title end -->
		
			<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">
				
					<div class="row justify-content-center">
						<div class="col-lg-7 col-md-10">
							<div class="card shadow-sm">
								<div class="card-header">
									<h4 class="mb-0">칼로리 입력</h4>
								</div>
								<div class="card-body">

									<div class="form-widget">

										<div class="form-result"></div>

										<div class="form-process css3-spinner">
											<div class="css3-spinner-double-bounce1"></div>
											<div class="css3-spinner-double-bounce2"></div>
										</div>

										<form class="nobottommargin" id="template-contactform" name="template-contactform" action="include/form.php" method="post" enctype="multipart/form-data">

											<div class="row">

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-name">밥<small class="text-danger">*</small></label>
													<select id="template-contactform-default-select" name="template-contactform-default-select" class="form-control">
														<option value="" disabled selected>X</option>
														<option value="white_rice">흰 쌀밥</option>
														<option value="mixed_rice">잡곡밥</option>
														<option value="brown_rice">현미밥</option>
														<option value="barley_rice">보리밥</option>
														<option value="porridge">죽</option>
													</select>
												</div>
												
												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-name">국 / 찌개<small class="text-danger">*</small></label>
													<select id="template-contactform-default-select" name="template-contactform-default-select" class="form-control">
														<option value="" disabled selected>X</option>
														<option value="white_rice">국</option>
														<option value="mixed_rice">찌개</option>
													</select>
													
													<!-- <select id="template-contactform-default-select" name="template-contactform-default-select" class="form-control">
														<option value="" disabled selected>X</option>
														<option value="white_rice">국</option>
														<option value="mixed_rice">찌개</option>
													</select>
													
													<select id="template-contactform-default-select" name="template-contactform-default-select" class="form-control">
														<option value="" disabled selected>X</option>
														<option value="white_rice">국</option>
														<option value="mixed_rice">찌개</option>
													</select> -->
												</div>
												
												

												<!-- <div class="col-12 bottommargin-sm">
													<label for="template-contactform-email">Email Address<small class="text-danger">*</small></label>
													<input type="email" name="template-contactform-email" id="template-contactform-email" class="form-control required" value="" placeholder="user@company.com">
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-password">Password:<small class="text-danger">*</small></label>
													<input type="password" id="template-contactform-password" name="template-contactform-password" value="" class="form-control" placeholder="Enter Password" />
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-phone">Phone:</label>
													<input type="text" id="template-contactform-phone" name="template-contactform-phone" value="" class="form-control" placeholder="Enter your phone Number.." />
												</div>

												<div class="col-12 bottommargin-sm">
													<label>Checkbox Options:</label>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="template-contactform-mobile" name="template-contactform-checkbox[]" value="Mobile">
														<label class="form-check-label" for="template-contactform-mobile">Mobile</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="template-contactform-mail" name="template-contactform-checkbox[]" value="Email">
														<label class="form-check-label" for="template-contactform-mail">Email</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="template-contactform-sms" name="template-contactform-checkbox[]" value="SMS" disabled selected checked>
														<label class="form-check-label" for="template-contactform-sms">SMS(Disabled)</label>
													</div>
												</div>

												<div class="col-12 bottommargin-sm">
													<label>Radio Options:</label>
													<div class="form-check">
														<input class="form-check-input" type="radio" name="template-contactform-radio" id="template-contactform-radio-label1" value="Free Delivery" disabled checked>
														<label class="form-check-label" for="template-contactform-radio-label1">Free Delivery(Disabled)</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="radio" name="template-contactform-radio" id="template-contactform-radio-label2" value="Paypal">
														<label class="form-check-label" for="template-contactform-radio-label2">Paypal</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="radio" name="template-contactform-radio" id="template-contactform-radio-label3" value="Credit Card">
														<label class="form-check-label" for="template-contactform-radio-label3">Credit Card</label>
													</div>
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-default-select">Single Select Box:</label>
													<select id="template-contactform-default-select" name="template-contactform-default-select" class="form-control">
														<option value="" disabled selected>Select One</option>
														<option value="Wordpress">Wordpress</option>
														<option value="PHP / MySQL">PHP / MySQL</option>
														<option value="HTML5 / CSS3">HTML5 / CSS3</option>
														<option value="Graphic Design">Graphic Design</option>
													</select>
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-multiple-select">Multiple Selected Box:</label>
													<select id="template-contactform-multiple-select" name="template-contactform-multiple-select[]" class="selectpicker form-control" multiple>
														<option value="Mustard">Mustard</option>
														<option value="Ketchup">Ketchup</option>
														<option value="Relish">Relish</option>
													</select>
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-tags-select">Tags Select Box:</label>
													<select class="select-tags input-select2 form-control" multiple="" tabindex="-1" aria-hidden="true" id="template-contactform-tags-select" name="template-contactform-tags-select[]" style="width: 100%;">
														<option value="Orange" selected="selected">Orange</option>
														<option value="White">White</option>
														<option value="Purple" selected="selected">Purple</option>
														<option value="Red">Red</option>
														<option value="Blue">Blue</option>
														<option value="Green">Green</option>
													</select>
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-budget">Input Group with Addons:</label>
													<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">$</span>
													</div>
													<input id="template-contactform-budget" name="template-contactform-budget" type="text" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="Enter your Budget">
														<div class="input-group-append">
															<span class="input-group-text">.00</span>
														</div>
													</div>
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-date">Date Time Picker:</label>
													<div class="form-group mb-0">
														<div class="input-group tleft">
															<div class="input-group-prepend" data-target=".datetimepicker1" data-toggle="datetimepicker">
																<div class="input-group-text"><i class="icon-calendar3"></i></div>
															</div>
															<input id="template-contactform-date" name="template-contactform-date" type="text" class="form-control datetimepicker-input datetimepicker1" data-target=".datetimepicker1" data-toggle="datetimepicker" placeholder="Select your Flexible Date & Time" />
														</div>
													</div>
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-upload">Upload Images:</label><br>
													<input id="template-contactform-upload" type="file" name="template-contactform-upload[]" multiple class="file file-loading" data-show-preview="false">
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-age" class="mb-3 clearfix">Select Your Age:</label>
													<input id="template-contactform-age" name="template-contactform-age" class="range_01 input-range-slider" />
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-rating" class="mb-0">Ratings:</label>
													<input id="template-contactform-rating" name="template-contactform-rating" type="number" class="rating" max="5" data-size="md">
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-platform" class="mb-3">Choose any Platform:</label><br>
													<div class="btn-group btn-group-toggle d-flex" data-toggle="buttons">
														<label for="template-contactform-platform-mobile" class="btn btn-outline-secondary flex-fill t600 ls0 nott active">
															<input type="radio" name="template-contactform-platform" id="template-contactform-platform-mobile" autocomplete="off" checked value="Mobile"> Mobile
														</label>
														<label for="template-contactform-platform-web" class="btn btn-outline-secondary flex-fill t600 ls0 nott">
															<input type="radio" name="template-contactform-platform" id="template-contactform-platform-web" autocomplete="off" value="Web"> Web
														</label>
														<label for="template-contactform-platform-others" class="btn btn-outline-secondary flex-fill t600 ls0 nott">
															<input type="radio" name="template-contactform-platform" id="template-contactform-platform-others" autocomplete="off" value="Others"> Others
														</label>
													</div>
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-offers" class="mb-3">Get Offers &amp; Newsletters:</label><br>
													<ul class="nav btn-group">
														<li class="btn-group">
															<a class="btn btn-outline-secondary px-4 active" data-toggle="pill" href="#offers-tab-1" role="tab">No</a>
														</li>
														<li class="btn-group">
															<a class="btn btn-outline-secondary px-4" data-toggle="pill" href="#offers-tab-2" role="tab">Yes</a>
														</li>
													</ul>
													<div class="tab-content">
														<div class="tab-pane show active" id="offers-tab-1" role="tabpanel"></div>
														<div class="tab-pane" id="offers-tab-2" role="tabpanel">
															<label for="template-contactform-offers-subscriber" class="mt-4">Offers Subscriber Email Address:</label>
															<input type="email" name="template-contactform-offers-subscriber" id="template-contactform-offers-subscriber" class="form-control" value="" placeholder="Enter your Email Address..">
														</div>
													</div>
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-know-us" class="mb-3">How do You Know about us:</label><br>
													<div class="btn-group btn-group-toggle nav" data-toggle="buttons">
														<a href="#know-us-tab-1" class="btn btn-outline-secondary flex-fill active" data-toggle="tab">
															<input type="radio" name="template-contactform-know-us" id="template-contactform-know-us-google" value="Google">Google
														</a>
														<a href="#know-us-tab-2" class="btn btn-outline-secondary flex-fill" data-toggle="tab">
															<input type="radio" name="template-contactform-know-us" id="template-contactform-know-us-social" value="Social">Social Sites
														</a>
														<a href="#know-us-tab-3" class="btn btn-outline-secondary flex-fill" data-toggle="tab">
															<input type="radio" name="template-contactform-know-us" id="template-contactform-know-us-friends" value="Friends">Friends
														</a>
														<a href="#know-us-tab-4" class="btn btn-outline-secondary flex-fill" data-toggle="tab">
															<input type="radio" name="template-contactform-know-us" id="template-contactform-know-us-others" value="others">Others
														</a>
													</div>

													<div class="tab-content">
														<div class="tab-pane show active" id="know-us-tab-1"></div>
														<div class="tab-pane" id="know-us-tab-2"></div>
														<div class="tab-pane" id="know-us-tab-3"></div>
														<div class="tab-pane" id="know-us-tab-4">
															<label for="template-contactform-know-us-info" class="mt-4">Info:</label>
															<textarea class="required form-control" id="template-contactform-know-us-info" name="template-contactform-know-us-info" rows="6" cols="20"></textarea>
														</div>
													</div>
												</div>

												<div class="col-12 bottommargin-sm">
													<label class="mb-3">Switch Input:</label><br>
													<div class="d-flex align-items-center">
														<div class="switch">
															<input id="template-contactform-default-switch" name="template-contactform-default-switch" class="switch-toggle switch-toggle-round" type="checkbox">
															<label for="template-contactform-default-switch"></label>
														</div>
														<label class="media-body text-muted ml-3" for="template-contactform-default-switch">
													    	<span class="d-block text-dark mb-1 nott ls0">Default Switch</span>
													    	<span class="d-block nott ls0 t400">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</span>
													    </label>
												    </div>
												    <div class="line my-3"></div>
												    <div class="d-flex align-items-center">
														<div class="switch">
															<input id="template-contactform-checked-switch" name="template-contactform-checked-switch" class="switch-toggle switch-toggle-round" checked type="checkbox">
															<label for="template-contactform-checked-switch"></label>
														</div>
														<label class="media-body text-muted ml-3" for="template-contactform-checked-switch">
													        <span class="d-block text-dark mb-1 nott ls0">Checked Switch</span>
													        <span class="d-block nott ls0 t400">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas, aut?</span>
													    </label>
												    </div>
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-url">URL with input Group(Autocomplete):</label>
													<div class="input-group mb-3">
													  <div class="input-group-prepend">
													    <span class="input-group-text">themeforest.net/user/</span>
													  </div>
													  <input type="text" class="form-control" id="template-contactform-url" name="template-contactform-url" value="semicolonweb" aria-describedby="url address..">
													</div>
												</div>

												<div class="col-12 bottommargin-sm">
													<label>Live Search (Max 3):</label><br>
													<select class="selectpicker form-control" multiple data-live-search="true" data-size="12" data-max-options="3" title="Choose max 3 of the following..." name="template-contactform-livesearch[]">
														<option value="China">China</option>
														<option value="India">India</option>
														<option value="Brazil">Brazil</option>
														<option value="Indonesia">Indonesia</option>
														<option value="Japan">Japan</option>
														<option value="Russia">Russia</option>
														<option value="Nigeria">Nigeria</option>
														<option value="Mexico">Mexico</option>
														<option value="Bangladesh">Bangladesh</option>
														<option value="Germany">Germany</option>
														<option value="Philippines">Philippines</option>
														<option value="Vietnam">Vietnam</option>
														<option value="United">United Kingdom</option>
														<option value="France">France</option>
														<option value="Thailand">Thailand</option>
														<option value="Iran">Iran</option>
														<option value="Turkey">Turkey</option>
														<option value="Italy">Italy</option>
														<option value="Egypt">Egypt</option>
													</select>
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-static-email">Static Email (Readonly & Disabled):</label><br>
													<input type="text" readonly class="form-control-plaintext h6 bg-light px-3 rounded" id="template-contactform-static-email" name="template-contactform-static-email" value="email@example.com">
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-select-splitter">Select Splitter:</label>
													<select id="template-contactform-select-splitter" size="1" class="form-control selectsplitter" name="template-contactform-select-splitter">
														<optgroup label="Category 1">
															<option value="1-1">Choice 1-1</option>
															<option value="1-2">Choice 1-2</option>
															<option value="1-3">Choice 1-3</option>
															<option value="1-4">Choice 1-4</option>
															<option value="1-5">Choice 1-5</option>
															<option value="1-6">Choice 1-6</option>
															<option value="1-7">Choice 1-7</option>
															<option value="1-8">Choice 1-8</option>
														</optgroup>
														<optgroup label="Category 2">
															<option value="2-1">Choice 2-1</option>
															<option value="2-2">Choice 2-2</option>
															<option value="2-3">Choice 2-3</option>
															<option value="2-4">Choice 2-4</option>
														</optgroup>
														<optgroup label="Category 3">
															<option value="3-1">Choice 3-1</option>
															<option value="3-2">Choice 3-2</option>
															<option value="3-3">Choice 3-3</option>
															<option value="3-4">Choice 3-4</option>
														</optgroup>
													</select>
												</div>

												<div class="col-12 bottommargin-sm">
													<label for="template-contactform-message">Textarea:<small class="text-danger">*</small></label>
													<textarea class="required form-control textarea-message" id="template-contactform-message" name="template-contactform-message" rows="6" cols="30"></textarea>
												</div>

												<div class="col-12 hidden">
													<input type="text" id="template-contactform-botcheck" name="template-contactform-botcheck" value="" />
												</div> -->
												<div class="col-12">
													<button type="submit" name="template-contactform-submit" class="btn btn-secondary btn-block btn-lg">입력 완료</button>
												</div>

												<input type="hidden" name="prefix" value="template-contactform-">

											</div>

										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<br><br><br><br><br><br><br><br>
					

					<div class="bottommargin divcenter" style="max-width: 750px; min-height: 350px;" >
						<div class="chartjs-size-monitor" style="position: absolute; 
							left: 0px; top: 0px; right : 0px; bottom : 0px; overflow : hidden; 
							pointer-events : none; visibility : hidden; z-index: -1;">
							
							<div class="chartjs-size-monitor-expand" 
								style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;
										pointer-events:none;visibility:hidden;z-index:-1;">
								<div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
							</div>
							
						</div>
						
						<canvas id="chart-0" width="720" height="360" class="chartjs-render-monitor"
							style="display: block; width: 720px; height : 360px;" />
					</div>

				</div>

			</div>

		</section><!-- #content end -->

	</div>

</div>

		</section>
		<!-- #content end -->

		<!-- Footer
		============================================= -->
		<%@ include file="../include/footer.jsp"%>
		<!-- #footer end -->

	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<%@ include file="../include/footerScript.jsp"%>
	
	<script src="resources/js/chart.js"></script>
	<script src="resources/js/chart-utils.js"></script>
	<script>

		var NUTRIENTS = ["Carbohydrate", "Protein", "Fat", "Minerals", "Vitamin"];
		var color = Chart.helpers.color;
		var barChartData = {
			labels: ["Carbohydrate", "Protein", "Fat", "Minerals", "Vitamin"],
			datasets: [{
				label: '내가 섭취한 칼로리',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}, {
				label: '칼로리 하루 권장량',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.blue,
				borderWidth: 1,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}]

		};

		window.onload = function() {
			var ctx = document.getElementById("chart-0").getContext("2d");
			window.myBar = new Chart(ctx, {
				type: 'bar',
				data: barChartData,
				options: {
					responsive: true,
					legend: {
						position: 'top',
					},
					title: {
						display: true,
						text: '오늘 섭취한 칼로리'
					}
				}
			});

		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			var zero = Math.random() < 0.2 ? true : false;
			barChartData.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return zero ? 0.0 : randomScalingFactor();
				});

			});
			window.myBar.update();
		});

		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addDataset').addEventListener('click', function() {
			var colorName = colorNames[barChartData.datasets.length % colorNames.length];;
			var dsColor = window.chartColors[colorName];
			var newDataset = {
				label: 'Dataset ' + barChartData.datasets.length,
				backgroundColor: color(dsColor).alpha(0.5).rgbString(),
				borderColor: dsColor,
				borderWidth: 1,
				data: []
			};

			for (var index = 0; index < barChartData.labels.length; ++index) {
				newDataset.data.push(randomScalingFactor());
			}

			barChartData.datasets.push(newDataset);
			window.myBar.update();
		});

		document.getElementById('addData').addEventListener('click', function() {
			if (barChartData.datasets.length > 0) {
				var month = MONTHS[barChartData.labels.length % MONTHS.length];
				barChartData.labels.push(month);

				for (var index = 0; index < barChartData.datasets.length; ++index) {
					//window.myBar.addData(randomScalingFactor(), index);
					barChartData.datasets[index].data.push(randomScalingFactor());
				}

				window.myBar.update();
			}
		});

		document.getElementById('removeDataset').addEventListener('click', function() {
			barChartData.datasets.splice(0, 1);
			window.myBar.update();
		});

		document.getElementById('removeData').addEventListener('click', function() {
			barChartData.labels.splice(-1, 1); // remove the label first

			barChartData.datasets.forEach(function(dataset, datasetIndex) {
				dataset.data.pop();
			});

			window.myBar.update();
		});

	</script>
</body>
</html>