<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimal-ui, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>大板专线</title>
<%--     <link rel="stylesheet" href="${ctx}/static/wechat/css/mui.min.css"/> --%>
    <link rel="stylesheet" href="${ctx}/static/wechat/css/weui.css" />
<%--     <link rel="stylesheet" href="${ctx}/static/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" /> --%>
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
    <link rel="stylesheet" href="${ctx}/static/wechat/css/speedDating/report.css">
    <link rel='stylesheet' href='${ctx}/static/wechat/css/speedDating/lCalendar.css'>
    <style type= "text/css">
	#ul-info{
	    z-index: 1;
	    position: fixed;
	    width: 100%;
	    top: 82px;
	    margin:0px -27px;
	}
	#ul-info li{
		padding:3px 0;
		background: white;
	 	color:#333;
	}
	</style>
</head>
<body>
<div id="loadingSearch" class="weui_loading_toast" style="display:none;">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toast">
        <div class="weui_loading">
            <!-- :) -->
            <div class="weui_loading_leaf weui_loading_leaf_0"></div>
            <div class="weui_loading_leaf weui_loading_leaf_1"></div>
            <div class="weui_loading_leaf weui_loading_leaf_2"></div>
            <div class="weui_loading_leaf weui_loading_leaf_3"></div>
            <div class="weui_loading_leaf weui_loading_leaf_4"></div>
            <div class="weui_loading_leaf weui_loading_leaf_5"></div>
            <div class="weui_loading_leaf weui_loading_leaf_6"></div>
            <div class="weui_loading_leaf weui_loading_leaf_7"></div>
            <div class="weui_loading_leaf weui_loading_leaf_8"></div>
            <div class="weui_loading_leaf weui_loading_leaf_9"></div>
            <div class="weui_loading_leaf weui_loading_leaf_10"></div>
            <div class="weui_loading_leaf weui_loading_leaf_11"></div>
        </div>
        <p class="weui_toast_content">价格计算中，请稍后</p>
    </div>
</div>
<div id="loadingToast" class="weui_loading_toast" style="display:none;">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toast">
        <div class="weui_loading">
            <!-- :) -->
            <div class="weui_loading_leaf weui_loading_leaf_0"></div>
            <div class="weui_loading_leaf weui_loading_leaf_1"></div>
            <div class="weui_loading_leaf weui_loading_leaf_2"></div>
            <div class="weui_loading_leaf weui_loading_leaf_3"></div>
            <div class="weui_loading_leaf weui_loading_leaf_4"></div>
            <div class="weui_loading_leaf weui_loading_leaf_5"></div>
            <div class="weui_loading_leaf weui_loading_leaf_6"></div>
            <div class="weui_loading_leaf weui_loading_leaf_7"></div>
            <div class="weui_loading_leaf weui_loading_leaf_8"></div>
            <div class="weui_loading_leaf weui_loading_leaf_9"></div>
            <div class="weui_loading_leaf weui_loading_leaf_10"></div>
            <div class="weui_loading_leaf weui_loading_leaf_11"></div>
        </div>
        <p class="weui_toast_content">报案中，请稍后</p>
    </div>
