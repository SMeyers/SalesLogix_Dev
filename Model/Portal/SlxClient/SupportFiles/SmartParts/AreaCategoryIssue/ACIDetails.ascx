<%@ Control Language="C#" ClassName="ACIDetails" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
<%@ Register Assembly="Sage.SalesLogix.Client.GroupBuilder" Namespace="Sage.SalesLogix.Client.GroupBuilder" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.PickList" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.DependencyLookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.Lookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.Timeline" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.HighLevelTypes" Namespace="Sage.SalesLogix.HighLevelTypes" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.Platform.WebPortal" Namespace="Sage.Platform.WebPortal.SmartParts" TagPrefix="SalesLogix" %>
<%//------------------------------------------------------------------------
//This file was generated by a tool.  Changes to this file may cause incorrect behavior and will be lost if the code is regenerated.
//------------------------------------------------------------------------ %>
<table border="0" cellpadding="1" cellspacing="0" class="formtable">
         <col width="33%" />
            <col width="33%" />
            <col width="34%" />
     <tr>
            <td  >
 <div class=" lbl alignleft" >
   <asp:Label ID="txtArea_lbl" AssociatedControlID="txtArea" runat="server" Text="<%$ resources: txtArea.Caption %>" ></asp:Label>
 </div>
  <div  class="textcontrol"   >
<asp:TextBox runat="server" ID="txtArea" Rows="1"
MaxLength="64"
 />
  </div>

      </td>
                <td  >
 <div class=" lbl alignleft" >
   <asp:Label ID="txtCategory_lbl" AssociatedControlID="txtCategory" runat="server" Text="<%$ resources: txtCategory.Caption %>" ></asp:Label>
 </div>
  <div  class="textcontrol"   >
<asp:TextBox runat="server" ID="txtCategory" Rows="1"
MaxLength="64"
 />
  </div>

      </td>
                <td  >
 <div class=" lbl alignleft" >
   <asp:Label ID="txtIssue_lbl" AssociatedControlID="txtIssue" runat="server" Text="<%$ resources: txtIssue.Caption %>" ></asp:Label>
 </div>
  <div  class="textcontrol"   >
<asp:TextBox runat="server" ID="txtIssue" Rows="1"
MaxLength="64"
 />
  </div>

      </td>
      </tr>
<tr>
            <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="cboArea_lbl" AssociatedControlID="cboArea" runat="server" Text="<%$ resources: cboArea.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol select"  > 
<asp:DropDownList runat="server" ID="cboArea" data-dojo-type="Sage.UI.Controls.Select" CssClass="select-control" AutoPostBack="true"  >
</asp:DropDownList>
  </div>

      </td>
                <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="cboCategory_lbl" AssociatedControlID="cboCategory" runat="server" Text="<%$ resources: cboCategory.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol select"  > 
<asp:DropDownList runat="server" ID="cboCategory" data-dojo-type="Sage.UI.Controls.Select" CssClass="select-control" AutoPostBack="true"  >
</asp:DropDownList>
  </div>

      </td>
                <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="cboIssue_lbl" AssociatedControlID="cboIssue" runat="server" Text="<%$ resources: cboIssue.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol select"  > 
<asp:DropDownList runat="server" ID="cboIssue" data-dojo-type="Sage.UI.Controls.Select" CssClass="select-control" AutoPostBack="true"  >
</asp:DropDownList>
  </div>

      </td>
      </tr>
<tr>
            <td  colspan="3" >
  <hr />
 

      </td>
                  </tr>
<tr>
            <td  >
<div class="slxlabel  alignleft checkbox">
  <SalesLogix:SLXCheckBox runat="server" ID="chkTicket" CssClass="checkbox "
 Text="<%$ resources: chkTicket.Caption %>" TextAlign="left"  />
</div>
      </td>
                <td  >
<div class="slxlabel  alignleft checkbox">
  <SalesLogix:SLXCheckBox runat="server" ID="chkDefect" CssClass="checkbox "
 Text="<%$ resources: chkDefect.Caption %>" TextAlign="left"  />
</div>
      </td>
                <td  >
<div class="slxlabel  alignleft checkbox">
  <SalesLogix:SLXCheckBox runat="server" ID="chkCustomer" CssClass="checkbox "
 Text="<%$ resources: chkCustomer.Caption %>" TextAlign="left"  />
</div>
      </td>
      </tr>
<tr>
            <td></td>
                <td></td>
                <td></td>
      </tr>
