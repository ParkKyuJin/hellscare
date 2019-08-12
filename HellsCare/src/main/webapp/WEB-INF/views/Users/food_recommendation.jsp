<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 추천</title>
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
				<h1>식단 추천</h1>
				<span>회원님의 건강 정보에 맞게 맞춤형 식단을 추천합니다.</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item"><a href="#">식단</a></li>
					<li class="breadcrumb-item active" aria-current="page">식단 추천</li>
				</ol>
			</div>

		</section><!-- #page-title end -->
		
			<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<!-- Post Content
					============================================= -->
					<div class="postcontent nobottommargin clearfix">
			
						<div class="divider"><i class="icon-circle"></i></div>
			
						<h3>대표 건강 식단</h3>
			
						<ul id="myTab" class="nav nav-tabs boot-tabs">
						  <li class="nav-item"><a class="nav-link active" href="#home" data-toggle="tab">Home</a></li>
						  <li class="nav-item"><a class="nav-link" href="#profile" data-toggle="tab">Profile</a></li>
						  <li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="myTabDrop1" data-toggle="dropdown">Dropdown</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
							  <a class="dropdown-item" href="#dropdown1" tabindex="-1" data-toggle="tab">@fat</a>
							  <a class="dropdown-item" href="#dropdown2" tabindex="-1" data-toggle="tab">@mdo</a>
							</ul>
						  </li>
						</ul>
						<div id="myTabContent" class="tab-content">
						  <div class="tab-pane fade show active" id="home">
							<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
						  </div>
						  <div class="tab-pane fade" id="profile">
							<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
						  </div>
						  <div class="tab-pane fade" id="dropdown1">
							<p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
						  </div>
						  <div class="tab-pane fade" id="dropdown2">
							<p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
						  </div>
						</div>
			
						<div class="line"></div>
			
						<h4>Pills Navigation Style</h4>
			
						<ul id="myTab2" class="nav nav-pills boot-tabs">
						  <li class="nav-item"><a class="nav-link active" href="#home2" data-toggle="tab">Home</a></li>
						  <li class="nav-item"><a class="nav-link" href="#profile2" data-toggle="tab">Profile</a></li>
						  <li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="myTabDrop1" data-toggle="dropdown">Dropdown</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
							  <a class="dropdown-item" href="#dropdown3" tabindex="-1" data-toggle="tab">@fat</a>
							  <a class="dropdown-item" href="#dropdown4" tabindex="-1" data-toggle="tab">@mdo</a>
							</ul>
						  </li>
						</ul>
						<div id="myTabContent2" class="tab-content">
						  <div class="tab-pane fade show active" id="home2">
							<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
						  </div>
						  <div class="tab-pane fade" id="profile2">
							<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
						  </div>
						  <div class="tab-pane fade" id="dropdown3">
							<p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
						  </div>
						  <div class="tab-pane fade" id="dropdown4">
							<p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
						  </div>
						</div>
			
						<div class="line"></div>
			
						<h4>Side Tabs Style</h4>
			
						<div class="row">
							<div class="col-4">
								<div class="list-group" id="list-tab" role="tablist">
									<a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">Home</a>
									<a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Profile</a>
									<a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">Messages</a>
									<a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Settings</a>
								</div>
							</div>
							<div class="col-8">
								<div class="tab-content" id="nav-tabContent">
									<div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit nisi veritatis enim, eaque quibusdam eius vel? Vel natus adipisci sit, omnis et enim nostrum quia hic atque odit, numquam deleniti. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum libero vitae neque laboriosam suscipit cupiditate animi porro distinctio excepturi, beatae quas officiis dolorem sit aliquid vel ab consequatur eveniet soluta necessitatibus quidem? Iure, consequuntur non odio accusamus est repudiandae culpa!</p>
									</div>
									<div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
										<p>Nobis laudantium est repellendus ad cumque ex quasi alias, quas veritatis nam optio deleniti itaque, expedita, quo quidem temporibus? Voluptate ratione numquam ex quae, culpa eos eum dolor a dolore vitae praesentium animi? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum earum beatae quibusdam aspernatur impedit fuga excepturi sapiente pariatur blanditiis provident repudiandae inventore veritatis tenetur eum nisi magni explicabo dolorem atque recusandae praesentium non, mollitia dignissimos fugit! Reiciendis consectetur eligendi corporis!</p>
									</div>
									<div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
										<p>Quam aspernatur incidunt iure soluta consequatur veniam exercitationem deleniti ullam, molestiae similique odio facilis iusto numquam. Quasi voluptatem laborum deleniti neque, necessitatibus repellat, ipsam repudiandae dignissimos. Deleniti soluta facere fugiat repudiandae delectus, perspiciatis quibusdam animi odit, eius iste vitae modi nesciunt maiores quasi repellendus eaque ratione tempora eos minus eum excepturi qui praesentium, ipsam. Maiores nulla eum dolorum saepe ullam officia consequatur blanditiis harum aperiam sequi. Dolorem odio aliquid amet error eveniet excepturi quis, suscipit, cumque itaque ab dicta magnam dolorum voluptatum cupiditate placeat atque delectus eius facilis mollitia possimus!</p>
									</div>
									<div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">
										<p>Placeat doloribus earum voluptate delectus porro reprehenderit unde vero neque obcaecati, aperiam, dicta, tenetur labore consequuntur enim error quidem facere eum eveniet repellendus et fugit debitis! Laudantium, dolore quasi quae rem repellendus sit hic. Nobis vel ab ratione quisquam nesciunt blanditiis et itaque iste eos atque placeat expedita quis aliquam rerum dolore fuga, dicta. Veritatis inventore adipisci cupiditate ducimus laborum eaque atque deleniti repellendus pariatur veniam repellat id laudantium, asperiores provident tempora eveniet, nihil esse facere iusto aliquam maiores, iste. Quaerat, sapiente repudiandae aspernatur animi maiores, nesciunt veritatis quam, suscipit asperiores vitae itaque! Autem, architecto, repellendus. Laudantium labore, doloremque necessitatibus quod sint iure ab officiis delectus molestias sunt illum velit harum ullam! Blanditiis corporis reiciendis pariatur, amet magni animi. Laboriosam animi ducimus a.</p>
									</div>
								</div>
							</div>
						</div>
			
					</div><!-- .postcontent end -->
			
					<!-- Sidebar
					============================================= -->
					<div class="sidebar nobottommargin col_last clearfix">
						<div class="sidebar-widgets-wrap">
			
							<div class="widget widget_links clearfix">
			
								<h4>Shortcodes</h4>
								<ul>
									<li><a href="animations.html"><div>Animations</div></a></li>
									<li><a href="buttons.html"><div>Buttons</div></a></li>
									<li><a href="carousel.html"><div>Carousel</div></a></li>
									<li><a href="charts.html"><div>Charts</div></a></li>
									<li><a href="clients.html"><div>Clients</div></a></li>
									<li><a href="columns-grids.html"><div>Columns</div></a></li>
									<li><a href="counters.html"><div>Counters</div></a></li>
									<li><a href="dividers.html"><div>Dividers</div></a></li>
									<li><a href="featured-boxes.html"><div>Icon Boxes</div></a></li>
									<li><a href="gallery.html"><div>Galleries</div></a></li>
									<li><a href="headings-dropcaps.html"><div>Heading Styles</div></a></li>
									<li><a href="icon-lists.html"><div>Icon Lists</div></a></li>
									<li><a href="labels-badges.html"><div>Labels</div></a></li>
									<li><a href="lightbox.html"><div>Lightbox</div></a></li>
									<li><a href="lists-cards.html"><div>Lists &amp; Cards</div></a></li>
									<li><a href="maps.html"><div>Maps</div></a></li>
									<li><a href="media-embeds.html"><div>Media Embeds</div></a></li>
									<li><a href="modal-popovers.html"><div>Modal Boxes</div></a></li>
									<li><a href="navigation.html"><div>Navigations</div></a></li>
									<li><a href="pagination-progress.html"><div>Pagination</div></a></li>
									<li><a href="pie-skills.html"><div>Pies &amp; Skills</div></a></li>
									<li><a href="pricing.html"><div>Pricing Boxes</div></a></li>
									<li><a href="process-steps.html"><div>Process Steps</div></a></li>
									<li><a href="promo-boxes.html"><div>Promo Boxes</div></a></li>
									<li><a href="quotes-blockquotes.html"><div>Blockquotes</div></a></li>
									<li><a href="responsive.html"><div>Responsive</div></a></li>
									<li><a href="sections.html"><div>Sections</div></a></li>
									<li><a href="social-icons.html"><div>Social Icons</div></a></li>
									<li><a href="style-boxes.html"><div>Alert Boxes</div></a></li>
									<li><a href="styled-icons.html"><div>Styled Icons</div></a></li>
									<li><a href="tables.html"><div>Tables</div></a></li>
									<li><a href="tabs.html"><div>Tabs</div></a></li>
									<li><a href="testimonials-twitter.html"><div>Testimonials</div></a></li>
									<li><a href="thumbnails-slider.html"><div>Thumbnails</div></a></li>
									<li><a href="toggles-accordions.html"><div>Toggles</div></a></li>
								</ul>
			
							</div>
			
							<div class="widget clearfix">
			
								<h4>Dribbble Shots</h4>
								<div id="dribbble-widget" class="dribbble-shots masonry-thumbs" data-user="envato" data-count="16" data-type="user"></div>
			
							</div>
			
							<div class="widget widget-twitter-feed clearfix">
			
								<h4>Twitter Feed</h4>
								<ul class="iconlist twitter-feed" data-username="envato" data-count="2">
									<li></li>
								</ul>
			
								<a href="#" class="btn btn-secondary btn-sm fright">Follow Us on Twitter</a>
			
							</div>
			
						</div>
					</div><!-- .sidebar end -->
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
</body>
</html>