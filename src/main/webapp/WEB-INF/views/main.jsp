<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
		section .area {
			width: 80%;
	        min-height: 500px;
	        margin:0 auto;
	        padding: 0px 50px;
	        background:radial-gradient(black, #304047);
	    }

        .my-slider-1 {
        margin-top:100px;
        width:660px;
        margin-left:auto;
        margin-right:auto;
        }

        .my-slider-1 .item {
        padding-top:100px;
        padding-bottom:100px;
        }

        .my-slider-1 .owl-item.active.center {
        z-index:10;
        }

        .my-slider-1 .owl-item.active.center > .item {
        margin-left:-50px;
        margin-right:-50px;
        margin-top:-80px;
        }

        .my-slider-1 > .owl-carousel.owl-theme > .owl-nav > button {
        position:absolute;
        top:50%;
        transform:translateY(-50%);
        right:calc(100% + 100px);
        }

        .my-slider-1 > .owl-carousel.owl-theme > .owl-nav > button:last-child {
        left:calc(100% + 100px);
        right:auto;
        }
        
</style>
	<section>
        <div class="area">
            <!-- 슬라이더 1 -->
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
            navText: ['<span class="glyphicon glyphicon-chevron-left"></span>',
                      '<span class="glyphicon glyphicon-chevron-right"></span>'],
            center:true
        });
        }
        MySlider1__init();
	</script>
