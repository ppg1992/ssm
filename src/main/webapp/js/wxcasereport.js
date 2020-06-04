$(function(){
	var appId = $('#appId').val();
	var detailed = $('#detailed').val();
	
	if (detailed == "open") {
		$('#messa').hide();
		$('#messasblock').show();
		$('#blockform').show();
	}
	
	if($('#needBill').is(':checked')){
		$('#fapiao').show();
	}
	
	var helpTimeStr = $('#helpTimeStr').val();
	helpTimeStr =  helpTimeStr.replace(" ", "T");
	$('#helpTime').val(helpTimeStr);
	
	$("#radio").on('tap',function(){
		$('#fapiao').toggle();
	});
	$('#messa').on('tap',function(){
		$('#messa').hide();
		$("#messasblock").show();
		$('#blockform').show(200);
	});
	$('#messasblock').on('tap',function(){
		$('#messa').show();
		$('#messasblock').hide();
		$('#blockform').hide(200);
	});
	
	$('#cofor').on('tap',function(){
		$('#severvices').show(200);
	});
	$("#severvices .function").on('tap',function(){
		var index = $(this).index();
		$('#severvices .function').removeClass('active').eq(index).addClass('active');
		//$('#severvices .function :input').eq(index).val();
		$('#serviceItem').val($($('#severvices .function').eq(index).children().get(1)).val());
		var adress = $('#cofor').html($('#severvices .function').eq(index).html());
		$('#severvices').hide(300);
	});
	
	$('#cartypesmall').on('tap',function(){
		$('#cartype').show(200);
	});
	$('#cartype .function').on('tap',function(){
		var index = $(this).index();
		$('#cartype .function').removeClass('active').eq(index).addClass('active');
		var adress = $('#cartypesmall').html($('#cartype .function').eq(index).html());
		$('#carType').val($($('#cartype .function').eq(index).children().get(1)).val());
		$('#cartype').hide(300);
	});
	
	$('#carnumber').on('tap',function(){
		$('#platenumber').show(200);
	});
	
	$('#platenumber .function').on('tap',function(){
		var index = $(this).index();
		$('#platenumber .function').removeClass('active').eq(index).addClass('active');
		$('#pshortName').val($.trim($('#platenumber .function').eq(index).text()));
		var adress = $('#carnumber').html($('#platenumber .function').eq(index).html());
		$('#platenumber').hide(300);
	});
			
	if ($("chooseImage_sid").val() == "") {
		alert(null);
		$("chooseImage_sid").focus();
		var el = $('#testimg').attr('src', impath);
	}
	getWxConfig();
	
	$('#startRecord').click(function() {
		$('#startRecord').hide();
		$('#stopRecord').show();
		
	});
	$('#stopRecord').click(function() {
		$('#stopRecord').hide();
		$('#startRecord').show();
		
	});
	$('#playVoice').click(function(){
		$('#playVoice').hide();
		$('#pauseVoice').show();
	});
	$('#pauseVoice').click(function(){
		$('#pauseVoice').hide();
		$('#playVoice').show();
	});
	
	$('.text-area-input').click(function () {
	    if ($(this).val() == '请对技师的服务进行评价，您可以提出您对我司的建议或意见') {
	        $(this).css({
	            color: '#000000'
	        }).val('');
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
    
	//服务项目
	if($("#severvices .active").length>0){
		$('#serviceItem').val($($("#severvices .active").children().get(1)).val());
	}
	
	if($.trim($('#serviceItem').val())!=''){
		$('#severvices .function').removeClass('active');
		var serviceItemVal=$.trim($('#serviceItem').val())+'';
		$.each($("#severvices .function"),function(i, item){
			var currserviceItem=$.trim($($(item).children().get(1)).val())+'';
			if(serviceItemVal == currserviceItem){
				$(item).addClass('active');
				$('#cofor').html($(item).html());
			}
		});
	}else{
		$('#severvices .function').removeClass('active').eq(0).addClass('active');
		$('#serviceItem').val($($('#severvices .function').eq(0).children().get(1)).val());
		$('#cofor').html($('#severvices .function').eq(0).html());
	}
	
	//车辆类型
	if($("#cartype .active").length>0){
		$('#carType').val($($("#cartype .active").children().get(1)).val());
	}
	
	if($.trim($('#carType').val())!=''){
		$('#cartype .function').removeClass('active');
		var carTypeVal=$.trim($('#carType').val())+'';
		$.each($("#cartype .function"),function(i, item){
			var currcarTypeval=$.trim($($(item).children().get(1)).val())+'';
			if(currcarTypeval == carTypeVal){
				$(item).addClass('active');
				$('#cartypesmall').html($(item).html());
			}
		});
	}else{
		$('#cartype .function').removeClass('active').eq(0).addClass('active');
		$('#cartype').val($($('#cartype .function').eq(0).children().get(1)).val());
		$('#cartypesmall').html($('#cartype .function').eq(0).html());
	}
	
	
	//车牌简称
	if($.trim($('#pshortName').val())!=''){
		$('#platenumber .function').removeClass('active');
		var pshortNameval=$.trim($('#pshortName').val())+'';
		$.each($("#platenumber .function"),function(i, item){
			var currpshortName=$.trim($(item).text())+'';
			if(currpshortName == pshortNameval){
				$(item).addClass('active');
				$('#carnumber').html($(item).html());
			}
		});
	}else{
		$('#pshortName').val('浙');
	}

});

function cleanval(id) {
	$('#' + id).val("");
}


var ctx;
function wxaddress(addressid) {
	// alert(addressid);
	ctx = $('#ctx').val();
	var addressvalue = $('#' + addressid).val();
	$('#addressvalue').val(addressvalue);
	$("#wxreportcaseform").attr("action",ctx + "/platwechat/wxaddress?addressid=" + addressid);
	$("#wxreportcaseform").submit();
}
function wxportcasesubmit() {
	
	ctx = $('#ctx').val();
	var wxreporturl = ctx + "/platwechat/sendreportcase";
	var phone = $("#phone").val();
	
	if (!$.trim(phone)) {
		mui.alert("电话号码不能为空");
		return false;
	}
	$('#loadingToast').show();
	var caseNum = $("#caseNum").val();//案件数量
	if(!$.trim(caseNum)) {
		caseNum = 1;
	}
	var serviceItem = $("#serviceItem").val();
	if(serviceItem == 14){//新车运送
		if(!$("#carNumbers").val()){
			$("#carNumbers").val("暂无");
		}
	}
	$.ajax({
		"type" : "POST",
		"url" : wxreporturl,
		"data" : $('#wxreportcaseform').serialize(),
		"dataType" : "json",
		"success" : function(data) {
			console.log(data);
			var result = data.result;
			var msg = data.msg;
			if(result == "failed") {
				$('#loadingToast').hide();
				mui.confirm('<p>'+data.msg+'</p>',"错误",['确定'],function(e){
					if(e.index==0){
						//closeWin();
					}
				});
				return;
			}
			$('#loadingToast').hide();
			if(msg) {
				mui.confirm('<p>'+msg+'</p>',"提示",['确定'],function(e){
					if(e.index==0){
						//closeWin();
					}
				});
			} else {
				mui.confirm('<p>'+"报案成功！"+'</p>',"提示",['确定'],function(e){
					if(e.index==0){
						closeWin();
					}
				});
			}
			
		},
		"error" : function(request){
			$('#loadingToast').hide();
			mui.confirm('<p>'+'系统出错,请重试！'+'</p>',"错误",['确定'],function(e){
				
			});
		}
	});

}