</table>
 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="ACIDetails_RTools" ToolbarLocation="right">
   <SalesLogix:GroupNavigator runat="server" ID="navACI" ></SalesLogix:GroupNavigator>
    <asp:ImageButton runat="server" ID="btnSave"
 AlternateText="<%$ resources: btnSave.Caption %>"  ToolTip="<%$ resources: btnSave.ToolTip %>" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Save_16x16"  />
   
    <asp:ImageButton runat="server" ID="btnAdd"
 AlternateText="<%$ resources: btnAdd.Caption %>" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=plus_16x16"  />
 
    <asp:ImageButton runat="server" ID="btnDelete"
 AlternateText="<%$ resources: btnDelete.Caption %>" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Delete_16x16"  />
 
  <SalesLogix:PageLink ID="lnkACIDetailsHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="ACIDetails" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
 </SalesLogix:SmartPartToolsContainer>


<script runat="server" type="text/C#">
/// <summary>
/// Gets or sets the role security service.
/// </summary>
/// <value>The role security service.</value>
[Sage.Platform.Application.ServiceDependency]
public Sage.Platform.Security.IRoleSecurityService RoleSecurityService { get; set; }

public override Type EntityType
{
    get { return typeof(Sage.Entity.Interfaces.IAreaCategoryIssue); }
}

 

protected override void OnAddEntityBindings() {
                 // txtArea.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtAreaTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Area", txtArea, "Text");
        BindingSource.Bindings.Add(txtAreaTextBinding);
                    // txtCategory.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtCategoryTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Category", txtCategory, "Text");
        BindingSource.Bindings.Add(txtCategoryTextBinding);
                    // txtIssue.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtIssueTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Issue", txtIssue, "Text");
        BindingSource.Bindings.Add(txtIssueTextBinding);
                                // chkTicket.Checked Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding chkTicketCheckedBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Ticket", chkTicket, "Checked");
        BindingSource.Bindings.Add(chkTicketCheckedBinding);
                    // chkDefect.Checked Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding chkDefectCheckedBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Defect", chkDefect, "Checked");
        BindingSource.Bindings.Add(chkDefectCheckedBinding);
                    // chkCustomer.Checked Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding chkCustomerCheckedBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Customer", chkCustomer, "Checked");
        BindingSource.Bindings.Add(chkCustomerCheckedBinding);
    
   
                }
                                                                      