</div>
<div id="wrap">
	<input type="hidden" id="ctx" value="${ctx}" />
	<form id="wxreportcaseform" action="#" method="post">
		<input type="hidden" id="appId" name="appId" value="${wechatInfo.appId}" /> 
		<input type="hidden" id="wechatinfoId" name="wechatinfoId" value="${weChatData.wechatinfoId}" /> 
		<input type="hidden" id="pid" name="pid" value="${wechatInfo.pid}" />
		<input type="hidden" id="weChatUserId" name="weChatUserId" value="${weChatData.weChatUserId}" /> 
	    <input type="hidden" id="detailed" name="detailed" value="${detailed}" /> 
		<input type="hidden" id="rescueCity" name="rescueCity" value="${weChatData.rescueCity}" />
		<input type="hidden" id="rescueLatitude" name="rescueLatitude" value="${weChatData.rescueLatitude}" /> 
		<input type="hidden" id="rescueLongitude" name="rescueLongitude" value="${weChatData.rescueLongitude}" /> 
		<input type="hidden" id="desCity" name="desCity" value="${weChatData.desCity}" />
		<input type="hidden" id="desLatitude" name="desLatitude" value="${weChatData.desLatitude}" /> 
		<input type="hidden" id="desLongitude" name="desLongitude" value="${weChatData.desLongitude}" /> 
		<input type="hidden" id="helpTimeStr" value="${weChatData.helpTime}" />
		<input type="hidden" id="customeIndex" name="customeIndex" value="${wechatUser.customeIndex}" /> 
		<input type="hidden" id="caseMark" name="caseMark" value="1" />
		<input type="hidden" id="addressvalue" name="addressvalue" value="${weChatData.addressvalue}"/>
		<input type="hidden" id="customStatus" name="customStatus" value="${customStatus}"/>
		
		
		 <!-- <input type="hidden" id="weChatUserId" name="weChatUserId" value="9" />  
		<input type="hidden" id="appId" name="appId" value="wxd10395e1e5441090" /> 
		<input type="hidden" id="pid" name="pid" value="31" /> -->
    <div class="item">
        <em class="icon border-radius gray">项</em>
        <span class="item-title">服务项目</span>
        <i class="arrow fr">&gt;</i>
       <!-- <span class="item-name fr">拖车--故障</span>-->
        <select class="item-name fr" id="serviceItem" name="serviceItem" >
          	<option value ="">请选择服务项目</option>
          	<c:forEach items="${serTypejson}" var="sel">
				<c:if test="${sel.id == '14'}"> <!-- 新车运送 -->
					<option selected="selected" value="${sel.id}">${sel.text}</option>
				</c:if> 
				<c:if test="${sel.id == '15'}"> <!-- 二手车 -->
					<option value="${sel.id}">${sel.text}</option>
				</c:if> 
				<c:if test="${sel.id == '8'}"> <!-- 拖车事故 -->
					<option value="${sel.id}">${sel.text}</option>
				</c:if> 
				<c:if test="${sel.id == '1'}"> <!-- 拖车故障 -->
					<option value="${sel.id}">${sel.text}</option>
				</c:if> 
			</c:forEach>
        </select>
    </div>
    <div class="content">
        <h2 class="report-title"><em class="icon border-radius red icon-half icon-box-shadow">案</em>报案信息</h2>
        <ul class="report-intro" id="report-intro-ul">
            <li class="report-list">
            	<span class="fl">车辆类型</span><i class="arrow fr">&gt;</i>
                <select class="fl input" id="carType" name="carType">
	                <c:forEach items="${carTypejson}" var="sel">
						<c:choose>
							<c:when test="${sel.id == '1'}">
								<option selected="selected" value="${sel.id}">${sel.text}</option>
							</c:when>
							<c:otherwise>
								<option value="${sel.id}">${sel.text}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
                </select>
            </li>
            <li class="report-list date" style="height: 6em;">
				<p>
					<span class="fl">预约时间</span>
					<input id="reserveTimeStart" name="reserveTimeStart"  class="fl input" type="text" readonly="" value=""  placeholder="前选择预约时间"  />
				</p>
				<p>
					<span class="fl">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至</span>
					<input id="reserveTimeEnd" name="reserveTimeEnd" class="fl input" type="text" readonly="" value="" placeholder="后选择预约时间"  />
				</p>
           	</li>
           	<li class="report-list car"  >
				<span class="fl">车架号码</span>
				<input class="fr input" id="carFrameNumber" name="carFrameNumber" value="" placeholder="请输入车架号码"/>
   			</li>
           <%--  <li class="report-list car">
            	<span class="fl">车牌号码</span>
            	<div class="fl input" id="pn">
            		<input type="text" readonly="" class="province fl"  name="pshortName" value = '浙' id="T-province" />
	    			<input class="input fr plate_number" maxlength="7" name="carNumbers" value="${weChatData.carNumbers}" placeholder="请输入车牌号码" required onkeyup="this.value=this.value.toUpperCase()"/>
            	</div>
			</li> --%>
			<li class="report-list bd0">
            	<span class="fl">案件数量</span>
            	<span class="fl input case-number">
            		<em class="fl sub">-</em>
            		<input class="fl input" id="case_number" name=caseNum  readonly="" type="number" value="1" />
            		<em class="fl add">+</em>
            	</span>
            </li>
            <li class="report-list">
				<span class="fl">备注内容</span>
				<input class="fr input" id="remark" name="remark" value="" placeholder="请输入备注信息"/>
			</li>
        </ul>
        <ul class="province_center">
			<li>京</li><li>津</li><li>冀</li><li>晋</li><li>蒙</li><li>辽</li><li>吉</li><li>黑</li><li>沪</li><li>苏</li><li>浙</li>
			<li>皖</li><li>闽</li><li>赣</li><li>鲁</li><li>豫</li><li>鄂</li><li>湘</li><li>粤</li><li>桂</li><li>琼</li><li>渝</li>
			<li>川</li><li>黔</li><li>云</li><li>藏</li><li>陕</li><li>甘</li><li>青</li><li>宁</li><li>新</li><li>台</li><li>港</li><li>澳</li>
		</ul>
        <p class="clear"><p>
        <div id="datePlugin"></div>
    </div>
	<div class="content mtop4">
		<h2 class="report-title"><em class="icon border-radius blue icon-half icon-box-shadow">交</em>移交信息</h2>
		<!--送-->
		<div class="my-item">
			<em class="icon border-radius blue">提</em>
			<ul class="report-intro report-intro1 clearfix pb1">
				<li class="report-list">
					<input class="fl input" id="rescueLinkman" name="rescueLinkman" value="" placeholder="请输入提车人姓名" />
				</li>
				<li class="report-list">
					<input class="fl input" id="rescuePhone" name="rescuePhone" oninput="value=value.replace(/[^\d\s]/ig,'')" value="" placeholder="请输入提车人电话"/>
				</li>
				<li class="report-list">
					<input class="fl input" id="location" name="rescueAddress" readonly data-local="" value="" placeholder="请选择作业地点"/>
				</li>

			</ul>
		</div>
		<div class="my-item">
			<em class="icon border-radius red">接</em>
			<ul class="report-intro report-intro1 clearfix pb1">
				<li class="report-list">
					<input class="fl input" id="desLinkman" name="desLinkman" value="" placeholder="请输入接车人姓名" />
				</li>
				<li class="report-list">
					<input class="fl input" id="desPhone" name="desPhone" oninput="value=value.replace(/[^\d\s]/ig,'')" value="" placeholder="请输入接车人电话"/>
				</li>
				<li class="report-list">
					<input class="fl input destination" id="desAddress" name="desAddress" data-local="" readonly value="" placeholder="请选择目的地" />
				</li>

			</ul>
		</div>
	</div>
	<div class="footer">
        <div class="item">
			<h4 class="footer-title">预计价格</h4>
			<div class="price-content clearfix">
				<div class="left-price fl border-radius">
					<p class="price">¥<span class="gzresult">0</span>起</p>
					<p class="price-info">正常价格</p>
				</div>
				<div class="log fl">&nbsp;&nbsp;》</div>
				<div class="right-price fr border-radius">
					<p class="price"><span>2折</span>起</p>
					<b class="price-flag border-radius">大板专线</b>
				</div>
			</div>
			<div class="read">
				<input type="checkbox" name="is_default" id="is_default" maxlength="20" align="absbottom" value="1">
				<span>我已阅读</span><%-- <a href="${ctx}/static/wechat/word/capacityMatch.doc">《元通救援力速配服务协议》</a> --%>
				<a href="javascript:void" id="seeAgreement">《元通救援运力速配服务协议》</a>
				<p class="submit wxSubmit">提     交</p>
        </div>
    </div>
