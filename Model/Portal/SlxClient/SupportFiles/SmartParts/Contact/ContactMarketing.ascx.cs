using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using NHibernate;
using Sage.Entity.Interfaces;
using Sage.Platform;
using Sage.Platform.Application;
using Sage.Platform.Application.UI;
using Sage.Platform.Framework;
using Sage.Platform.Security;
using Sage.Platform.WebPortal.Services;
using Sage.Platform.WebPortal.SmartParts;

public partial class SmartParts_Contact_ContactMarketing : EntityBoundSmartPartInfoProvider
{
    private IPanelRefreshService _RefreshService;

    #region Public Properties

    /// <summary>
    /// Gets the type of the entity.
    /// </summary>
    /// <value>The type of the entity.</value>
    public override Type EntityType
    {
        get { return typeof(IContact); }
    }

    /// <summary>
    /// Gets or sets an instance of the Refresh Service.
    /// </summary>
    /// <value>The refresh service.</value>
    [ServiceDependency]
    public IPanelRefreshService RefreshService
    {
        set
        {
            _RefreshService = value;
        }
        get
        {
            return _RefreshService;
        }
    }

    #endregion

    #region Protected Methods

    /// <summary>
    /// Derived components should override this method to wire up event handlers.
    /// </summary>
    protected override void OnWireEventHandlers()
    {
        if (ScriptManager.GetCurrent(Page) != null)
            AddResponse.Click += AddResponse_Click;
        base.OnWireEventHandlers();
    }

    /// <summary>
    /// Called when the smartpart has been bound.  Derived components should override this method to run code that depends on entity context being set and it not changing.
    /// </summary>
    protected override void OnFormBound()
    {
        LoadMarketing();
        base.OnFormBound();
    }

    /// <summary>
    /// Override this method to add bindings to the currrently bound smart part
    /// </summary>
    protected override void OnAddEntityBindings()
    {
    }

    /// <summary>
    /// Handles the Click event of the AddResponse control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.Web.UI.ImageClickEventArgs"/> instance containing the event data.</param>
    protected void AddResponse_Click(object sender, ImageClickEventArgs e)
    {
        AddResponseAndTarget();
    }

    /// <summary>
    /// Handles the RowDataBound event of the ContactMarketing control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.Web.UI.WebControls.GridViewRowEventArgs"/> instance containing the event data.</param>
    protected void ContactMarketing_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton deleteCommand = (LinkButton) e.Row.Cells[2].Controls[0];
            LinkButton removeCommand = (LinkButton) e.Row.Cells[3].Controls[0];
            var row = (DataRowView) e.Row.DataItem;

            deleteCommand.Enabled = !String.IsNullOrEmpty(row["ResponseId"].ToString());
            if (deleteCommand.Enabled)
            {
                deleteCommand.Attributes.Add("onclick",
                                             "javascript: return confirm('" +
                                             GetLocalResourceObject("ConfirmMessage_DeleteResponse") + "');");
            }
            else
            {
                e.Row.Cells[2].ForeColor = Color.Gray;
            }

