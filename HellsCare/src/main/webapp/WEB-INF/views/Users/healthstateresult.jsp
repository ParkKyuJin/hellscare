<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<body class="stretched">
	<%@ include file="../include/header.jsp"%>
	<section id="page-title">

		<div class="container clearfix">
			<h1>진단 결과</h1>
			<span>입력하신 정보를 토대로 위험군을 안내합니다.</span>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="main">Home</a></li>
				<li class="breadcrumb-item"><a href="nextpage">HealthState</a></li>

			</ol>
		</div>

	</section>
	<!-- #page-title end -->
	<section id="content">
		<div class="content-wrap">
			<div class="container clearfix">

				<table class="table table-striped">
					<thead align="center">
						<tr>
							<th>#</th>
							<th align="center">항목</th>
							<th align="center">현재수치</th>
							<th align="center">정삼범위</th>
							<th align="center">상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="center">1</td>
							<td align="center" style="font-size: 1.7em;">BMI</td>
							<td align="center"><c:if test="${dto.bmi == null}">
									<button type="button" class="btn btn-outline-dark">정보입력이
										필요합니다!</button>
								</c:if> <c:if test="${dto.bmi>=18.5&&dto.bmi<=23}">
									<a class="button button-border button-rounded button-green"
										style="color: green;">${dto.bmi}</a>

								</c:if> <c:if test="${dto.bmi>=23&&dto.bmi<=25}">
									<a href="#"
										class="button button-border button-rounded button-yellow button-light">${dto.bmi}</a>
								</c:if> <c:if test="${dto.bmi>=25}">
									<a class="button button-border button-rounded button-red"
										style="color: red;">${dto.bmi}</a>
								</c:if></td>
							<td align="center" style="font-size: 1.7em;">18.5 ~ 23</td>
							<td align="center"><c:if test="${dto.glucose == null}">
									<button type="button" class="btn btn-outline-dark">정보입력이
										필요합니다!</button>
								</c:if> <c:if test="${dto.bmi>=18.5&&dto.bmi<=23}">
									<div class="alert alert-danger">
										<i class="icon-warning-sign"></i><strong>Warning!</strong>
										과체중! 주의가 필요합니다!

									</div>
								</c:if> <c:if test="${dto.bmi>=23&&dto.bmi<=25}">
									<div class="alert alert-danger">
										<i class="icon-warning-sign"></i><strong>Warning!</strong>
										과체중! 주의가 필요합니다!

									</div>
								</c:if> <c:if test="${dto.bmi>=25}">
									<div class="alert alert-danger">
										<i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험!
										관리가 필요합니다!

									</div>
								</c:if></td>
						</tr>
						<tr>
							<td align="center">2</td>
							<td align="center" style="font-size: 1.7em;">혈당</td>
							<td align="center"><c:if test="${dto.glucose == null}">
									<button type="button" class="btn btn-outline-dark">정보입력이
										필요합니다!</button>
								</c:if> <c:if test="${dto.glucose<100}">
									<a class="button button-border button-rounded button-green"
										style="color: green;">${dto.glucose}</a>
								</c:if> <c:if test="${dto.glucose>=100&&dto.glucose<=125}">
									<a href="#"
										class="button button-border button-rounded button-yellow button-light">${dto.glucose}</a>
								</c:if> <c:if test="${dto.glucose>126}">
									<a class="button button-border button-rounded button-red"
										style="color: red;">${dto.glucose}</a>
								</c:if></td>
							<td align="center" style="font-size: 1.7em;">120~125</td>
							<td align="center"><c:if test="${dto.glucose == null}">
									<button type="button" class="btn btn-outline-dark">정보입력이
										필요합니다!</button>
								</c:if> <c:if test="${dto.glucose>=100&&dto.glucose<=125}">
									<div class="alert alert-warning">
										<i class="icon-warning-sign"></i><strong>Warning!</strong> 주의가
										필요합니다!

									</div>
								</c:if> <c:if test="${dto.glucose<100}">
									<div class="alert alert-success">
										<i class="icon-gift"></i><strong>Well done!</strong> 지금처럼
										유지하세요!
									</div>
								</c:if> <c:if test="${dto.glucose>125}">
									<div class="alert alert-danger">
										<i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험!
										관리가 필요합니다!

									</div>
								</c:if></td>
						</tr>
						<tr>
							<td align="center">3</td>
							<td align="center" style="font-size: 1.7em;">혈압</td>
							<td align="center"><c:if test="${dto.pressure == null}">
									<button type="button" class="btn btn-outline-dark">정보입력이
										필요합니다!</button>
								</c:if> <c:if test="${dto.pressure<100}">
									<a class="button button-border button-rounded button-red"
										style="color: red;">${dto.pressure}</a>
								</c:if> <c:if test="${dto.pressure>=100&&dto.pressure<=120}">
									<a class="button button-border button-rounded button-green"
										style="color: green;">${dto.pressure}</a>
								</c:if> <c:if test="${dto.pressure>=121&&dto.pressure<140}">
									<a
										class="button button-border button-rounded button-yellow button-light">${dto.pressure}</a>
								</c:if> <c:if test="${dto.pressure>=140}">
									<a class="button button-border button-rounded button-red"
										style="color: red;">${dto.pressure}</a>
								</c:if></td>
							<td align="center" style="font-size: 1.7em;">100 ~ 120</td>
							<td align="center" style="width: 400px;"><c:if
									test="${dto.pressure == null}">
									<button type="button" class="btn btn-outline-dark">정보입력이
										필요합니다!</button>
								</c:if> <c:if test="${dto.pressure<100}">
									<div class="alert alert-danger">
										<i class="icon-warning-sign"></i><strong>Warning!</strong>
										저혈압! 주의가 필요합니다!

									</div>
								</c:if> <c:if test="${dto.pressure>=100&&dto.pressure<=120}">
									<div class="alert alert-success">
										<i class="icon-gift"></i><strong>Well done!</strong> 지금처럼
										유지하세요!
									</div> 
								</c:if> <c:if test="${dto.pressure>=121&&dto.pressure<140}">
									<div class="alert alert-warning">
										<i class="icon-warning-sign"></i><strong>Warning!</strong> 주의가
										필요합니다!

									</div>
								</c:if> <c:if test="${dto.pressure>=140}">
									<div class="alert alert-danger">
										<i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험!
										관리가 필요합니다!

									</div>
								</c:if></td>
						</tr>
						<tr>
							<td align="center">4</td>
							<td align="center" style="font-size: 1.7em;">음주량</td>
							<td align="center"><c:if test="${dto.drinkAmount>4}">
									<a class="button button-border button-rounded button-red"
										style="color: red;">${dto.drinkAmount}잔</a>
								</c:if> <c:if test="${dto.drinkAmount<=4}">
									<a class="button button-border button-rounded button-green"
										style="color: green;">${dto.drinkAmount}잔</a>
								</c:if> <c:if test="${dto.drinkAmount == null}">
									<button type="button" class="btn btn-outline-dark">정보입력이
										필요합니다!</button>
								</c:if></td>
							<td align="center" style="font-size: 1.7em;">4잔(맥주기준)</td>
							<td align="center" style="width: 400px;"><c:if
									test="${dto.drinkAmount>4}">
									<div class="alert alert-danger">
										<i class="icon-warning-sign"></i><strong>Warning!</strong> 폭음은
										건강에 매우 해롭습니다!

									</div>
									
								</c:if> <c:if test="${dto.drinkAmount == null}">
									<button type="button" class="btn btn-outline-dark">정보입력이
										필요합니다!</button>
								</c:if> <c:if test="${dto.drinkAmount<=4}">
									<div class="alert alert-success">
										<i class="icon-gift"></i><strong>Well done!</strong> 지금처럼
										유지하세요!
									</div>
								</c:if></td>
						</tr>
					</tbody>
				</table>
				<br>
				<br>
				<div class="toggle">
					<div class="togglet">
						<i class="toggle-closed icon-ok-circle"></i><i
							class="toggle-open icon-remove-circle"></i>BMI 관련
					</div>
					<div class="togglec">
						<b>1. 복부비만의 위험성</b><br> 체중은 정상이지만 팔다리가 가늘고 배가 나온 사람은 복부비만이라고
						할 수 있다. 이것은 숨을 내쉰 상태에서 허리둘레와 엉덩이 둘레의 비율로 측정하는데 대개 허리둘레가 남성은
						90cm이상, 여성은 85cm이상인 경우 복부비만으로 본다. 복부에 지방이 과잉 축적되면 복부 내에 있는 간장, 신장,
						방광, 자궁등의 기능을 저하시키고 전신의 기혈순환을 방해해 동맥경화, 당뇨병, 고지혈증, 고혈압, 통풍 등의 성인병을
						유발하게 된다.<br> <b>2. 진단과 치료</b><br> 우선 혈액검사, 생화학검사, 감상선
						기능섬사, 복부 Xㅡ레이 등의 검사를 통해 일반적인 건강상태 및 비만에 의한 합병증 여부를 진단한다. 그런 다음
						실제적인 비만도와 복부 비만도를 측정하고 환자의 체질, 비만정도, 순환장애 여부 등에 따라 치료에 들어간다.<br>
						<b>3.복부비만 예방법</b><br> a. 하루에 40분 이상 걷고 많이 움직인다.<br> b.
						평소 식사량의 80%만 먹되, 음식물을 천천히 꼭꼭 씹어서 먹는다.<br> c. 제때에 먹고 간식은 줄인다.<br>
						d. 야식을 피하고 섬유질이 많이 든 음식물을 섭취한다.<br> e. 술과 담배를 멀리한다.<br>
						<b>#배살을 빼기 위한 운동#</b><br> 배 안에 내장된 과다한 지방을 줄이기 위해서는 적절한 식사요법과
						운동이 필요하며 내지장을 효과적으로 줄여주는 운동으로 빨리걷기, 달리기, 자전거 타기, 수영 등 유산소 운동과 윗몸
						일으키기를 비롯한 근력운동이 좋다. <br> 여기서 복근운동을 할 때 간소한 복근운동을 무리하게 윗몸을
						일으키는 방법보다는 좀더 체계적인 운동을 하므로 좋은 결과를 가져올 것이다. <br> 복부는 상복부, 하복부,
						외복부 이렇게 세가지로 나눠서 운동을 한다. <br> <br> a. 유산소 운동 <br>
						조깅, 계단 오르기, 자전거 타기, 수영 중 하나를 택하여 1주일에 3~4일, 40~60분 정도 약간 힘들다는 느낌이
						들 정도로 운동한다.(운동 맥박수가 10초에 22~24회 정도) <br> <br> b. 상복부 운동
						<br> 윗몸 일으키기 (크런치) <br> 1set당 15회~30회 사이를 정하고 총 5set 한다.
						<br> <br> c. 하복부 운동 <br> 하체 들어 올리기 (리버스 크런치) <br>
						이 운동을 하게되면 배꼽아래 하복부가 단단하게 뭉치는 것을 알 수 있다. <br> 만약 이런 현상이 없다면
						자세가 틀린 것이니 트래이너에게 자문을 구해야 한다. <br> <br> d. 외복부 운동 <br>
						일명 옆구리 운동 (사이드 밴드) <br> 이 운동을 할 때 엉덩이와 하체가 움직이면 안된다. <br>
						오로지 옆구리 윗부분 상체만 좌우로 움직여야 한다. <br> <br> e. 척추 세움근 운동 <br>
						하이퍼 익스텐션 혹은 백 익스텐션 이라고도 한다. <br> 숙련되지 않은 초보일 경우 두팔을 팔장을 끼고
						상체를 들어올리면 된다.
					</div>
				</div>
				<hr>
				<div class="toggle">
					<div class="togglet">
						<i class="toggle-closed icon-ok-circle"></i><i
							class="toggle-open icon-remove-circle"></i>혈당 관련
					</div>
					<div class="togglec">
						<b>1. 진단 기준</b><br> 미국당뇨병학회(ADA)의 정의에 따르면, 공복혈당이
						100mg/dl(5.6mmol/liter)이상이지만 126mg/dl(7.0mmol/liter)는 넘지 않는 상태를
						공복혈당장애(Impaired Fasting Glucose)라고 합니다. 또한 75g 경구당부하 검사시 식사를 하고
						2시간 후 혈당이 140mg/dl(7.8mmol/liter) 이상이지만 200mg/dl(11.1mmol/liter)를
						넘지 않는 상태를 내당능장애(Impaired Glucose Tolerance)로 정의합니다. <br> <b>2.
							높은 혈당 낮춰주는 음식 5가지</b><br> 1. 연근 연근에는 수용성, 불용성 식이섬유가 풍부해 혈당을 내려줄
						뿐만 아니라 혈중 콜레스테롤과 중성지방을 낮춰준다. 또한 항산화물질 중 하나인 폴리페놀이 들어 있어 혈액을 끈적끈적
						거리게 만드는 활성산소를 없애준다. <br> <br> 2. 우엉 우엉은 포도당을 흡수해 혈중 당
						수치가 높아지지 않도록 도와준다. 특히 혈액 속의 불필요한 콜레스테롤을 빨아들여 몸 밖으로 배출시키는 역할을 하기
						때문에 비만, 당뇨병이 있는 환자들이 섭취하면 좋다. <br> <br> 3. 곤약 곤약은 칼로리가
						적고 식이섬유가 많아 체중 감량에 좋은 다이어트 음식 중 하나다. 뿐만 아니라 수용성 식이섬유로 알려진 글루코만난
						성분이 장 속으로 들어가면 함께 먹은 음식 찌꺼기들을 제거해줘 당분의 흡수 속도를 늦춰준다. <br> <br>
						4. 양파 양파에는‘황화아릴’계열의 성분이 들어 있어 혈당 수치를 낮춰주고 혈액 순환이 원활하게 되도록 도와준다. 특히
						인슐린 분비를 촉진시키고 체내 해독 기능을 강화시켜 각종 질병으로 인해 틀어진 체내 밸런스를 적정하게 맞춰준다. <br>
						<br> 5. 검은 콩 단백질 성분이 풍부한 검은 콩에는 ‘트립신’과 ‘키모트리신’이라는 효소들이 들어 있다.
						이러한 효소들은 인슐린을 분비하는 췌장의 기능을 활성화시켜 당뇨병 개선에 큰 도움을 준다. <br> <br>
					</div>
				</div>
				<hr>
				<div class="toggle">
					<div class="togglet">
						<i class="toggle-closed icon-ok-circle"></i><i
							class="toggle-open icon-remove-circle"></i>혈압 관련
					</div>
					<div class="togglec">
						<b>1. 고혈압이란?</b><br> 고혈압은 혈관 벽에 혈액의 미는 힘이 증가하여, 혈관 벽이 긴장 혹은
						손상되는 질환입니다. 지속적으로 증가한 혈압 때문에, 주요 표적인 뇌, 심장, 콩팥, 눈 등이 손상될 수 있습니다.
						한번 측정해서 혈압이 높다고 고혈압으로 진단하지는 않습니다. 혈압은 하루에도 수시로 변하며, 몸의 상태에 따라서
						변동하기 때문입니다. 따라서 혈압을 2분 간격으로 2회 이상 측정하여 평균을 내고 2~3일 간격으로 다시 측정하는 것이
						정확합니다. 고혈압은 수축기 혈압이 140mmHg 보다 높거나 또는 이완기 혈압이 90mmHg 보다 높을 때를
						말합니다. <br>
						<table align="center">
							<tr>
								<td></td>
								<td>분류</td>
								<td>측정혈압</td>
							</tr>
							<tr>
								<td rowspan="2">정상</td>
								<td>정상혈압</td>
								<td>최고혈압 120미만, 최저혈압 80미만</td>
							</tr>
							<tr>

								<td>고혈압 전단계</td>
								<td>최고혈압 120-139, 최저혈압 80-89</td>
							</tr>
							<tr>
								<td rowspan="2">고혈압</td>
								<td>1기 고혈압</td>
								<td>최고혈압 140-159, 최저혈압 90-99</td>
							</tr>
							<tr>

								<td>2기 고혈압</td>
								<td>최고혈압 160 이상, 최저혈압 100 이상</td>
							</tr>
						</table>
						<b>혈압 낮추는데 도움이 되는 방법</b><br> ◈ 느리게심호흡하기 <br> 연구결과 15분 동안
						3~4번 심호흡을 한 사람들의 혈압이 크게 떨어지는 것으로 나타났는데요,, 어느 곳에서든지 하루에 2분 정도만 느리고
						깊게 숨을 들어 마시고 내쉬기를 한다면 혈압이 떨어질 뿐 아니라 중추신경계에도 좋은 영향을 준다고 합니다. <br>
						◈악력운동하기 <br> 몸 전체를 움직이지 않고 근육을 자극하는 방법으로 등척 성 운동이라는 것이 있는데요,,
						등척 성 운동은 손잡이 형 훈련 기구를 가지고 하는 것입니다. <br> 한마디로 등척 악력운동이라고 할 수
						있는데요,, 1주일에 3일 씩 12~15분 동안 훈련 기구를 손으로 꽉 쥐었다 푸는 동작을 2분 동안 하고 잠깐 휴식한
						뒤 다시 하는 운동을 하면 혈압이 크게 떨어진다고 합니다. <br> ◈명상하기 <br> 눈을 감고
						조용한 음악을 들으며 하는 초월 명상법을 하면 스트레스를 해소시켜 혈압을 낮추는데 효과적이라고 합니다.
					</div>
				</div>
				<hr>
				<div class="toggle">
					<div class="togglet">
						<i class="toggle-closed icon-ok-circle"></i><i
							class="toggle-open icon-remove-circle"></i>음주량 관련
					</div>
					<div class="togglec">폭음은 남성이 표준 5잔, 여성이 표준 4잔 이상을 2시간 동안 마시는
						것으로 정의되어 있습니다. 사람마다 주량은 다르지만 세계평균보다 우리나라 사람이 일주일에 1회 이상 폭음하는 경우가

						높게 나타나고, 남성은 여성의 2배이상 높게 나타나고 있습니다. 뇌는 한번의 폭음으로 곧바로 손상을 입을 수 있고,
						이는 음주 후 필름이 끊기는 현상으로 이어지며 이 같은 증상이반복되면 알코올성 치매를 유발 할 수 있습니다. 또한 간에
						염증을 유발하는 급성 간염을 일으키기도 하며 심한 경우는 심장의 움직임을 느리게 만들어 심장을 멎게 할 수도 있습니다.



						폭음을 하지 않기 위해서는 자신의 음주 습관을 살펴본 후 개선하는 것이 중요합니다. 본인의 의지로 되지 않는다면
						전문의에게 상담하는 방법도 있습니다. 취하지 않는다고 폭음을 자주 한다면 이미 나빠져 있는 자신의 몸을 발견 할 수도
						있습니다. 폭음의 위험성을 잘 인지하고 폭음을 하지 않도록 하는 것이 가장 중요하지 않을까요?</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/footerScript.jsp"%>
</body>