protected void cboArea_ChangeAction(object sender, EventArgs e) {

    Sage.Entity.Interfaces.IAreaCategoryIssue aci = this.BindingSource.Current as Sage.Entity.Interfaces.IAreaCategoryIssue;
    aci.Area = cboArea.Text;

    cboCategory.Items.Clear();
 
    //Get Distinct Categories for the selected Area, if necessary
    if (cboArea.Text.Length > 0)
    {
        Sage.Platform.RepositoryHelper<Sage.Entity.Interfaces.IAreaCategoryIssue> repoHelper = Sage.Platform.EntityFactory.GetRepositoryHelper<Sage.Entity.Interfaces.IAreaCategoryIssue>();
        Sage.Platform.Repository.ICriteria criteria = repoHelper.CreateCriteria();
        criteria.Add(repoHelper.EF.Eq("Area", cboArea.Text));
        criteria.SetProjection(repoHelper.PF.Distinct(repoHelper.PF.Property("Category")));
        System.Collections.Generic.IList<string> l = criteria.List<string>();

        cboCategory.Items.Add(string.Empty);
        foreach (string category in l) { cboCategory.Items.Add(category); }

        txtCategory.Focus();
    }	


}
protected void cboCategory_ChangeAction(object sender, EventArgs e) {

    Sage.Entity.Interfaces.IAreaCategoryIssue aci = this.BindingSource.Current as Sage.Entity.Interfaces.IAreaCategoryIssue;
    aci.Category = cboCategory.Text;

    cboIssue.Items.Clear();
 
    //Get Distinct Issues for the selected Category, if necessary
    if (cboCategory.Text.Length > 0)
    {
        Sage.Platform.RepositoryHelper<Sage.Entity.Interfaces.IAreaCategoryIssue> repoHelper = Sage.Platform.EntityFactory.GetRepositoryHelper<Sage.Entity.Interfaces.IAreaCategoryIssue>();
        Sage.Platform.Repository.ICriteria criteria = repoHelper.CreateCriteria();
        criteria.Add(repoHelper.EF.Eq("Area", cboArea.Text));
        criteria.Add(repoHelper.EF.Eq("Category", cboCategory.Text));
        criteria.SetProjection(repoHelper.PF.Distinct(repoHelper.PF.Property("Issue")));
        System.Collections.Generic.IList<string> l = criteria.List<string>();

        cboIssue.Items.Add(string.Empty);
        foreach (string issue in l) { cboIssue.Items.Add(issue); }

        txtIssue.Focus();
    }	

}
protected void cboIssue_ChangeAction(object sender, EventArgs e) {

    //Update the bound textbox with the selected value
    Sage.Entity.Interfaces.IAreaCategoryIssue aci = this.BindingSource.Current as Sage.Entity.Interfaces.IAreaCategoryIssue;
    aci.Issue = cboIssue.Text;

}
protected void btnSave_ClickAction(object sender, EventArgs e) {
  Sage.Entity.Interfaces.IAreaCategoryIssue _entity = BindingSource.Current as Sage.Entity.Interfaces.IAreaCategoryIssue;
  if (_entity != null)
  {
    object _parent = GetParentEntity();
    if (DialogService.ChildInsertInfo != null)
    {
        if (_parent != null)
        {
            if (DialogService.ChildInsertInfo.ParentReferenceProperty != null)
            {
                DialogService.ChildInsertInfo.ParentReferenceProperty.SetValue(_entity, _parent, null);
            }
        }
    }
    bool shouldSave = true;
    Sage.Platform.WebPortal.EntityPage page = Page as Sage.Platform.WebPortal.EntityPage;
    if (page != null)
    {
        if(IsInDialog() && page.ModeId.ToUpper() == "INSERT")
        {
            shouldSave = false;
        }
    }

    if(shouldSave)
    {
       _entity.Save();
    }

    if (_parent != null)
    {
        if (DialogService.ChildInsertInfo != null)
        {
           if (DialogService.ChildInsertInfo.ParentsCollectionProperty != null)
           {
              System.Reflection.MethodInfo _add = DialogService.ChildInsertInfo.ParentsCollectionProperty.PropertyType.GetMethod("Add");
              _add.Invoke(DialogService.ChildInsertInfo.ParentsCollectionProperty.GetValue(_parent, null), new object[] { _entity });
           }
        }
     }
  }

          btnSave_ClickActionBRC(sender, e);
    
  
}
protected void btnSave_ClickActionBRC(object sender, EventArgs e) {
      Response.Redirect("AreaCategoryIssue.aspx");
  
}
protected void btnAdd_ClickAction(object sender, EventArgs e) {
            Response.Redirect("AreaCategoryIssue.aspx?modeid=insert");
      
}
protected void btnDelete_ClickAction(object sender, EventArgs e) {
  Sage.Platform.Orm.Interfaces.IPersistentEntity persistentEntity = this.BindingSource.Current as Sage.Platform.Orm.Interfaces.IPersistentEntity;
  if (persistentEntity != null) {
    persistentEntity.Delete();
  }

          btnDelete_ClickActionBRC(sender, e);
    
  
}
protected void btnDelete_ClickActionBRC(object sender, EventArgs e) {
      Response.Redirect("AreaCategoryIssue.aspx");
  
}

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 cboArea.TextChanged += new EventHandler(cboArea_ChangeAction);
cboCategory.TextChanged += new EventHandler(cboCategory_ChangeAction);
cboIssue.TextChanged += new EventHandler(cboIssue_ChangeAction);
btnSave.Click += new ImageClickEventHandler(btnSave_ClickAction);
btnAdd.Click += new ImageClickEventHandler(btnAdd_ClickAction);
btnDelete.Click += new ImageClickEventHandler(btnDelete_ClickAction);


}

protected void quickformload0(object sender, EventArgs e) {

	//Load the distinct Areas
	Sage.Platform.RepositoryHelper<Sage.Entity.Interfaces.IAreaCategoryIssue> repoHelper = Sage.Platform.EntityFactory.GetRepositoryHelper<Sage.Entity.Interfaces.IAreaCategoryIssue>();
    Sage.Platform.Repository.ICriteria criteria = repoHelper.CreateCriteria();
    criteria.SetProjection(repoHelper.PF.Distinct(repoHelper.PF.Property("Area")));
    System.Collections.Generic.IList<string> l = criteria.List<string>();

    cboArea.Items.Add(string.Empty);
    foreach (string area in l) { cboArea.Items.Add(area); }
	

}
private bool _runActivating;
protected override void OnActivating()
{
_runActivating = true;
}
private void DoActivating()
{
quickformload0(this, EventArgs.Empty);

}
protected override void OnFormBound()
{
Sage.Platform.WebPortal.EntityPage epage = Page as Sage.Platform.WebPortal.EntityPage;
        if (epage != null)
            _runActivating = (epage.IsNewEntity || _runActivating);
if (_runActivating) DoActivating();
ClientBindingMgr.RegisterSaveButton(btnSave);

ClientBindingMgr.SetFocusTo(txtArea);


}



