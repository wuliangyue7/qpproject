﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Game.Entity.Accounts;
using Game.Facade;
using Game.Utils;
using Game.Kernel;

namespace Game.Web.Member
{
    public partial class ReInsurePass : UCPageBase
    {
        #region 继承属性

        protected override bool IsAuthenticatedUser
        {
            get
            {
                return true;
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SwitchStep(1);

                Message umsg = FacadeManage.aideAccountsFacade.GetUserSecurityByUserID(Fetch.GetUserCookie().UserID);
                if (umsg.Success)
                {
                    AccountsProtect protect = umsg.EntityList[0] as AccountsProtect;

                    this.lblQuestion1.Text = protect.Question1;
                    this.lblQuestion2.Text = protect.Question2;
                    lblQuestion3.Text = protect.Question3;
                }
                else
                {
                    RenderAlertInfo2(true, "抱歉，您还没有申请密码保护功能，不能重置银行密码！");
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            AccountsProtect protect = new AccountsProtect();
            protect.UserID = Fetch.GetUserCookie().UserID;
            protect.InsurePass = TextEncrypt.EncryptPassword(CtrlHelper.GetTextAndFilter(txtNewPass));
            protect.Response1 = CtrlHelper.GetTextAndFilter(txtResponse1);
            protect.Response2 = CtrlHelper.GetTextAndFilter(txtResponse2);
            protect.Response3 = CtrlHelper.GetTextAndFilter(txtResponse3);
            protect.LastLogonIP = GameRequest.GetUserIP();

            Message umsg = FacadeManage.aideAccountsFacade.ResetInsurePasswd(protect);
            if (umsg.Success)
            {
                RenderAlertInfo2(false, "重置银行密码成功！");
            }
            else
            {
                Show(umsg.Content);
                this.txtResponse1.Text = "";
                this.txtResponse2.Text = "";
                this.txtResponse3.Text = "";
            }
        }
    }
}