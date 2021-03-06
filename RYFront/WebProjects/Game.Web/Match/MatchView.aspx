﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MatchView.aspx.cs" Inherits="Game.Web.Match.MatchView" %>
<%@ Register TagPrefix="qp" TagName="Header" Src="~/Themes/Standard/Common_Header.ascx" %>
<%@ Register TagPrefix="qp" TagName="Footer" Src="~/Themes/Standard/Common_Footer.ascx" %>
<%@ Register TagPrefix="qp" TagName="MatchSidebar" Src="~/Themes/Standard/Match_Sidebar.ascx" %>
<%@ Register TagPrefix="qp" TagName="Download" Src="~/Themes/Standard/Common_Download.ascx" %>
<%@ Register TagPrefix="qp" TagName="Speedy" Src="~/Themes/Standard/Common_Speedy.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/css/activity/activity-details.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery.min.js"></script>
</head>
<body>
    <!--头部开始-->
    <qp:Header ID="sHeader" runat="server" PageID="6"/>
    <!--头部结束-->

    <div class="ui-banner">
      <div class="ui-banner-bg-1"></div>
      <div class="ui-banner-bg-2"></div>
      <div class="ui-carousel-right">
        <div class="ui-carousel-left">
          <div class="ui-banner-img">
            <a href="javascript:;"><img src="/images/banner_2.png" /></a>
          </div>
        </div>
      </div>
    </div>

    <div class="ui-content">
      <div class="ui-main">
        <div class="ui-page-title fn-clear">
          <a href="/index.aspx"><i class="ui-page-title-home"></i>首页</a>
          <i class="ui-page-title-current"></i>
          <span>赛事活动</span>
          <div class="ui-page-title-right"><span>ACTIVITY&nbsp;&&nbsp;MATCH</span><strong>比赛中心</strong></div>
        </div>
        <div class="ui-center fn-clear">
          <div class="ui-main-speedy fn-left">
            <!--比赛左边开始-->
            <qp:MatchSidebar ID="sMatchSidebar" runat="server" MatchPageID="1" />
            <!--比赛左边结束-->
            <!--游戏下载开始-->
            <qp:Download ID="sDownload" runat="server" />
            <!--游戏下载结束-->
            <!--快速通道开始-->
            <qp:Speedy ID="sSpeedy" runat="server" />
            <!--快速通道结束-->
          </div>
          <div class="ui-main-details fn-right">
            <div class="ui-activity-title">
              <h2><%=MatchInfoModel.MatchName %></h2>
            </div>
            <div class="ui-activity-list">
              <a href="/Match/MatchView.aspx?param=<%= IntParam %>&type=<%= type%>" class="ui-activity-active">赛事公告</a>
              <a href="/Match/MatchOrder.aspx?param=<%= IntParam %>&type=<%= type%>">比赛排名</a>
            </div>
            <div class="ui-activity-award">
              <h2 class="ui-title-solid">比赛奖励</h2>
              <div>
                <table cellspacing="0">
                  <thead>
                    <tr>
                      <th></th>
                      <th class="ui-font-weight">奖励游戏币</th>
                      <th class="ui-font-weight">奖励元宝</th>
                      <th class="ui-font-weight">奖励经验</th>
                    </tr>
                  </thead>
                  <tbody>
                      <asp:Repeater ID="rptReward" runat="server">
                          <ItemTemplate>
                              <tr class="ui-bg-color">
                                  <td class="ui-font-weight">第<%# Eval("MatchRank")%>名</td>
                                  <td><%# Eval("RewardGold")%></td>
                                  <td><%# Eval("RewardIngot")%></td>
                                  <td><%# Eval("RewardExperience")%></td>
                              </tr>
                          </ItemTemplate>
                      </asp:Repeater>                    
                  </tbody>
                </table>
              </div>
            </div>
            <div>
              <h2 class="ui-title-solid">比赛说明</h2>
              <div class="ui-activity-details">
                <%= content %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!--尾部开始-->
    <qp:Footer ID="sFooter" runat="server" />
    <!--尾部结束-->
</body>
</html>