</div>
<!--弹出框-->
<div class="mask">
	<div class="bg"></div>
	<div class="mask-con border-radius">
		<p class="mask-txt">如果没有按照预约时间匹配到车辆如何处置？</p>
		<p class="mask-choice fl">
			<input type="radio" name="reserveOpType" id="original" align="absbottom" value="1" checked="">
			<span>正价处理</span>
		</p>
		<p class="mask-choice fl">
			<input type="radio" name="reserveOpType" id="cancel" align="absbottom" value="2">
			<span>取消案件</span>
		</p>
		<p class="submit wxportCaseSubmit">确     定</p>
	</div>
</div>
<div class="layer">
	<div id="container"></div>
	<div class="info">
		<div>
			<h4>您选择的位置</h4>
			<!-- <input type="text" id="searchInput" placeholder="请输入您的位置">
			<input type="button" value="地址" class="addressButton" id="addressButton" style="position: fixed;top: 2em;right: 2%;width: 12%;height: 3em;"> -->
			<input type="text" id="searchInput" placeholder="请输入您的位置">
			<ul id="ul-info"></ul>
			<input type="button" value="默认地址" class="addressButton" id="addressButton" style="position: fixed;top: 2em;right: 2%;width: 20%;height: 3em;border: 1px solid #ced4da;color:#8086FF;">
	    	<ul class="addressUl" style="position: fixed;top: 6em;right: 2%;width: 96%;background-color: #FFF;display: none;font-size: 14px;line-height: 2;">
				<c:forEach items="${platWechatAddressList}" var="sel">
					<li onclick="address('${sel.detailed}',${sel.latitude},${sel.longitude})">${sel.detailed }</li>
				</c:forEach>
			</ul>
	    	<span id="map-center"></span>
		</div>
		<span class="layer-btn choose-btn">确定</span>
		<span class="layer-btn destination-btn">确定</span>
	</div>
	<!--<div id="panel"></div>-->
</div>   
</form>
<div id="panelDiv"></div> 
<div id="layerAgreement">
	<p class="closeAgreement">×</p>
	<div class="agreementCon">
		<h3>顺风车及大板车运输服务注册协议</h3>
		<p>欢迎您访问并选用“元通救援”saas系统平台！本注册协议(以下简称"本协议")是您与“元通救援”平台服务的相关事宜所订立的协议。</p>
		<p>为了保障您（此处的您和在下文中出现的用户或接受本协议已经注册的会员、托运服务提供方，均为同一含义且混用）的权益, 请在使用“元通救援”平台之前, 详细阅读本协议所有内容，您一经创建元通救援账户即表示您同意我们的服务，本协议即构成对双方具有约束力的法律文件（您的使用、账户获取和登陆等行为将视为同意并接受本协议内容各项条款的约束）；阅读本协议过程中，如您不同意本协议或其中任何条款的约定，您应立即停止注册或/和使用服务程序。</p>
<p>“元通救援”系统平台（简称“平台”）：是由浙江元通汽车救援服务有限公司开发并运行的，包括官网（http://www.yuantongjy.com）、官方客服电话0571-96296、第三方网页链接、微信、短消息等在内的综合信息平台，可以向用户（或托运服务提供方、您、承运人）提供汽车托运信息以及获取信息的途径。</p>
<p>我们的服务：在我们的平台，用户可以实现发布和（或）获取汽车托运需求信息,以及与托运相关的订单记录、费用结算、体验评价等活动。</p>

<p>托运服务提供方（元通救援平台下属所有运输车辆）：通过平台发布车辆运输信息或/并通过该平台接受托运方（托运服务使用方）的委托，提供运输服务的一方。</p>

<p>托运服务使用方（托运人、客户）：通过平台发布车辆运输信息或/并通过该平台委托承运商（托运服务提供方）运输货物的一方。</p>

<p>重要提示</p>

<p>1.1在使用“元通救援”平台的服务之前，请您务必认真阅读本《注册协议》（以下简称“本协议”），并充分理解各条款内容，特别是涉及免除或限制责任条款。当用户进入“元通救援”平台，接受或使用平台各项服务时，即表示用户已知悉并同意本协议的全部内容，如用户不同意本协议中任何条款，应当立即停止使用。本协议对用户具法律约束力，特别是违约条款，用户的注册视为自愿按本协议约定内容执行。</p>

<p>1.2元通救援”平台是浙江元通汽车救援服务有限公司拥有合法权益的，为使用元通救援运输业务的使用方和服务提供方提供相关信息技术服务的网络平台。您应认真阅读、充分理解本协议中各条款,特别涉及免除或者限制本公司责任的免责条款,对您的权利限制的条款约定争议解决方式、司法管辖、法律适用的条款。</p>

<p>1.3注册资格：请您审慎阅读并充分理解本协议的内容以及”元通救援”平台公布的所有相关协议、规则等文件。用户必须具备完全民事行为能力才能使用平台服务。如您不具有完全民事行为能力,请您在法定监护人的陪同下阅读。注册成为元通救援”平台用户以及使用平台提供的托运信息服务即视为接受前述文件以及元通救援”平台对前述文件的不时修改、删减及增加。</p>

<p>1.4注册信息的保管与使用：用户注册成功后，本公司将给予每个用户一个用户账号，该账号归本公司所有，用户完成申请、注册等手续后，获得该账号的使用权。账号使用权仅属于初始申请注册人，初始申请注册人不得赠与、借用、租用、转让或售卖该账号或者以其他方式许可非初始申请注册人使用该账号。用户承担账号、账号注册信息与密码的保管责任，并就其账号及密码项下的一切行为承担法律责任。</p>

<p>1.5我们的用户：依法具有完全行为能力的自然人或法人，在平台提供托运服务的用户（在本协议中简称“用户”或“托运服务提供方”）。</p>

<p>一.托运服务提供方的使用规则</p>

<p>1.1 托运服务提供方应确保其所属的公司是依据中华人民共和国法律注册成立的，并具有道路运输资格，如情况出现变化，应及时通知我公司。</p>

<p>1.2 托运服务提供方应确保提供个人信息真实有效，并持有合法取得的驾驶运输车辆的驾驶证，如情况出现变化，应及时通知我公司。</p>

