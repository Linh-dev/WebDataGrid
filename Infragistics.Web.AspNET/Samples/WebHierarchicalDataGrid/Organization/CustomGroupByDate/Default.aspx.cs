using System;
using System.Collections.Generic;
using Infragistics.Web.UI.GridControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        List<Order> orderList = new List<Order>();

        for (int i = 0; i < 50; i++)
        {
            orderList.Add(new Order(i, DateTime.Now.AddDays(-i), DateTime.Now, "UPS"));
        }

        orderList.Add(new Order(50, DateTime.Now, DateTime.Now, "UPS"));
        orderList.Add(new Order(51, DateTime.Now.AddDays(-3), DateTime.Now, "UPS"));
        orderList.Add(new Order(52, DateTime.Now.AddDays(-7), DateTime.Now, "UPS"));
        orderList.Add(new Order(53, DateTime.Now.AddDays(-21), DateTime.Now, "UPS"));
        orderList.Add(new Order(54, DateTime.Parse("1/1/2009"), DateTime.Now, "UPS"));
        orderList.Add(new Order(55, DateTime.Parse("1/1/2008"), DateTime.Now, "UPS"));

        this.WebHierarchicalDataGrid1.DataSource = orderList;


        this.WebHierarchicalDataGrid1.GroupingSettings.GroupedColumns.Add("OrderDate");
        this.WebHierarchicalDataGrid1.GroupingSettings.GroupedRowTextMask = "{1} ({2})";
        this.WebHierarchicalDataGrid1.GroupingSettings.GroupAreaVisibility = Visibility.Hidden;

        ColumnGroupingSetting setting = new ColumnGroupingSetting();
        setting.ColumnKey = "OrderDate";
        setting.GroupComparer = new DateGroupComparer(this);
        setting.DefaultSortDirection = Infragistics.Web.UI.GridControls.GroupingSortDirection.Descending;

        this.WebHierarchicalDataGrid1.GroupingSettings.ColumnSettings.Add(setting);

        this.WebHierarchicalDataGrid1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
    }

    public string GetObjectWrapper(string cat, string name)
    {
        return this.GetGlobalResourceObject(cat, name).ToString();
    }

    public class DateGroupComparer : GroupEqualityComparer<DateTime>
    {
        private DateTime today;
        private DateTime yesterday;
        private DateTime firstDayOfWeek;
        private DateTime lastWeek;
        private DateTime twoWeeksAgo;
        private DateTime threeWeeksAgo;
        private DateTime lastMonth;

        private Default samplePage; 

        public DateGroupComparer(Default sp)
        {
            this.samplePage = sp;

            today = DateTime.Today;
            yesterday = DateTime.Today.AddDays(-1);

            firstDayOfWeek = new DateTime();
            int count = 1;
            while (firstDayOfWeek == DateTime.MinValue)
            {
                if (DateTime.Today.AddDays(-count).DayOfWeek == DayOfWeek.Sunday)
                    firstDayOfWeek = DateTime.Today.AddDays(-count);
                count++;
            }

            lastWeek = firstDayOfWeek.AddDays(-7).Date;
            twoWeeksAgo = lastWeek.AddDays(-7).Date;
            threeWeeksAgo = twoWeeksAgo.AddDays(-7).Date;
            lastMonth = new DateTime(DateTime.Today.Year, DateTime.Today.AddMonths(-1).Month, 1);
        }
        public override bool Equals(DateTime x, DateTime y)
        {
            if (x.Year == y.Year && x.Year == DateTime.Now.Year && x.Date >= lastMonth)
            {
                if (x.Date == today && y.Date == today)
                    return true;
                else if (x.Date == yesterday && y.Date == yesterday)
                {
                    return true;
                }
                else if (x.Date == y.Date)
                {
                    return true;
                }
                else if ((lastWeek <= x.Date && x.Date < firstDayOfWeek) && (lastWeek <= y.Date && y.Date < firstDayOfWeek))
                {
                    return true;
                }
                else if ((twoWeeksAgo <= x.Date && x.Date < lastWeek) && (twoWeeksAgo <= y.Date && y.Date < lastWeek))
                {
                    return true;
                }
                else if ((threeWeeksAgo <= x.Date && x.Date < twoWeeksAgo) && (threeWeeksAgo <= y.Date && y.Date < twoWeeksAgo))
                {
                    return true;
                }
                else if ((lastMonth <= x.Date && x.Date < threeWeeksAgo) && (lastMonth <= y.Date && y.Date < threeWeeksAgo))
                {
                    return true;
                }
                return false;
            }
            else if (x.Year == y.Year)
            {
                return true;
            }
            return false;

        }

        public override string GroupName(DateTime value)
        {
            if (value.Date == today)
                return samplePage.GetObjectWrapper("WebHierarchicalDataGrid","WebHierarchicalDataGrid_CustomGroupByDate_Today").ToString();
            if (value.Date == yesterday)
            {
                return samplePage.GetObjectWrapper("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_CustomGroupByDate_Yesterday");
            }
            if (firstDayOfWeek <= value.Date && value.Date < yesterday)
            {
                return value.ToString("dddd");
            }
            if (lastWeek <= value.Date && value.Date < firstDayOfWeek)
            {
                return samplePage.GetObjectWrapper("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_CustomGroupByDate_LastWeek");
            }
            if (twoWeeksAgo <= value.Date && value.Date < lastWeek)
            {
                return samplePage.GetObjectWrapper("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_CustomGroupByDate_TwoWeeksAgo");
            }
            if (threeWeeksAgo < value.Date && value.Date < twoWeeksAgo)
            {
                return samplePage.GetObjectWrapper("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_CustomGroupByDate_ThreeWeeksAgo");
            }
            if (lastMonth <= value.Date && value.Date < threeWeeksAgo)
            {
                return samplePage.GetObjectWrapper("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_CustomGroupByDate_LastMonth");
            }

            return samplePage.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_CustomGroupByDate_Older") + " " + value.Year.ToString();
        }
    }

    private class Order
    {
        private int _orderId;
        private DateTime _orderDate;
        private DateTime _requiredDate;
        private string _shipVia;

        public int OrderID { get { return _orderId; } set { _orderId = value; } }

        public DateTime OrderDate
        {
            get { return _orderDate; }
            set { _orderDate = value; }
        }

        public DateTime RequiredDate
        {
            get { return _requiredDate; }
            set { _requiredDate = value; }
        }

        public string ShipVia
        {
            get { return _shipVia; }
            set { _shipVia = value; }
        }

        public Order(int id, DateTime orderDate, DateTime requiredDate, string shipVia)
        {
            _orderId = id;
            _orderDate = orderDate;
            _requiredDate = requiredDate;
            _shipVia = shipVia;
        }
    }
}
