<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	var eat1 = 10;
	var eat2 = 20;
	var eat3 = 30;
	var eat4 = 40;
	var eat5 = 50;
	var eat6 = 60;
	var eat7 = 70;

	var burn1 = 70;
	var burn2 = 60;
	var burn3 = 50;
	var burn4 = 40;
	var burn5 = 30;
	var burn6 = 20;
	var burn7 = 10;

	var color = Chart.helpers.color;
	var barChartData = {
		labels : [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
				"Friday", "Saturday" ],
		datasets : [
				{
					type : 'bar',
					label : '섭취 열량',
					backgroundColor : color(window.chartColors.red).alpha(0.2)
							.rgbString(),
					borderColor : window.chartColors.red,
					data : [ eat1, eat2, eat3, eat4, eat5, eat6, eat7 ]
				},
				{
					type : 'line',
					label : '잉여 열량',
					backgroundColor : color(window.chartColors.blue).alpha(0.2)
							.rgbString(),
					borderColor : window.chartColors.blue,
					data : [ (eat1 - burn1), (eat2 - burn2), (eat3 - burn3),
							(eat4 - burn4), (eat5 - burn5), (eat6 - burn6),
							(eat7 - burn7) ]
				},
				{
					type : 'bar',
					label : '소비열량',
					backgroundColor : color(window.chartColors.green)
							.alpha(0.2).rgbString(),
					borderColor : window.chartColors.green,
					data : [ burn1, burn2, burn3, burn4, burn5, burn6, burn7 ]
				} ]
	};

	// Define a plugin to provide data labels
	Chart.plugins.register({
		afterDatasetsDraw : function(chart, easing) {
			// To only draw at the end of animation, check for easing === 1
			var ctx = document.getElementById("chart-0").getContext("2d");

			chart.data.datasets.forEach(function(dataset, i) {
				var meta = chart.getDatasetMeta(i);
				if (!meta.hidden) {
					meta.data.forEach(function(element, index) {
						// Draw the text in black, with the specified font
						ctx.fillStyle = 'rgb(0, 0, 0)';

						var fontSize = 16;
						var fontStyle = 'normal';
						var fontFamily = 'Helvetica Neue';
						ctx.font = Chart.helpers.fontString(fontSize,
								fontStyle, fontFamily);

						// Just naively convert to string for now
						var dataString = dataset.data[index].toString();

						// Make sure alignment settings are correct
						ctx.textAlign = 'center';
						ctx.textBaseline = 'middle';

						var padding = 5;
						var position = element.tooltipPosition();
						ctx.fillText(dataString, position.x, position.y
								- (fontSize / 2) - padding);
					});
				}
			});
		}
	});

	window.onload = function() {
		var ctx = document.getElementById("chart-0").getContext("2d");
		window.myBar = new Chart(ctx, {
			type : 'bar',
			data : barChartData,
			options : {
				responsive : true,
				title : {
					display : true,
					text : 'Combo Bar Line Chart'
				},
			}
		});
	};



</script>

<canvas id="chart-0" style="display: block;"></canvas>
</body>
</html>