<p>1.3 托运服务提供方应确保提供的运输车辆信息真实有效，运输车辆主体及使用权归属其所属公司所有并通过合法渠道获得，如情况出现变化，应及时通知我公司。</p>

<p>1.4 托运服务提供方应慎重保密好自己的账号及密码等资料，不应将其账号、密码转让、出借或以任何脱离其控制的形式交由他人使用或向他人泄露。如用户发现账号遭他人非法使用，应立即通知我公司。 因黑客行为或用户的保管疏忽导致账号、密码等遭他人非法使用的，我公司不承担任何责任。</p>

<p>1.5托运服务提供方应当为其注册的账户下的一切行为负责，因自身行为导致的自已或其他任何第三方的任何损失或损害，我公司不承担责任。</p>

<p>1.6托运服务提供方在注册成为用户时已充分理解并接受平台提供的服务中可能包括广告，并自愿同意在使用过程中显示我公司和第三方供应商、合作伙伴提供的广告。</p>

<p>1.7托运服务提供方不得在本平台任何页面发布、转载、传送含有以下内容之一的信息，否则我公司有权自行处理，并取消其用户资格。</p>

<p>（1）违反宪法确定的基本原则；</p>

<p>（2）危害国家安全，泄露国家机密，颠覆国家政权，破坏国家统一；</p>

<p>（3）煽动民族仇恨，民族歧视，破坏民族团结；</p>

<p>（4）破坏国家宗教政策，宣扬邪教、封建迷信；</p>

<p>（5）散布谣言，扰乱社会秩序，破坏社会稳定；</p>

<p>（6）散步淫秽、色情、赌博、暴力、恐怖或者教唆犯罪；</p>

<p>（7）侮辱或者诽谤他人，侵害他人合法权益；</p>

<p>（8）煽动非法集会、结社、游行、示威、聚众扰乱社会秩序；</p>

<p>（9）发布广告或其他商业行为的内容；</p>

<p>（10）含有法律、行政法规禁止的其他内容。</p>

<p>二.平台服务内容</p>

<p>托运服务提供方应在成为用户时即充分理解并自愿接受以下内容：</p>

<p>2.1元通救援”平台向您提供托运服务使用方的相关信息,包括但不限于用户姓名、联系方式、托运货物信息等,并同时向托运服务使用方提供您的姓名、联系方式、车辆信息等，以便促成您与托运服务使用方之间达成车辆运输服务。</p>

<p>2.2您可以免费使用元通救援平台的程序。我们保留就程序和或服务向您收费的权利，如果您拒绝支付相关费用，则我们有权不向您提供该等收费服务，并允许您选择继续履行或终止本协议。</p>

<p>2.3您同意并确认,本公司仅提供相关的网络服务除此之外与相关网络服务有关的设备(如个人计算机、手机、其他与接入互联网或移动网有关的装置)及第三方收取的相关费用(如为接入互联网而支付的电话费及上网费、为使用移动网而支付的手机费)均应由您自行负担。</p>

<p>三.服务变更、中断或终止</p>

<p>3.1 鉴于网络服务的特殊性，您同意并认可我公司有权根据业务发展情况随时变更、中断或终止部分或全部的网络服务而无需通知用户，也无需对任何用户或任何第三方承担任何责任；</p>

<p>3.2用户理解并认可，我公司需要定期或不定期地对提供网络服务的平台（如互联网网站、移动网络等）或相关的设备进行检修或者维护，如因此类情况而造成网络服务在合理时间内的中断，我公司无需为此承担任何责任，但我公司应尽可能事先进行通告。</p>

<p>3.3 如发生下列任何一种情形，我公司有权随时中断或终止向用户提供本协议项下的网络服务（包括收费网络服务）而无需对用户或任何第三方承担任何责任：</p>

<p>（1）用户提供的个人资料不真实；</p>

<p>（2）用户存在“元通救援”平台判定的属于恶意扰乱平台秩序的行为；</p>

<p>（3）用户违反本协议中规定的使用规则。</p>

<p>四. 知识产权</p>

<p>4.1 平台提供的网络服务中包含的任何文本、图片、图形、音频和/或视频资料均受版权、商标和/或其它财产所有权法律的保护，未经相关权利人同意，任何人均不得上述资料均用于任何商业目的。</p>

<p>4.2 平台为提供网络服务而使用的任何软件（包括但不限于软件中所含的任何图象、照片、动画、录像、录音、音乐、文字和附加程序、随附的帮助材料）的一切权利均属于该软件的著作权人，未经该软件的著作权人许可，任何人均不得对该软件进行反向工程（reverse engineer）、反向编译（decompile）或反汇编（disassemble）。</p>

<p>4.3 用户若侵犯上述知识产权的，则我公司或其他相关权利人均有权向用户主张侵权责任，并要求其赔偿相应损失。</p>

<p>五. 隐私保护</p>

<p>5.1 保护用户隐私是我公司的一项基本政策，我公司保证不对外公开或向第三方提供单个用户的注册资料及用户在使用网络服务时存储在我公司的非公开内容，但下列情况除外：</p>

<p>（1）事先获得用户的明确授权，要求提供或公开的；</p>

<p>（2）根据有关的法律法规要求必须提供或公开的；</p>

<p>（3）按照相关政府主管部门的要求必须提供或公开的；</p>

<p>（4）为维护社会公众的利益，经相关部门要求提供或公开的；</p>

<p>（5）为维护我公司的合法权益，需向第三方提供或公开的情况。</p>

<p>5.2 我公司可能会与第三方合作向用户提供相关的网络服务，在此情况下，如该第三方同意承担与我公司同等的保护用户隐私的责任，则我公司有权将用户的注册资料等信息提供给该第三方。</p>

<p>5.3 在不透露单个用户隐私资料的前提下，我公司有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。</p>

<p>5.4 我公司制定了以下四项隐私权保护原则，指导我们如何来处理产品中涉及到用户隐私权和用户信息等方面的问题：</p>

<p>（1） 利用我们收集的信息为用户提供有价值的产品和服务；</p>

<p>（2） 开发符合隐私权标准和隐私权惯例的产品；</p>

<p>（3） 将个人信息的收集透明化，并由权威第三方监督；</p>