public override Sage.Platform.Application.UI.ISmartPartInfo GetSmartPartInfo(Type smartPartInfoType)
{
    ToolsSmartPartInfo tinfo = new ToolsSmartPartInfo();
        if (BindingSource != null)
    {
        if (BindingSource.Current != null)
        {
            tinfo.Description = BindingSource.Current.ToString();
            tinfo.Title = BindingSource.Current.ToString();
        }
    }
    
    foreach (Control c in Controls)
    {
        SmartPartToolsContainer cont = c as SmartPartToolsContainer;
        if (cont != null)
        {
            switch (cont.ToolbarLocation)
            {
                case SmartPartToolsLocation.Right:
                    foreach (Control tool in cont.Controls)
                    {
                                            tinfo.RightTools.Add(tool);
                                        }
                    break;
                case SmartPartToolsLocation.Center:
                    foreach (Control tool in cont.Controls)
                    {
                        tinfo.CenterTools.Add(tool);
                    }
                    break;
                case SmartPartToolsLocation.Left:
                    foreach (Control tool in cont.Controls)
                    {
                        tinfo.LeftTools.Add(tool);
                    }
                    break;
            }
        }
    }

        return tinfo;
}

private Sage.Platform.Controls.IEntityForm _formAdapter;

public Sage.Platform.Controls.IEntityForm FormAdapter
{
    get { return _formAdapter ?? (_formAdapter = new ACIDetailsAdapter(this)); }
}

public class ACIDetailsAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter
{
    public ACIDetailsAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.ITextBoxControl _txtArea;
    public  Sage.Platform.Controls.ITextBoxControl txtArea
    {
        get { return FindControl(ref _txtArea, "txtArea"); }
    }
    private Sage.Platform.Controls.IListBoxControl _cboArea;
    public  Sage.Platform.Controls.IListBoxControl cboArea
    {
        get { return FindControl(ref _cboArea, "cboArea"); }
    }
    private Sage.Platform.Controls.ICheckBoxControl _chkTicket;
    public  Sage.Platform.Controls.ICheckBoxControl chkTicket
    {
        get { return FindControl(ref _chkTicket, "chkTicket"); }
    }
    private Sage.Platform.Controls.ITextBoxControl _txtCategory;
    public  Sage.Platform.Controls.ITextBoxControl txtCategory
    {
        get { return FindControl(ref _txtCategory, "txtCategory"); }
    }
    private Sage.Platform.Controls.IListBoxControl _cboCategory;
    public  Sage.Platform.Controls.IListBoxControl cboCategory
    {
        get { return FindControl(ref _cboCategory, "cboCategory"); }
    }
    private Sage.Platform.Controls.ICheckBoxControl _chkDefect;
    public  Sage.Platform.Controls.ICheckBoxControl chkDefect
    {
        get { return FindControl(ref _chkDefect, "chkDefect"); }
    }
    private Sage.Platform.Controls.ITextBoxControl _txtIssue;
    public  Sage.Platform.Controls.ITextBoxControl txtIssue
    {
        get { return FindControl(ref _txtIssue, "txtIssue"); }
    }
    private Sage.Platform.Controls.IListBoxControl _cboIssue;
    public  Sage.Platform.Controls.IListBoxControl cboIssue
    {
        get { return FindControl(ref _cboIssue, "cboIssue"); }
    }
    private Sage.Platform.Controls.ICheckBoxControl _chkCustomer;
    public  Sage.Platform.Controls.ICheckBoxControl chkCustomer
    {
        get { return FindControl(ref _chkCustomer, "chkCustomer"); }
    }
    private Sage.Platform.Controls.IGroupNavigatorControl _navACI;
    public  Sage.Platform.Controls.IGroupNavigatorControl navACI
    {
        get { return FindControl(ref _navACI, "navACI"); }
    }
    private Sage.Platform.Controls.IButtonControl _btnSave;
    public  Sage.Platform.Controls.IButtonControl btnSave
    {
        get { return FindControl(ref _btnSave, "btnSave"); }
    }
    private Sage.Platform.Controls.IButtonControl _btnAdd;
    public  Sage.Platform.Controls.IButtonControl btnAdd
    {
        get { return FindControl(ref _btnAdd, "btnAdd"); }
    }
    private Sage.Platform.Controls.IButtonControl _btnDelete;
    public  Sage.Platform.Controls.IButtonControl btnDelete
    {
        get { return FindControl(ref _btnDelete, "btnDelete"); }
    }

}

</script>

<script type="text/javascript">
</script>