            removeCommand.Enabled = !row["Status"].ToString().Equals(GetLocalResourceObject("TargetStatus_Removed").ToString());
            if (removeCommand.Enabled)
            {
                removeCommand.Attributes.Add("onclick",
                                             "javascript: return confirm('" +
                                             String.Format(
                                                 GetLocalResourceObject("ConfirmMessage_RemoveTargetAssociation").
                                                     ToString(), e.Row.Cells[4].Text) + "');");
            }
            else
            {
                e.Row.Cells[3].ForeColor = Color.Gray;
            }
        }
    }

    /// <summary>
    /// Handles the RowCommand event of the ContactMarketing control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.Web.UI.WebControls.GridViewCommandEventArgs"/> instance containing the event data.</param>
    protected void ContactMarketing_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        ITargetResponse targetResponse = null;
        string targetId = String.Empty;
        string responseId = String.Empty;
        try
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            targetId = grdContactMarketing.DataKeys[rowIndex].Values[0].ToString();
            responseId = grdContactMarketing.DataKeys[rowIndex].Values[1].ToString();
            if (!string.IsNullOrEmpty(responseId))
                targetResponse = EntityFactory.GetRepository<ITargetResponse>().Get(responseId);
        }
        catch
        {
        }

        switch (e.CommandName.ToUpper())
        {
            case "EDIT":
                if (String.IsNullOrEmpty(targetId))
                {
                    AddResponseAndTarget();
                }
                else
                {
                    if (targetResponse == null)
                    {
                        targetResponse = EntityFactory.Create<ITargetResponse>();
                        ICampaignTarget target = EntityFactory.GetRepository<ICampaignTarget>().Get(targetId);
                        targetResponse.Campaign = target.Campaign;
                        targetResponse.CampaignTarget = target;
                    }
                    ShowResponseView(targetResponse);
                }
                break;
            case "DELETE":
                if (targetResponse != null)
                {
                    ICampaignTarget campaignTarget = targetResponse.CampaignTarget;
                    if (campaignTarget.TargetResponses.Count <= 1)
                        campaignTarget.Status = GetLocalResourceObject("TargetStatus_Removed").ToString();
                    campaignTarget.TargetResponses.Remove(targetResponse);
                    targetResponse.Delete();
                    LoadMarketing();
                }
                else
                {
                    RemoveTargetAssociation(targetId);
                }
                break;
            case "REMOVE":
                RemoveTargetAssociation(targetId);
                break;
            case "SORT":
                break;
        }
    }

    /// <summary>
    /// Handles the RowDeleting event of the grdContactMarketing control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.Web.UI.WebControls.GridViewDeleteEventArgs"/> instance containing the event data.</param>
    protected void ContactMarketing_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        grdContactMarketing.SelectedIndex = e.RowIndex;
    }

    /// <summary>
    /// Handles the RowEditing event of the ContactMarketing control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.Web.UI.WebControls.GridViewEditEventArgs"/> instance containing the event data.</param>
    protected void ContactMarketing_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdContactMarketing.SelectedIndex = e.NewEditIndex;
        e.Cancel = true;
    }

    /// <summary>
    /// Handles the Sorting event of the grdContactMarketing control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.Web.UI.WebControls.GridViewSortEventArgs"/> instance containing the event data.</param>
    protected void ContactMarketing_Sorting(object sender, GridViewSortEventArgs e)
    {
    }

    #endregion

    #region Private Methods

    /// <summary>
    /// Gets the order by clause.
    /// </summary>
    /// <returns></returns>
    private string GetOrderByClause()
    {
        if (grdContactMarketing.CurrentSortDirection.ToUpper() == "ASCENDING")
            return String.Format(" Order By {0} asc", grdContactMarketing.CurrentSortExpression);
        return String.Format(" Order By {0} desc", grdContactMarketing.CurrentSortExpression);
    }

    /// <summary>
    /// Loads the marketing.
    /// </summary>
    private void LoadMarketing()
    {
        try
        {
            ISession session = SessionFactoryHolder.HolderInstance.CreateSession();
            try
            {
                if (EntityContext != null && EntityContext.EntityType == typeof(IContact))
                {
                    IContact contact = BindingSource.Current as IContact;
                    StringBuilder qry = new StringBuilder();
                    qry.Append("Select campaign.CampaignName, campaign.CampaignCode, target.Status, target.Stage, ");
                    qry.Append("campaign.StartDate, campaign.EndDate, response.ResponseDate, response.ResponseMethod, ");
                    qry.Append("target.Id, response.Id ");
                    qry.Append("From CampaignTarget as target ");
                    qry.Append("Join target.Campaign as campaign ");
                    qry.Append("Left Join target.TargetResponses as response ");
                    qry.Append("Where target.EntityId = :contactId");
                    if (grdContactMarketing.AllowSorting)
                        qry.Append(GetOrderByClause());
                    IQuery q = session.CreateQuery(qry.ToString());

                    q.SetParameter("contactId", contact.Id);
                    IList result;
                    using (new SparseQueryScope())
                        result = q.List();
                    var dt = new DataTable();
                    dt.Columns.Add("CampaignName");
                    dt.Columns.Add("CampaignCode");
                    dt.Columns.Add("Status");
                    dt.Columns.Add("Stage");
                    var col = new DataColumn("StartDate", typeof(DateTime));
                    dt.Columns.Add(col);
                    col = new DataColumn("EndDate", typeof(DateTime));
                    dt.Columns.Add(col);
                    col = new DataColumn("ResponseDate", typeof(DateTime));
                    dt.Columns.Add(col);
                    dt.Columns.Add("ResponseMethod");
                    dt.Columns.Add("TargetId");
                    dt.Columns.Add("ResponseId");
                    if (result != null)
                        foreach (object[] data in result)
                        {
                            dt.Rows.Add(data[0], data[1], data[2], data[3], ConvertData(data[4]), ConvertData(data[5]), ConvertData(data[6]), data[7], data[8], data[9]);
                        }
                    grdContactMarketing.DataSource = dt;
                    grdContactMarketing.DataBind();
                }
            }
            finally
            {
                SessionFactoryHolder.HolderInstance.ReleaseSession(session);
            }
        }
        catch (Exception ex)
        {
            log.Error(ex.Message);
            throw;
        }
    }

    /// <summary>
    /// Converts the value of the object into a valid DateTime value.
    /// </summary>
    /// <param name="dateTime">The date time.</param>
    /// <returns></returns>
    private static DateTime? ConvertData(Object dateTime)
    {
        if (dateTime == null)
            return DateTime.MinValue;
        return Convert.ToDateTime(dateTime);
    }

    /// <summary>
    /// Adds the response and target.
    /// </summary>
    private void AddResponseAndTarget()
    {
        if (DialogService != null)
        {
            ITargetResponse targetResponse = EntityFactory.Create<ITargetResponse>();
            ShowResponseView(targetResponse);
        }
    }

    /// <summary>
    /// Shows the response view.
    /// </summary>
    /// <param name="targetResponse">The target response.</param>
    private void ShowResponseView(ITargetResponse targetResponse)
    {
        if (DialogService != null)
        {
            string caption = GetLocalResourceObject("AddTargetResponse_DialogCaption").ToString();
            if (targetResponse != null && targetResponse.Id != null)
            {
                caption = GetLocalResourceObject("EditTargetResponse_DialogCaption").ToString();
            }
            DialogService.SetSpecs(200, 200, 550, 800, "AddEditTargetResponse", caption, true);
            DialogService.EntityType = typeof(ITargetResponse);
            if (targetResponse != null && targetResponse.Id != null)
                DialogService.EntityID = targetResponse.Id.ToString();
            //if the conversion fails or they don't run it.
            if (targetResponse.Contact == null)
                targetResponse.Contact = BindingSource.Current as IContact;
            DialogService.DialogParameters.Add("ResponseDataSource", targetResponse);
            DialogService.ShowDialog();
        }
    }

    /// <summary>
    /// Removes the target association from the campaign by updating its status.
    /// </summary>
    /// <param name="targetId">The target id.</param>
    private void RemoveTargetAssociation(string targetId)
    {
        if (!String.IsNullOrEmpty(targetId))
        {
            ICampaignTarget campaignTarget = EntityFactory.GetRepository<ICampaignTarget>().Get(targetId);
            if (campaignTarget != null)
            {
                campaignTarget.Status = GetLocalResourceObject("TargetStatus_Removed").ToString();
                campaignTarget.Save();
                LoadMarketing();
            }
        }
    }

    #endregion

    #region ISmartPartInfoProvider Members

    /// <summary>
    /// Tries to retrieve smart part information compatible with type
    /// smartPartInfoType.
    /// </summary>
    /// <param name="smartPartInfoType">Type of information to retrieve.</param>
    /// <returns>
    /// The <see cref="T:Sage.Platform.Application.UI.ISmartPartInfo"/> instance or null if none exists in the smart part.
    /// </returns>
    public override ISmartPartInfo GetSmartPartInfo(Type smartPartInfoType)
    {
        var tinfo = new ToolsSmartPartInfo();
        foreach (Control c in ContactMarketing_RTools.Controls)
        {
            tinfo.RightTools.Add(c);
        }
        return tinfo;
    }

    #endregion
}