<p>（4） 尽最大的努力保护我们掌握的信息。</p>

<p>六. 托运服务提供方的质量保证要求及承诺</p>

<p>6.1 托运服务提供方须保证在运输途中的操作符合正规流程，不出现危险操作、恶意操作、非专业人员操作等一系列可能导致质量风险增加的行为，其明显失当的操作行为所造成的一切后果（包括赔偿责任等）将由其自行承担。</p>

<p>6.2 托运服务提供方需验收托运车辆并保证被运输车辆及物品的完整性，包括车辆零件、内饰配件、加装配件、消防器材、备用轮胎以及其他随车附带物品的完好。如发现由于运输途中由托运服务提供方人为原因造成的损坏或遗失，我公司或/和托运使用方有权要求托运服务提供方按物品原价进行赔偿，如因此给我公司造成损失，我公司保留追究托运服务提供方赔偿的法律责任。。</p>

<p>6.3 我公司有权要求托运服务提供方对被运输车辆状态异常波动做出合理解释，被运输车辆状态包括但不局限于：公里数、燃油量。</p>

<p>6.4 托运服务提供方在运输过程中所产生的闯红灯、超速以及其他的过失行为等所导致的道路罚款、扣分、被运输车辆无法正常交接等所产生的后果，均由托运服务提供方自行承担。如因此给我公司造成损失，我公司保留追究托运服务提供方赔偿的法律责任。</p>

<p>七. 违约责任</p>

<p>7.1 订单生成后，若接单的托运服务提供方（或其司机）未征得平台同意，单方面转让订单，则视为托运服务提供方（及其司机）违约。我公司有权根据托运服务提供方的违约情节收取相应额度的违约金，托运服务提供方（或其司机）应承担因此可能给托运服务使用方造成的任何损失。</p>

<p>7.2 订单生成后，如发生不可抗力导致托运服务提供方（或其司机）预期无法满足订单要求或因托运服务提供方内部调整等原因导致订单无法进行，在征得付款方（托运服务使用方）同意后，可以通知我公司取消或更改订单。</p>

<p>7.3 订单生成后，若托运服务提供方（及其司机）未征得平台同意的情况下，未完成订单或直接放弃订单的，则视为托运服务提供方（及其司机）违约，我公司有权根据托运服务提供方的违约情节收取相应额度的违约金，托运服务提供方（或其司机）应承担因此可能给托运服务使用方造成的任何损失。</p>

<p>7.4订单生成后，因托运服务使用方单方取消订单给其造成的任何损失，托运服务提供方应向托运服务使用方主张赔偿，平台予以协助。</p>

<p>八. 免责声明</p>

<p>8.1 用户明确同意其使用本公司网络服务所存在的风险将完全由其自己承担，因其使用本公司网络服务而产生的一切后果也由其自己承担,本公司对用户不承担任何责任。</p>

<p>8.2 我公司不担保网络服务一定能满足用户的要求，也不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。</p>

<p>8.3 我公司不保证为向用户提供便利而设置的外部链接的准确性和完整性，同时，对于该等外部链接指向的不由我公司实际控制的任何网页上的内容，我公司不承担任何责任。请用户做到审慎注意义务，以区分其使用的是否为我公司真实平台。</p>

<p>8.4 对于因电信系统或互联网网络故障、计算机故障或病毒、信息损坏或丢失、计算机系统问题或其它任何不可抗力原因而产生损失，我公司不承担任何责任，但将尽力协助用户以减少用户因此造成的损失和影响。</p>

<p>8.5用户同意,“元通救援”平台所提供的功能受制于我国的交通法律法规和管理条例,即与本产品的功能和条例发生冲突时,应以各地的交通法律法规和管理条例为最高准则。任何通过“元通救援”运输服务平台服务直接或间接违反当地交通法律法规和管理条例的行为,该后果应由用户承担。如有举证需要,本公司可以向有关部门提供相关资料作为证据。</p>

<p>8.6用户理解安全驾驶的重要性,且保证在任何可能引起安全隐患的情况下均不得使用“元通救援”平台,并同意一切因使用“元通救援”平台服务而导致的安全隐患和因此产生的纠纷和和交通事故,均应由托运服务提供方及司机用户承担责任,本公司概不负责赔偿。如有举证需要,本公司可以向有关部门提供相关资料作为证据。</p>

