<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
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