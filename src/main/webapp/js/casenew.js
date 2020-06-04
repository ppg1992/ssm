$(function(){
		$('.messa').click(function(){
				$('.messa').hide();
				$(".messa-s").show();
				$('#blockform').show(200);
			})
			$('.messa-s').click(function(){
				$('.messa-s').hide();
				$('.messa').show();
				$('#blockform').hide(200);
			});
			$('.radio').click(function() {
				$('.fapiao').toggle();
			});
			$('#carnumber').on('tap',function(){
				$('#platenumber').show(200);
			});
      		$('#cofor').on('tap',function(){
				$('#severs').show(200);
			});
      		$("#severs .function").on('tap',function(){
				var index = $(this).index();
				$('#severs .function').removeClass('active').eq(index).addClass('active');
				var adress = $('#cofor').html($('#severs .function').eq(index).html());
				$('#severs').hide(300);
			});
			$('#cartypesmall').on('tap',function(){
				$('#cartype').show(200);
			});
      		$('#cartype .function').on('tap',function(){
				var index = $(this).index();
				$('#cartype .function').removeClass('active').eq(index).addClass('active');
				var adress = $('#cartypesmall').html($('#cartype .function').eq(index).html());
				$('#cartype').hide(300);
			});
      		$('#platenumber .function').on('tap',function(){
				var index = $(this).index();
				$('#platenumber .function').removeClass('active').eq(index).addClass('active');
				debugger;
				var adress = $('#carnumber').html($('#platenumber .function').eq(index).html());
				$('#platenumber').hide(300);
			});
			/*详细动态*/
			$("#anjianmessage").on('tap',function(){
				 $(".messagetoase").show();
				 $(".dongtaimessage").hide();
				 $(".photoactives").hide();
				 $(".photomessage").hide();
				$("#actionfon").removeClass('mui-active');
				$("#offCanvasSide").css({
					'visibility':'visible',
					'transform': 'translate3d(-290px, 0px, 0px)'
				});
				$('#header h1').html($('#anjianmessage a').html() );
			});
			$("#dynamicinformation").on('tap',function(){
				 $(".messagetoase").hide();
				 $(".dongtaimessage").show();
				 $(".photoactives").hide();
				 $(".photomessage").hide();
				$("#actionfon").removeClass('mui-active');
				$("#offCanvasSide").css({
					'visibility':'visible',
					'transform': 'translate3d(-290px, 0px, 0px)'
				});
				$('#header h1').html($('#dynamicinformation a').html() );
			});
			$("#Jobphoto").on('tap',function(){
				 $(".messagetoase").hide();
				 $(".dongtaimessage").hide();
				 $(".photoactives").hide();
				 $(".photomessage").show();
				$("#actionfon").removeClass('mui-active');
				$("#offCanvasSide").css({
					'visibility':'visible',
					'transform': 'translate3d(-290px, 0px, 0px)'
				});
				$('#header h1').html($('#Jobphoto a').html() );
			});
			$("#photosactive").on('tap',function(){
				 $(".messagetoase").hide();
				 $(".dongtaimessage").hide();
				 $(".photomessage").hide();
				 $(".photoactives").show();
				$("#actionfon").removeClass('mui-active');
				$("#offCanvasSide").css({
					'visibility':'visible',
					'transform': 'translate3d(-290px, 0px, 0px)'
				});
				$('#header h1').html($('#photosactive a').html() );
			});
			 $('.text-area-input').click(function () {
            if ($(this).val() == '请对技师的服务进行评价，您可以提出您对我司的建议或意见') {
                $(this).css({
                    color: '#000000'
                }).val('')
            }
        });
            $('.text-area-bottom a').click(function () {
            var star = $('input[name=star]:checked').val();
            var content = $('textarea[name=content]').val();
        });
    	     $('.text-area-star label').click(function () {
            var labelLength = $('.text-area-star label').length;
            for (var i = 0; i < labelLength; i++) {
                if (this == $('.text-area-star label').get(i)) {
                    $('.text-area-star label').addClass('red');
                    $($(".textareas")[i]).show();
                } else {
                    $('.text-area-star label').eq(i).removeClass('red');
                    $($(".textareas")[i]).hide();
                }
            }
        });
			


      		
      	});