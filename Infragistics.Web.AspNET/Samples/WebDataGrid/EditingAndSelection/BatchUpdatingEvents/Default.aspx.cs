using System;
using System.Web;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.wdg1.RowAdding += new Infragistics.Web.UI.GridControls.RowAddingHandler(wdg1_RowAdding);
        this.wdg1.RowAdded += new Infragistics.Web.UI.GridControls.RowAddedHandler(wdg1_RowAdded);
        this.wdg1.RowUpdating += new Infragistics.Web.UI.GridControls.RowUpdatingHandler(wdg1_RowUpdating);
        this.wdg1.RowUpdated += new Infragistics.Web.UI.GridControls.RowUpdatedHandler(wdg1_RowUpdated);
        this.wdg1.RowsDeleting += new Infragistics.Web.UI.GridControls.RowDeletingHandler(wdg1_RowsDeleting);
        this.wdg1.RowDeleted += new Infragistics.Web.UI.GridControls.RowDeletedHandler(wdg1_RowDeleted);
        this.eventList.InnerHtml = String.Format("{0} {1}", this.eventList.InnerHtml, HttpUtility.UrlDecode(this.hdnClientEvents.Value));
    }

    void wdg1_RowUpdating(object sender, Infragistics.Web.UI.GridControls.RowUpdatingEventArgs e)
    {
        UpdateEventList("RowUpdating", e.Row.Index, e.Row.DataKey[0].ToString());
    }

    void wdg1_RowUpdated(object sender, Infragistics.Web.UI.GridControls.RowUpdatedEventArgs e)
    {
        UpdateEventList("RowUpdated", e.RowID.Key.GetValue(0).ToString());
    }

    void wdg1_RowAdding(object sender, Infragistics.Web.UI.GridControls.RowAddingEventArgs e)
    {
        UpdateEventList("RowAdding", e.Values["CustomerID"].ToString());
    }

    void wdg1_RowAdded(object sender, Infragistics.Web.UI.GridControls.RowAddedEventArgs e)
    {
        UpdateEventList("RowAdded", e.RowID.Key.GetValue(0).ToString());
    }

    void wdg1_RowsDeleting(object sender, Infragistics.Web.UI.GridControls.RowDeletingEventArgs e)
    {
        UpdateEventList("RowDeleting", e.Row.Index, e.Row.DataKey[0].ToString());
    }

    void wdg1_RowDeleted(object sender, Infragistics.Web.UI.GridControls.RowDeletedEventArgs e)
    {
        UpdateEventList("RowDeleted", e.RowID.Key.GetValue(0).ToString());
    }

    protected void chkBatch_CheckedChanged(object sender, EventArgs e)
    {
        this.wdg1.Behaviors.EditingCore.BatchUpdating = this.chkBatch.Checked;
        this.wdg1.Behaviors.Selection.RowSelectType = (this.chkBatch.Checked)
                                                        ? Infragistics.Web.UI.GridControls.SelectType.Multiple
                                                        : Infragistics.Web.UI.GridControls.SelectType.Single;
    }

    private void UpdateEventList(string eventName, int rowIndex, string rowKey)
    {
        this.eventList.InnerHtml = String.Format("{0} <div class='event-fired server-events'> {1} {2} </div>", this.eventList.InnerHtml, eventName, this.GetGlobalResourceObject("WebDataGrid","txt_eventFired").ToString());
        this.eventList.InnerHtml = String.Format("{0} <div class='event-args server-events'> {1}: {2} <br /> {3}: {4}</div>", this.eventList.InnerHtml,
                                                        this.GetGlobalResourceObject("WebDataGrid", "txt_rowIndex").ToString(), rowIndex, 
                                                        this.GetGlobalResourceObject("WebDataGrid","txt_rowKey").ToString(), rowKey);
    }

    private void UpdateEventList(string eventName, string rowKey)
    {
        this.eventList.InnerHtml = String.Format("{0} <div class='event-fired server-events'> {1} {2} </div>", this.eventList.InnerHtml, eventName, this.GetGlobalResourceObject("WebDataGrid", "txt_eventFired").ToString());
        this.eventList.InnerHtml = String.Format("{0} <div class='event-args server-events'> {1}: {2} </div>", this.eventList.InnerHtml, 
                                                        this.GetGlobalResourceObject("WebDataGrid","txt_rowKey").ToString(), rowKey);
    }
}