<p>8.7运费结算：为确保平台信息的客观性、严肃性。用户的运费结算由我公司负责。如我们使用第三方电子支付服务供应商(以下简称“电子支付服务商"),将您的第三方电子支付账户关联到您在“元通救援”的个人帐户。处理您使用服务相关的付款时,除了受到本协议的约束之条款和政策的约束。我们对于电子支付服务商或银行发生的错误不承担责任。我们将获取与您使用服务相关的特定交易明细。在使用这些信息时我们将严格遵守相关法律法规和公司的各项政策。</p>

<p>九.协议修改</p>

<p>9.1 我公司有权随时修改本协议的任何条款，一旦本协议的内容发生变动，本公司将会直接在我公司网站上公布修改之后的内容，该公布行为视为我公司已经通知用户修改内容。同时我公司也可通过其他适当方式向用户提示修改内容。</p>

<p>9.2 如果不同意本公司对本协议相关条款所做的修改,用户应当停止使用网络服务。如果用户继续使用网络服务,则视为用户接受本公司对本协议相关条款所做的修改，并自愿受其约束。</p>

<p>十.通知送达</p>

<p>10.1 本协议项下我公司对于用户所有的通知均可通过平台或其他与之相关的网页公告、电子邮件、手机短信或常规的信件传送等方式进行，该等通知于发送之日视为已送达收件人。如常规信件的，用户默认其填写的地址为唯一收信地址。</p>

<p>10.2 用户对于我公司的通知应当通过我公司对外正式公布的通信地址、传真号码、电子邮件地址等联系信息进行送达。该等通知以我公司实际收到日为送达日。</p>

<p>十一.法律管辖</p>

<p>11.1 本协议的订立、成立、生效、履行、解释及争议的解决均应符合我国法律及其他相关规定。</p>

<p>11.2 与本协议有关的或由本协议引起的任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向我公司所在地的人民法院提起诉讼。</p>

<p>十二.其他规定	</p>

<p>12.1 用户在我公司平台相应网页上点击与“已阅读并同意接受本协议制约”等相类似的选项且完成了账户注册的，视为用户与我公司正式签订了本协议，即构成用户与我公司对本协议之约定事项的完整、一致的合议，用户应严格遵守本协议的内容，并履行相应义务。</p>

<p>12.2 如本协议中的任何条款无论因何种原因导致部分无效或不具有执行力的，其余条款仍继续有效并对用户具有约束力。</p>

<p>12.3 本协议的所有标题仅仅是为了醒目及阅读方便，本身并无实际涵义，不能作为本协议涵义解释之依据。	</p>
	</div>
</div>  
<%-- <script src="${ctx}/static/wechat/js/mui.min.js"></script> --%>
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.12&key=ff1fefcaeeade810ed7b37c9770eb0ab&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Geocoder,AMap.Geolocation"></script>
<!-- <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=0940ad2955c9bf7146da628dae5d523a"></script> -->
<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
<!-- <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"> </script> -->
<script src="${ctx}/js/wxjssdk.js" type="text/javascript"></script>
<script type="text/javascript">

//初始化地图
var map = new AMap.Map('container', {
      resizeEnable: true, //是否监控地图容器尺寸变化
      zoom: 13, //初始地图级别
      center: [120.133663,30.282123], //初始地图中心点
    });
//获取输入提示信息
var resultarray;
function autoInput() {
	var keywords = document.getElementById("searchInput").value;
	AMap.plugin('AMap.Autocomplete', function() {
		// 实例化Autocomplete
		var autoOptions = {
			city: '全国'
		}
		var autoComplete = new AMap.Autocomplete(autoOptions);
		autoComplete.search(keywords, function(status, result) {
			// 搜索成功时，result即是对应的匹配数据
			$("#ul-info").empty();
			resultarray = new Array();
			var con = 0;
			if(result.info == "OK") {
				$.each(result.tips, function(i, item) {
					if(item.id != "") {
						$("#ul-info").append("<li onclick="+"addressDetail('"+item.id+"')><p style = 'font-size:12px;height:16px;text-indent:10px;line-height:16px'>"+item.name+"</p><p style = 'font-size:12px;height:16px;text-indent:10px;line-height:16px;color:#c1c1c1'>"+item.district+item.address+"</p></li>");
						resultarray[con] = item;
						con++;
					}
				});
			}else{
				$("#ul-info").append("<li>没有数据</li>");
			}
		})
	})
}
function addressDetail(id){
	$.each(resultarray, function(i, item) {
		if(id == item.id){
			onComplete(item.district+item.address+item.name,item.location);
			$("#ul-info").empty();
			$("#searchInput").val('');
			return false;
		}
	});
}
document.getElementById("searchInput").oninput = autoInput;
 //解析定位结果
    function onComplete(address,latlng) {       
		document.querySelector("#map-center").innerText = address;
		document.querySelector("#map-center").setAttribute("data-local",latlng.lat+','+latlng.lng);
		marker.setPosition([latlng.lng,latlng.lat]); //更新点标记位置
		map.setCenter([latlng.lng,latlng.lat]); //设置地图中心点
    }
    //解析定位错误信息
    function onError(data) {
    	alert("定位失败,请手动搜索定位");
    }



map.plugin('AMap.Geolocation', function() {
  var geolocation = new AMap.Geolocation({
	  	enableHighAccuracy: true, //是否使用高精度定位，默认:true
		timeout: 10000, //超过10秒后停止定位，默认：无穷大
		maximumAge: 0, //定位结果缓存0毫秒，默认：0
		convert: true, //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
		showButton: true, //显示定位按钮，默认：true
		buttonPosition: 'LB', //定位按钮停靠位置，默认：'LB'，左下角
		buttonOffset: new AMap.Pixel(10, 20), //定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
		showMarker: false, //定位成功后在定位到的位置显示点标记，默认：true
		showCircle: false, //定位成功后用圆圈表示定位精度范围，默认：true
		panToLocation: true, //定位成功后将定位到的位置作为地图中心点，默认：true
		zoomToAccuracy: true //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
  })

    map.addControl(geolocation);
	geolocation.getCurrentPosition(function(status,result){
		if(status=='complete'){
			document.getElementById("location").value = result.formattedAddress;
			document.getElementById("location").setAttribute("data-local",result.position.lat+','+result.position.lng);
			onComplete(result.formattedAddress,result.position)
		}else{
			onError(result)
		}
	});
})

 // 实例化点标记
	var geocoder;
	var marker = new AMap.Marker({
		position: map.getCenter(),
		offset: new AMap.Pixel(-13, -30),
        // 设置是否可以拖拽
	    cursor: 'move',
	});
	marker.src = "//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-red.png";
	map.add(marker);
  //无法定位默认给个位置
    /*function defaultMarker(){
  	  	var center = map.getCenter().toString();
  	    geocoder = new AMap.Geocoder({
  			radius: 1000,
  			extensions: "all"
  		});
  		geocoder.getAddress(center, function(status, result) {
  			if(status === 'complete' && result.info === 'OK') {
  				geocoder_CallBack(result);
  			}	
  		});
  		marker = new AMap.Marker({ //加点
  			map: map
  		});
  		marker.src = "//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-red.png";
  		map.add(marker);
  		//map.setFitView();
    }
  	function geocoder_CallBack(data) {
  		document.getElementById("location").value = data.regeocode.formattedAddress;
  		var poi = map.getCenter().toString().split(',');
  		document.getElementById("location").setAttribute("data-local",poi[1]+','+poi[0]);
  		document.querySelector("#map-center").innerText = data.regeocode.formattedAddress;
  		document.querySelector("#map-center").setAttribute("data-local",poi[1]+','+poi[0]);
  		//var address = data.regeocode.formattedAddress; //返回地址描述
  		//document.getElementById("result").innerHTML = address;
  	}
*/

</script>
</body>
<script src="${ctx}/static/wechat/js/speedDating/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/static/wechat/js/speedDating/lCalendar.js" type="text/javascript" charset="utf-8"></script>
<script>
// mui.init();
$(function(){
//初始状态值
var count = 1,$plateObj; 
var plateHtml = '<li class="report-list car"  ><span class="fl">车牌号码</span>'+
           			'<div class="fl input" id="pn">'+
           				'<input type="text" readonly="" class="province fl" name="pshortName"  value = "浙" id="T-province"  />'+
    					'<input class="input fr plate_number" maxlength="7" name="carNumbers" value="" placeholder="请输入车牌号码" required onkeyup="this.value=this.value.toUpperCase()"/>'+
           			'</div>'+
           		'</li>';
var plateHtml2 = '<li class="report-list car"  >'+
					'<span class="fl">车架号码</span>'+
					'<input class="fr input" id="carFrameNumber" name="carFrameNumber" value="" placeholder="请输入车架号码"/>'+
       			'</li>';
//选择日期
   var calendardatetime = new lCalendar();
	calendardatetime.init({
		'trigger': '#reserveTimeEnd',
		'type': 'datetime'
	});
    var calendardatetime = new lCalendar();
    calendardatetime.init({
        'trigger': '#reserveTimeStart',
        'type': 'datetime'
    });
    $("#reserveTimeStart").attr('value',getNowFormatDate(1000 * 60 * 720));
    $("#reserveTimeEnd").attr('value',getNowFormatDate(1000 * 60 * 1440));
   /*  $("#reserveTimeEnd").on('blur',function(){
    	console.log($("#reserveTimeEnd"))
    	tab($("#reserveTimeStart").val(),$("#reserveTimeEnd").val());
    }); */
//选择作业地址
	$("#location").on('click',function(){
		$('.layer').show();
		$('.choose-btn').show();
		$(".destination-btn").hide();
	});
    $("#addressButton").on('click',function(){
		$('.addressUl').show();
	});
    $("#searchInput").on('click',function(){
		$('.addressUl').hide();
	});
//选择目的地
	$("#desAddress").on('click',function(){
		if(!$("#serviceItem").val()){
	    	return alert('请选择服务项目！');
	    }
		$('.layer').show();
		$(".destination-btn").show();
		$('.choose-btn').hide();
	});
//关闭地图
	$(".choose-btn").on('click',function(){
		$('.layer').hide();
		$("#location").val($("#map-center").html()).attr('data-local',$("#map-center").attr('data-local'));
		if($("#desAddress").attr("data-local")){
			distance();
		}
	});
	$(".destination-btn").on('click',function(){
		$('.layer').hide();
		$("#desAddress").val($("#map-center").html()).attr('data-local',$("#map-center").attr('data-local'));
		distance();
	});
	
	//减去案件数量
	$(".sub").on('click',function(){
		if(count>1){
			count --;
			$(".report-list.bd0").prev(".report-list").remove();
		}
		$("#case_number").val(count)
	})
//加上案件数量
/* var plate_area='$(".province").eq(0).html()'; */
	$(".add").on('click',function(){
		if(count < 10){
			count ++;
			$("#case_number").val(count);
			var serviceItem = $("#serviceItem").val();
			if(serviceItem == 14 || serviceItem == 15){
				$(".report-list.bd0").before(plateHtml2);
			}else{
				$(".report-list.bd0").before(plateHtml);
			}
			/* plate_area = plate_area+","+$(".province").eq(count-2).html(); */
		}
	})	
	
//关闭车辆如何处置浮层
    $(".mask .submit").on('click',function(){
		$('.mask').hide();
	});
    
    $("#serviceItem").on('change',function(){
     	$("[class='report-list car']").remove();
    	var serviceItem = $("#serviceItem").val();
    	if($("#location").val() && $("#desAddress").val() && serviceItem){
    		distance();
    	}
    	var str ='';
    	for(var i = 0 ; i < count ; i++){
	    	if(serviceItem == 14 || serviceItem == 15){
	    		str	+= '<li class="report-list car"><span class="fl">车架号码</span>';
	    		str += '<input class="fr input" id="carFrameNumber" name="carFrameNumber" value="" placeholder="请输入车架号码"/></li>';  		
	    	}else{
	    		str	+= '<li class="report-list car"><span class="fl">车牌号码</span>'+
       			'<div class="fl input" id="pn">'+
       				'<input type="text" readonly="" class="province fl" name="pshortName"  value = "浙" id="T-province"  />'+
					'<input class="input fr plate_number" maxlength="7" name="carNumbers" value="" placeholder="请输入车牌号码" onkeyup="this.value=this.value.toUpperCase()"/>'+
       			'</div>'+
       			'</li>';	
	    	}
    	}
    	$(".report-list.bd0").before(str);
    });
    
  //选择车牌号
	$('.report-intro').on('click','.province',function(){
		$plateObj = $(this);
		$('.province_center').show().animate({"bottom":0},300);
	});
	$('.province_center li').on('click',function(){
		var val1 = $(this).html();
		$("#T-province").val(val1);
		$plateObj.val(val1);
		$('.province_center').animate({"bottom":'-12em'},300).hide();
	});
	//查看协议
	$("#seeAgreement").on("click",function(){
		$("#layerAgreement").show();
	})
	//关闭协议
	$(".closeAgreement").on("click",function(){
		$("#layerAgreement").hide();
	})
});

function distance(){
	var locationArray=new Array();
	var desAddressArray=new Array();
	var location  = $("#location").attr("data-local").toString().split(',');
	locationArray[0]=location[1];
	locationArray[1]=location[0];
	$("#rescueLongitude").val(location[1]);
	$("#rescueLatitude").val(location[0]);
	var desAddress  = $("#desAddress").attr("data-local").toString().split(',');
	desAddressArray[0]=desAddress[1];
	desAddressArray[1]=desAddress[0];
	$("#desLongitude").val(desAddress[1]);
	$("#desLatitude").val(desAddress[0]);
	//console.log(locationArray+"---"+desAddressArray);
	var dis = AMap.GeometryUtil.distance(locationArray,desAddressArray);
	dis = Math.round(dis / 1000) ;
	//console.log(dis);
	ctx = $('#ctx').val();
	var formualidjisuan = ctx + "/speed/getFormualidjisuan";
	$('#loadingSearch').show();
	$.ajax({
		"type" : "POST",
		"url" : formualidjisuan,
		data : {
			"customerindex":$("#customeIndex").val(),
			"pid":$("#pid").val(),
			"serviceItem":$("#serviceItem").val(),
			"gokm":0.0,
			"workkm":dis,
			"backkm":0.0
		},
		"dataType" : "json",
		"success" : function(data) {
			if(data.jsgzresult == "ok"){
				$(".gzresult").html(data.gzresult);
			}/* else{
				alert(data.gzmsg);
			} */
			$('#loadingSearch').hide();
		},
		"error" : function(request){
			$('#loadingSearch').hide();
			alert("系统出错,请重试！");
		}
	}); 
}
$(".wxSubmit").on('click',function(){
	var phone_reg = /^1[34578]\d{9}$/;
	var serviceItem = $("#serviceItem").val();
	var desPhone = $('#desPhone').val();
   	//获取协议是否选中
   	//console.log($("#is_default").is(':checked'));
   	if(!$("#customeIndex").val()){
   		return alert('请去个人中心注册或绑定客户！');
   	}else if(!$("#customStatus").val()){
   		return alert('请重新绑定客户！');
   	}else if($("#customStatus").val() != 1){
   		return alert('无法报案，客户未合作！');
   	}else if(!$("#serviceItem").val()){
    	return alert('请选择服务项目！');
    }else if(!$("#carType").val()){
    	return alert('请选择车辆类型！');
    }else if(!desPhone){
   		return alert('请输入接车人手机号！');
   	}else if(!phone_reg.test(desPhone.replace(/[^0-9]/ig,""))){
    	return alert('请输入正确的接车人手机号！');
    }else if(!$('#location').val()){
    	return alert('请选择提车人地址！');
    }else if(!$('#desAddress').val()){
    	return alert('请输入接车人地址！');
    }else if(!$("#reserveTimeStart").val()){
    	return alert('请选择前预约时间！');
    }else if(!$("#reserveTimeEnd").val()){
    	return alert('请选择后预约时间！');
    }else if((serviceItem == 1 || serviceItem == 8) && !$(".plate_number").val()){
    	return alert('请输入车牌号码！');
    }
   	var isReturn = true;
	$("input[name='carNumbers']").each(function(j,item){
		if(!item.value){
			alert('请输入第'+(j+1)+'个车牌号');
			isReturn = false;
			return false;
		}
	});
	if(!isReturn){
		return ;
	}
   	if($("#is_default").is(':checked')){
   		$(".mask").show()
   	}else{
   		return alert("请阅读元通救援力速配服务协议并勾选");
   	}
})
$(".wxportCaseSubmit").on('click',function(){
	ctx = $('#ctx').val();
	var wxreporturl = ctx + "/platwechat/sendBigOrWindReportCase";
	var reserveTimeStart = $('#reserveTimeStart').val();
	reserveTimeStart =  reserveTimeStart.replace(" ", "T");
	$('#reserveTimeStart').val(reserveTimeStart);
	
	var reserveTimeEnd = $('#reserveTimeEnd').val();
	reserveTimeEnd =  reserveTimeEnd.replace(" ", "T");
	$('#reserveTimeEnd').val(reserveTimeEnd);
	var rescuePhone = $("#rescuePhone").val();
	$("#rescuePhone").val(rescuePhone.replace(/[^0-9]/ig,""));
	var desPhone = $('#desPhone').val();
	$("#desPhone").val(desPhone.replace(/[^0-9]/ig,""));
		//loadPhotoAndRecord();
		//alert(chooseImageval);
		 
		//alert(caseRecordval);
		$('#loadingToast').show();
		 $.ajax({
			"type" : "POST",
			"url" : wxreporturl,
			data : $('#wxreportcaseform').serialize(),
			"dataType" : "json",
			"success" : function(data) {
				//console.log(data);
				var result = data.result;
				if(result == "failed") {
					$('#loadingToast').hide();
					alert("错误："+data.msg);
					/* mui.confirm('<p>'+data.msg+'</p>',"错误",['确定'],function(e){
						if(e.index==0){
							closeWin();
						}
					}); */
					return;
				}
				$('#loadingToast').hide();
				alert("报案成功!");
				closeWin();
				/* mui.confirm('<p>'+"报案成功！"+'</p>',"提示",['确定'],function(e){
					if(e.index==0){
						closeWin();
					}
				}); */
			},
			"error" : function(request){
				$('#loadingToast').hide();
				alert("系统出错,请重试！");
				/* mui.confirm('<p>'+'系统出错,请重试！'+'</p>',"错误",['确定'],function(e){
					
				}); */
			}
		}); 
})

function tab(date1,date2){
    var oDate1 = new Date(date1);
    var oDate2 = new Date(date2);
    if(oDate1.getTime() > oDate2.getTime()){
        console.log('第一个大');
    } else {
        console.log('第二个大');
    }
}

//获取当前时间，格式YYYY-MM-DD
function getNowFormatDate(h) {
    var newdate = new Date();
	var date = new Date(newdate.getTime() + h);
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var hours = date.getHours();
    if(hours >=1 && hours <= 9){
    	hours = "0" + hours;
    }
    
    var minutes = date.getMinutes();
    if(minutes >=1 && minutes <= 9){
    	minutes = "0" + minutes;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate + " " + hours + ":" + minutes;
    return currentdate;
}
function address(address,lat,lon){
	document.querySelector("#map-center").innerText = address;
	document.querySelector("#map-center").setAttribute("data-local",lat+','+lon);
	marker.setPosition([lon,lat]); //更新点标记位置
	map.setCenter([lon,lat]); //设置地图中心点
	$('.addressUl').hide();
}
</script>
</html>