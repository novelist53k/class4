<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<section>
        <div class="area">
            <div class="slider_title">
                <h2>NEW & UPCOMING MOVIES</h2>
                <hr>
            </div>
            <!-- 슬라이더 -->
            <div class="my-slider-1">
                <div class="owl-carousel owl-theme">
                    <div class="item"><img src="${pageContext.request.contextPath }/resources/img/poster.jpg" alt=""></div>
                    <div class="item"><img src="${pageContext.request.contextPath }/resources/img/poster.jpg" alt=""></div>
                    <div class="item"><img src="${pageContext.request.contextPath }/resources/img/poster.jpg" alt=""></div>
                    <div class="item"><img src="${pageContext.request.contextPath }/resources/img/poster.jpg" alt=""></div>
                    <div class="item"><img src="${pageContext.request.contextPath }/resources/img/poster.jpg" alt=""></div>
                </div>
            </div>
            
        </div>
    </section>
    
    <script>
    	function MySlider1__init() {
	        $('.my-slider-1 > .owl-carousel').owlCarousel({
	            responsive:{
	                0:{
	                    items:3
	                }
	            },
	            loop:true,
	            dots:false,
	            nav:true,
	            navText: ['<span class="glyphicon glyphicon-chevron-left" style="color:white;"></span>',
	                      '<span class="glyphicon glyphicon-chevron-right" style="color:white;"></span>'],
	            center:true
	        });
        }
        MySlider1__init();
	</script>
