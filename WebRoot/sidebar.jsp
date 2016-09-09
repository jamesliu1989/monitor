<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
		<div class="page-sidebar nav-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->        
			<ul class="page-sidebar-menu">
				<li>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler hidden-phone"></div>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li class="start " id="menu1">
					<a href="index.jsp">
					<i class="icon-home"></i> 
					<span class="title">首页</span>
					</a>
				</li>
				<li class="" id="menu2">
					<a href="nodesView.jsp">
					<i class="icon-table"></i> 
					<span class="title">节点一览</span>
					<span class=""></span>
					</a>		
				</li>
				<li class="" id="menu10">
					<a href="alertAction_getUnRead">
					<i class="icon-bolt"></i> 
					<span class="title">报警信息</span>
					<span class=""></span>
					</a>		
				</li>
				<li class="" id="menu3">
					<a href="areaView.jsp">
					<i class="icon-globe"></i> 
					<span class="title">区域监测</span>
					<span class=""></span>
					</a>
				</li>
				<li class="" id="menu4">
					<a href="charts.jsp">
					<i class="icon-bar-chart"></i> 
					<span class="title">历史数据</span>
					<span class=""></span>
					</a>		
				</li>
				<li class="" id="menu5">
					<a href="javascript:;">
					<i class="icon-table"></i> 
					<span class="title">报表</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li id="menu51">
							<a href="page_timeline.html">
							<i class="icon-time"></i>
							日报<span class="arrow "></span></a>
							<ul class="sub-menu">
								<li id="menu511"><a href="nodeDailyReport.jsp"><i class="icon-file"></i> 节点日报</a></li>
								<li id="menu512"><a href="areaDailyReport.jsp"><i class="icon-file-text"></i> 区域日报</a></li>
							</ul>
						</li>
						<li id="menu52">
							<a href="page_coming_soon.html">
							<i class="icon-calendar"></i>
							月报<span class="arrow "></span></a>
							<ul class="sub-menu">
								<li id="menu521"><a href="nodeMonthReport.jsp"><i class="icon-file"></i> 节点月报</a></li>
								<li id="menu522"><a href="areaMonthReport.jsp"><i class="icon-file-text"></i> 区域月报</a></li>
							</ul>
						</li>
					</ul>
				</li>
<s:if test="#session.user.flag != 0">
				<li id="menu6">
					<a href="javascript:;">
					<i class="icon-sitemap"></i> 
					<span class="title">区域相关</span>
					<span class="selected"></span>
					<span class="arrow"></span>
					</a>
					<ul class="sub-menu">
					    <li id="menu61">
							<a href="ctrlerConfig.jsp">
							<i class="icon-edit"></i> 控制器管理</a>
						</li>
						<li id="menu62">
							<a href="areaConfig.jsp">
							<i class="icon-edit"></i> 区域管理</a>
						</li>
						<li id="menu63">
							<a href="areaPrmConfig.jsp">
							<i class="icon-cogs"></i> 区域报警参数设置</a>
						</li>
						<li id="menu64">
							<a href="areaNodeConfig.jsp">
							<i class="icon-sitemap"></i> 区域节点管理</a>
						</li>	
					</ul>
				</li>
				<li id="menu7">
					<a class="active" href="systemConfig.jsp">
					<i class="icon-cogs"></i> 
					<span class="title">系统相关</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li id="menu71">
							<a href="systemConfig.jsp">
							<i class="icon-cog"></i> 系统设置
							</a>
						</li>
						<li id="menu72">
							<a href="userAction_userView">
							<i class="icon-user"></i> 用户管理
							</a>
						</li>
					</ul>
				</li>
				<li id="menu8">
					<a href="smsHistory.jsp">
					<i class="icon-envelope"></i> 
					<span class="title">短信发送</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li id="menu81">
							<a href="smsHistory.jsp">
							<i class="icon-globe"></i> 
							发送记录
							<span class="arrow"></span>
							</a>
						</li>
						<li id="menu82">
							<a href="smsAction_smsInfo">
							<i class="icon-cogs"></i> 
							发送设置
							<span class="arrow"></span>
							</a>
						</li>
					</ul>
				</li>
</s:if>
				<%--<li class="last " id="menu9">--%>
					<%--<a href="javascript:;">--%>
					<%--<i class="icon-fire"></i> --%>
					<%--<span class="title">消防报警</span>--%>
					<%--<span class="arrow "></span>--%>
					<%--</a>--%>
					<%--<ul class="sub-menu">--%>
						<%--<li id="menu91">						    --%>
							<%--<a href="#"><i class="icon-cogs"></i>连锁设置</a>--%>
						<%--</li>--%>
						<%--<li id="menu92">--%>
							<%--<a href="#"><i class="icon-fire"></i> 消防连锁</a>--%>
						<%--</li>--%>
					<%--</ul>--%>
				<%--</li>--%>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
<script>
function menuSelect(m, s, l){
	$('.page-sidebar-menu li').attr('class','');
	$('#menu'+m).attr('class','active');
	if(s != 0){
	   $('#menu'+m+s).attr('class','active');
	}
	if(l != 0){
		   $('#menu'+m+s+l).attr('class','active');
		}
}
</script>