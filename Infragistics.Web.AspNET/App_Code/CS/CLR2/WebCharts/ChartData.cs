﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Runtime.Serialization;
using System.Xml;


namespace WebSamplesCS.WebCharts
{
/// <summary>
/// Summary description for ChartData
/// </summary>
[Serializable()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
[System.Diagnostics.DebuggerStepThrough()]
[System.ComponentModel.ToolboxItem(true)]
public class ChartData : DataSet
{

    private BoxDataDataTable tableBoxData;

    private RadarDataDataTable tableRadarData;

    private StepAreaDataDataTable tableStepAreaData;

    private ConcentricPieDataDataTable tableConcentricPieData;

    private CandleDataDataTable tableCandleData;

    private GanttDataDataTable tableGanttData;

    private BubbleScatterDataDataTable tableBubbleScatterData;

    private HeatDataDataTable tableHeatData;

    private LineAreaDataDataTable tableLineAreaData;

    private PieDataDataTable tablePieData;

    private BarColumnDataDataTable tableBarColumnData;

    private _3DLineAreaDataDataTable table_3DLineAreaData;

    private ProbabilityDataDataTable tableProbabilityData;

    private PolarDataDataTable tablePolarData;

    private _3LinesDataDataTable table3LinesData;

    public ChartData()
    {
        this.InitClass();
        System.ComponentModel.CollectionChangeEventHandler schemaChangedHandler = new System.ComponentModel.CollectionChangeEventHandler(this.SchemaChanged);
        this.Tables.CollectionChanged += schemaChangedHandler;
        this.Relations.CollectionChanged += schemaChangedHandler;
    }

    protected ChartData(SerializationInfo info, StreamingContext context)
    {
        string strSchema = ((string)(info.GetValue("XmlSchema", typeof(string))));
        if ((strSchema != null))
        {
            DataSet ds = new DataSet();
            ds.ReadXmlSchema(new XmlTextReader(new System.IO.StringReader(strSchema)));
            if ((ds.Tables["BoxData"] != null))
            {
                this.Tables.Add(new BoxDataDataTable(ds.Tables["BoxData"]));
            }
            if ((ds.Tables["RadarData"] != null))
            {
                this.Tables.Add(new RadarDataDataTable(ds.Tables["RadarData"]));
            }
            if ((ds.Tables["StepAreaData"] != null))
            {
                this.Tables.Add(new StepAreaDataDataTable(ds.Tables["StepAreaData"]));
            }
            if ((ds.Tables["ConcentricPieData"] != null))
            {
                this.Tables.Add(new ConcentricPieDataDataTable(ds.Tables["ConcentricPieData"]));
            }
            if ((ds.Tables["CandleData"] != null))
            {
                this.Tables.Add(new CandleDataDataTable(ds.Tables["CandleData"]));
            }
            if ((ds.Tables["GanttData"] != null))
            {
                this.Tables.Add(new GanttDataDataTable(ds.Tables["GanttData"]));
            }
            if ((ds.Tables["BubbleScatterData"] != null))
            {
                this.Tables.Add(new BubbleScatterDataDataTable(ds.Tables["BubbleScatterData"]));
            }
            if ((ds.Tables["HeatData"] != null))
            {
                this.Tables.Add(new HeatDataDataTable(ds.Tables["HeatData"]));
            }
            if ((ds.Tables["LineAreaData"] != null))
            {
                this.Tables.Add(new LineAreaDataDataTable(ds.Tables["LineAreaData"]));
            }
            if ((ds.Tables["PieData"] != null))
            {
                this.Tables.Add(new PieDataDataTable(ds.Tables["PieData"]));
            }
            if ((ds.Tables["BarColumnData"] != null))
            {
                this.Tables.Add(new BarColumnDataDataTable(ds.Tables["BarColumnData"]));
            }
            if ((ds.Tables["3DLineAreaData"] != null))
            {
                this.Tables.Add(new _3DLineAreaDataDataTable(ds.Tables["3DLineAreaData"]));
            }
            if ((ds.Tables["ProbabilityData"] != null))
            {
                this.Tables.Add(new ProbabilityDataDataTable(ds.Tables["ProbabilityData"]));
            }
            if ((ds.Tables["PolarData"] != null))
            {
                this.Tables.Add(new PolarDataDataTable(ds.Tables["PolarData"]));
            }
            if ((ds.Tables["_3LinesData"] != null))
            {
                this.Tables.Add(new _3LinesDataDataTable(ds.Tables["_3LinesData"]));
            }
            this.DataSetName = ds.DataSetName;
            this.Prefix = ds.Prefix;
            this.Namespace = ds.Namespace;
            this.Locale = ds.Locale;
            this.CaseSensitive = ds.CaseSensitive;
            this.EnforceConstraints = ds.EnforceConstraints;
            this.Merge(ds, false, System.Data.MissingSchemaAction.Add);
            this.InitVars();
        }
        else
        {
            this.InitClass();
        }
        this.GetSerializationData(info, context);
        System.ComponentModel.CollectionChangeEventHandler schemaChangedHandler = new System.ComponentModel.CollectionChangeEventHandler(this.SchemaChanged);
        this.Tables.CollectionChanged += schemaChangedHandler;
        this.Relations.CollectionChanged += schemaChangedHandler;
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public BoxDataDataTable BoxData
    {
        get
        {
            return this.tableBoxData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public RadarDataDataTable RadarData
    {
        get
        {
            return this.tableRadarData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public StepAreaDataDataTable StepAreaData
    {
        get
        {
            return this.tableStepAreaData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public ConcentricPieDataDataTable ConcentricPieData
    {
        get
        {
            return this.tableConcentricPieData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public CandleDataDataTable CandleData
    {
        get
        {
            return this.tableCandleData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public GanttDataDataTable GanttData
    {
        get
        {
            return this.tableGanttData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public BubbleScatterDataDataTable BubbleScatterData
    {
        get
        {
            return this.tableBubbleScatterData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public HeatDataDataTable HeatData
    {
        get
        {
            return this.tableHeatData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public LineAreaDataDataTable LineAreaData
    {
        get
        {
            return this.tableLineAreaData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public PieDataDataTable PieData
    {
        get
        {
            return this.tablePieData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public BarColumnDataDataTable BarColumnData
    {
        get
        {
            return this.tableBarColumnData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public _3DLineAreaDataDataTable _3DLineAreaData
    {
        get
        {
            return this.table_3DLineAreaData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public ProbabilityDataDataTable ProbabilityData
    {
        get
        {
            return this.tableProbabilityData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public PolarDataDataTable PolarData
    {
        get
        {
            return this.tablePolarData;
        }
    }

    [System.ComponentModel.Browsable(false)]
    [System.ComponentModel.DesignerSerializationVisibilityAttribute(System.ComponentModel.DesignerSerializationVisibility.Content)]
    public _3LinesDataDataTable _3LinesData
    {
        get
        {
            return this.table3LinesData;
        }
    }

    public override DataSet Clone()
    {
        ChartData cln = ((ChartData)(base.Clone()));
        cln.InitVars();
        return cln;
    }

    protected override bool ShouldSerializeTables()
    {
        return false;
    }

    protected override bool ShouldSerializeRelations()
    {
        return false;
    }

    protected override void ReadXmlSerializable(XmlReader reader)
    {
        this.Reset();
        DataSet ds = new DataSet();
        ds.ReadXml(reader);
        if ((ds.Tables["BoxData"] != null))
        {
            this.Tables.Add(new BoxDataDataTable(ds.Tables["BoxData"]));
        }
        if ((ds.Tables["RadarData"] != null))
        {
            this.Tables.Add(new RadarDataDataTable(ds.Tables["RadarData"]));
        }
        if ((ds.Tables["StepAreaData"] != null))
        {
            this.Tables.Add(new StepAreaDataDataTable(ds.Tables["StepAreaData"]));
        }
        if ((ds.Tables["ConcentricPieData"] != null))
        {
            this.Tables.Add(new ConcentricPieDataDataTable(ds.Tables["ConcentricPieData"]));
        }
        if ((ds.Tables["CandleData"] != null))
        {
            this.Tables.Add(new CandleDataDataTable(ds.Tables["CandleData"]));
        }
        if ((ds.Tables["GanttData"] != null))
        {
            this.Tables.Add(new GanttDataDataTable(ds.Tables["GanttData"]));
        }
        if ((ds.Tables["BubbleScatterData"] != null))
        {
            this.Tables.Add(new BubbleScatterDataDataTable(ds.Tables["BubbleScatterData"]));
        }
        if ((ds.Tables["HeatData"] != null))
        {
            this.Tables.Add(new HeatDataDataTable(ds.Tables["HeatData"]));
        }
        if ((ds.Tables["LineAreaData"] != null))
        {
            this.Tables.Add(new LineAreaDataDataTable(ds.Tables["LineAreaData"]));
        }
        if ((ds.Tables["PieData"] != null))
        {
            this.Tables.Add(new PieDataDataTable(ds.Tables["PieData"]));
        }
        if ((ds.Tables["BarColumnData"] != null))
        {
            this.Tables.Add(new BarColumnDataDataTable(ds.Tables["BarColumnData"]));
        }
        if ((ds.Tables["3DLineAreaData"] != null))
        {
            this.Tables.Add(new _3DLineAreaDataDataTable(ds.Tables["3DLineAreaData"]));
        }
        if ((ds.Tables["ProbabilityData"] != null))
        {
            this.Tables.Add(new ProbabilityDataDataTable(ds.Tables["ProbabilityData"]));
        }
        if ((ds.Tables["PolarData"] != null))
        {
            this.Tables.Add(new PolarDataDataTable(ds.Tables["PolarData"]));
        }
        if ((ds.Tables["_3LinesData"] != null))
        {
            this.Tables.Add(new _3LinesDataDataTable(ds.Tables["_3LinesData"]));
        }
        this.DataSetName = ds.DataSetName;
        this.Prefix = ds.Prefix;
        this.Namespace = ds.Namespace;
        this.Locale = ds.Locale;
        this.CaseSensitive = ds.CaseSensitive;
        this.EnforceConstraints = ds.EnforceConstraints;
        this.Merge(ds, false, System.Data.MissingSchemaAction.Add);
        this.InitVars();
    }

    protected override System.Xml.Schema.XmlSchema GetSchemaSerializable()
    {
        System.IO.MemoryStream stream = new System.IO.MemoryStream();
        this.WriteXmlSchema(new XmlTextWriter(stream, null));
        stream.Position = 0;
        return System.Xml.Schema.XmlSchema.Read(new XmlTextReader(stream), null);
    }

    internal void InitVars()
    {
        this.tableBoxData = ((BoxDataDataTable)(this.Tables["BoxData"]));
        if ((this.tableBoxData != null))
        {
            this.tableBoxData.InitVars();
        }
        this.tableRadarData = ((RadarDataDataTable)(this.Tables["RadarData"]));
        if ((this.tableRadarData != null))
        {
            this.tableRadarData.InitVars();
        }
        this.tableStepAreaData = ((StepAreaDataDataTable)(this.Tables["StepAreaData"]));
        if ((this.tableStepAreaData != null))
        {
            this.tableStepAreaData.InitVars();
        }
        this.tableConcentricPieData = ((ConcentricPieDataDataTable)(this.Tables["ConcentricPieData"]));
        if ((this.tableConcentricPieData != null))
        {
            this.tableConcentricPieData.InitVars();
        }
        this.tableCandleData = ((CandleDataDataTable)(this.Tables["CandleData"]));
        if ((this.tableCandleData != null))
        {
            this.tableCandleData.InitVars();
        }
        this.tableGanttData = ((GanttDataDataTable)(this.Tables["GanttData"]));
        if ((this.tableGanttData != null))
        {
            this.tableGanttData.InitVars();
        }
        this.tableBubbleScatterData = ((BubbleScatterDataDataTable)(this.Tables["BubbleScatterData"]));
        if ((this.tableBubbleScatterData != null))
        {
            this.tableBubbleScatterData.InitVars();
        }
        this.tableHeatData = ((HeatDataDataTable)(this.Tables["HeatData"]));
        if ((this.tableHeatData != null))
        {
            this.tableHeatData.InitVars();
        }
        this.tableLineAreaData = ((LineAreaDataDataTable)(this.Tables["LineAreaData"]));
        if ((this.tableLineAreaData != null))
        {
            this.tableLineAreaData.InitVars();
        }
        this.tablePieData = ((PieDataDataTable)(this.Tables["PieData"]));
        if ((this.tablePieData != null))
        {
            this.tablePieData.InitVars();
        }
        this.tableBarColumnData = ((BarColumnDataDataTable)(this.Tables["BarColumnData"]));
        if ((this.tableBarColumnData != null))
        {
            this.tableBarColumnData.InitVars();
        }
        this.table_3DLineAreaData = ((_3DLineAreaDataDataTable)(this.Tables["3DLineAreaData"]));
        if ((this.table_3DLineAreaData != null))
        {
            this.table_3DLineAreaData.InitVars();
        }
        this.tableProbabilityData = ((ProbabilityDataDataTable)(this.Tables["ProbabilityData"]));
        if ((this.tableProbabilityData != null))
        {
            this.tableProbabilityData.InitVars();
        }
        this.table3LinesData = ((_3LinesDataDataTable)(this.Tables["_3LinesData"]));
        if ((this.table3LinesData != null))
        {
            this.table3LinesData.InitVars();
        }
    }

    private void InitClass()
    {
        this.DataSetName = "ChartData";
        this.Prefix = "";
        this.Namespace = "http://www.tempuri.org/ChartData.xsd";
        this.Locale = new System.Globalization.CultureInfo("en-US");
        this.CaseSensitive = false;
        this.EnforceConstraints = true;
        this.tableBoxData = new BoxDataDataTable();
        this.Tables.Add(this.tableBoxData);
        this.tableRadarData = new RadarDataDataTable();
        this.Tables.Add(this.tableRadarData);
        this.tableStepAreaData = new StepAreaDataDataTable();
        this.Tables.Add(this.tableStepAreaData);
        this.tableConcentricPieData = new ConcentricPieDataDataTable();
        this.Tables.Add(this.tableConcentricPieData);
        this.tableCandleData = new CandleDataDataTable();
        this.Tables.Add(this.tableCandleData);
        this.tableGanttData = new GanttDataDataTable();
        this.Tables.Add(this.tableGanttData);
        this.tableBubbleScatterData = new BubbleScatterDataDataTable();
        this.Tables.Add(this.tableBubbleScatterData);
        this.tableHeatData = new HeatDataDataTable();
        this.Tables.Add(this.tableHeatData);
        this.tableLineAreaData = new LineAreaDataDataTable();
        this.Tables.Add(this.tableLineAreaData);
        this.tablePieData = new PieDataDataTable();
        this.Tables.Add(this.tablePieData);
        this.tableBarColumnData = new BarColumnDataDataTable();
        this.Tables.Add(this.tableBarColumnData);
        this.table_3DLineAreaData = new _3DLineAreaDataDataTable();
        this.Tables.Add(this.table_3DLineAreaData);
        this.tableProbabilityData = new ProbabilityDataDataTable();
        this.Tables.Add(this.tableProbabilityData);
        this.tablePolarData = new PolarDataDataTable();
        this.Tables.Add(this.tablePolarData);
        this.table3LinesData = new _3LinesDataDataTable();
        this.Tables.Add(this.table3LinesData);
    }

    private bool ShouldSerializeBoxData()
    {
        return false;
    }

    private bool ShouldSerializeRadarData()
    {
        return false;
    }

    private bool ShouldSerializeStepAreaData()
    {
        return false;
    }

    private bool ShouldSerializeConcentricPieData()
    {
        return false;
    }

    private bool ShouldSerializeCandleData()
    {
        return false;
    }

    private bool ShouldSerializeGanttData()
    {
        return false;
    }

    private bool ShouldSerializeBubbleScatterData()
    {
        return false;
    }

    private bool ShouldSerializeHeatData()
    {
        return false;
    }

    private bool ShouldSerializeLineAreaData()
    {
        return false;
    }

    private bool ShouldSerializePieData()
    {
        return false;
    }

    private bool ShouldSerializeBarColumnData()
    {
        return false;
    }

    private bool ShouldSerialize_3DLineAreaData()
    {
        return false;
    }

    private bool ShouldSerializeProbabilityData()
    {
        return false;
    }

    private bool ShouldSerializePolarData()
    {
        return false;
    }

    private bool ShouldSerialize_3LinesData()
    {
        return false;
    }

    private void SchemaChanged(object sender, System.ComponentModel.CollectionChangeEventArgs e)
    {
        if ((e.Action == System.ComponentModel.CollectionChangeAction.Remove))
        {
            this.InitVars();
        }
    }

    public delegate void BoxDataRowChangeEventHandler(object sender, BoxDataRowChangeEvent e);

    public delegate void RadarDataRowChangeEventHandler(object sender, RadarDataRowChangeEvent e);

    public delegate void StepAreaDataRowChangeEventHandler(object sender, StepAreaDataRowChangeEvent e);

    public delegate void ConcentricPieDataRowChangeEventHandler(object sender, ConcentricPieDataRowChangeEvent e);

    public delegate void CandleDataRowChangeEventHandler(object sender, CandleDataRowChangeEvent e);

    public delegate void GanttDataRowChangeEventHandler(object sender, GanttDataRowChangeEvent e);

    public delegate void BubbleScatterDataRowChangeEventHandler(object sender, BubbleScatterDataRowChangeEvent e);

    public delegate void HeatDataRowChangeEventHandler(object sender, HeatDataRowChangeEvent e);

    public delegate void LineAreaDataRowChangeEventHandler(object sender, LineAreaDataRowChangeEvent e);

    public delegate void PieDataRowChangeEventHandler(object sender, PieDataRowChangeEvent e);

    public delegate void BarColumnDataRowChangeEventHandler(object sender, BarColumnDataRowChangeEvent e);

    public delegate void _3DLineAreaDataRowChangeEventHandler(object sender, _3DLineAreaDataRowChangeEvent e);

    public delegate void ProbabilityDataRowChangeEventHandler(object sender, ProbabilityDataRowChangeEvent e);

    public delegate void PolarDataRowChangeEventHandler(object sender, PolarDataRowChangeEvent e);

    public delegate void _3LinesDataRowChangeEventHandler(object sender, _3LinesDataRowChangeEvent e);

    [System.Diagnostics.DebuggerStepThrough()]
    public class BoxDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnColumn1;

        private DataColumn columnColumn2;

        private DataColumn columnColumn3;

        private DataColumn columnColumn4;

        private DataColumn columnColumn5;

        internal BoxDataDataTable() :
            base("BoxData")
        {
            this.InitClass();
        }

        internal BoxDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn Column1Column
        {
            get
            {
                return this.columnColumn1;
            }
        }

        internal DataColumn Column2Column
        {
            get
            {
                return this.columnColumn2;
            }
        }

        internal DataColumn Column3Column
        {
            get
            {
                return this.columnColumn3;
            }
        }

        internal DataColumn Column4Column
        {
            get
            {
                return this.columnColumn4;
            }
        }

        internal DataColumn Column5Column
        {
            get
            {
                return this.columnColumn5;
            }
        }

        public BoxDataRow this[int index]
        {
            get
            {
                return ((BoxDataRow)(this.Rows[index]));
            }
        }

        public event BoxDataRowChangeEventHandler BoxDataRowChanged;

        public event BoxDataRowChangeEventHandler BoxDataRowChanging;

        public event BoxDataRowChangeEventHandler BoxDataRowDeleted;

        public event BoxDataRowChangeEventHandler BoxDataRowDeleting;

        public void AddBoxDataRow(BoxDataRow row)
        {
            this.Rows.Add(row);
        }

        public BoxDataRow AddBoxDataRow(int Column1, int Column2, int Column3, int Column4, int Column5)
        {
            BoxDataRow rowBoxDataRow = ((BoxDataRow)(this.NewRow()));
            rowBoxDataRow.ItemArray = new object[] {
                        Column1,
                        Column2,
                        Column3,
                        Column4,
                        Column5};
            this.Rows.Add(rowBoxDataRow);
            return rowBoxDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            BoxDataDataTable cln = ((BoxDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new BoxDataDataTable();
        }

        internal void InitVars()
        {
            this.columnColumn1 = this.Columns["Column1"];
            this.columnColumn2 = this.Columns["Column2"];
            this.columnColumn3 = this.Columns["Column3"];
            this.columnColumn4 = this.Columns["Column4"];
            this.columnColumn5 = this.Columns["Column5"];
        }

        private void InitClass()
        {
            this.columnColumn1 = new DataColumn("Column1", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnColumn1);
            this.columnColumn2 = new DataColumn("Column2", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnColumn2);
            this.columnColumn3 = new DataColumn("Column3", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnColumn3);
            this.columnColumn4 = new DataColumn("Column4", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnColumn4);
            this.columnColumn5 = new DataColumn("Column5", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnColumn5);
        }

        public BoxDataRow NewBoxDataRow()
        {
            return ((BoxDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new BoxDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(BoxDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this.BoxDataRowChanged != null))
            {
                this.BoxDataRowChanged(this, new BoxDataRowChangeEvent(((BoxDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this.BoxDataRowChanging != null))
            {
                this.BoxDataRowChanging(this, new BoxDataRowChangeEvent(((BoxDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this.BoxDataRowDeleted != null))
            {
                this.BoxDataRowDeleted(this, new BoxDataRowChangeEvent(((BoxDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this.BoxDataRowDeleting != null))
            {
                this.BoxDataRowDeleting(this, new BoxDataRowChangeEvent(((BoxDataRow)(e.Row)), e.Action));
            }
        }

        public void RemoveBoxDataRow(BoxDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class BoxDataRow : DataRow
    {

        private BoxDataDataTable tableBoxData;

        internal BoxDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.tableBoxData = ((BoxDataDataTable)(this.Table));
        }

        public int Column1
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableBoxData.Column1Column]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableBoxData.Column1Column] = value;
            }
        }

        public int Column2
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableBoxData.Column2Column]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableBoxData.Column2Column] = value;
            }
        }

        public int Column3
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableBoxData.Column3Column]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableBoxData.Column3Column] = value;
            }
        }

        public int Column4
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableBoxData.Column4Column]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableBoxData.Column4Column] = value;
            }
        }

        public int Column5
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableBoxData.Column5Column]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableBoxData.Column5Column] = value;
            }
        }

        public bool IsColumn1Null()
        {
            return this.IsNull(this.tableBoxData.Column1Column);
        }

        public void SetColumn1Null()
        {
            this[this.tableBoxData.Column1Column] = System.Convert.DBNull;
        }

        public bool IsColumn2Null()
        {
            return this.IsNull(this.tableBoxData.Column2Column);
        }

        public void SetColumn2Null()
        {
            this[this.tableBoxData.Column2Column] = System.Convert.DBNull;
        }

        public bool IsColumn3Null()
        {
            return this.IsNull(this.tableBoxData.Column3Column);
        }

        public void SetColumn3Null()
        {
            this[this.tableBoxData.Column3Column] = System.Convert.DBNull;
        }

        public bool IsColumn4Null()
        {
            return this.IsNull(this.tableBoxData.Column4Column);
        }

        public void SetColumn4Null()
        {
            this[this.tableBoxData.Column4Column] = System.Convert.DBNull;
        }

        public bool IsColumn5Null()
        {
            return this.IsNull(this.tableBoxData.Column5Column);
        }

        public void SetColumn5Null()
        {
            this[this.tableBoxData.Column5Column] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class BoxDataRowChangeEvent : EventArgs
    {

        private BoxDataRow eventRow;

        private DataRowAction eventAction;

        public BoxDataRowChangeEvent(BoxDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public BoxDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class RadarDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnLatitude;

        private DataColumn columnLongitude;

        private DataColumn columnCrime_Rate;

        private DataColumn columnDeath_Rate;

        private DataColumn columnEducation_Rate;

        internal RadarDataDataTable() :
            base("RadarData")
        {
            this.InitClass();
        }

        internal RadarDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn LatitudeColumn
        {
            get
            {
                return this.columnLatitude;
            }
        }

        internal DataColumn LongitudeColumn
        {
            get
            {
                return this.columnLongitude;
            }
        }

        internal DataColumn Crime_RateColumn
        {
            get
            {
                return this.columnCrime_Rate;
            }
        }

        internal DataColumn Death_RateColumn
        {
            get
            {
                return this.columnDeath_Rate;
            }
        }

        internal DataColumn Education_RateColumn
        {
            get
            {
                return this.columnEducation_Rate;
            }
        }

        public RadarDataRow this[int index]
        {
            get
            {
                return ((RadarDataRow)(this.Rows[index]));
            }
        }

        public event RadarDataRowChangeEventHandler RadarDataRowChanged;

        public event RadarDataRowChangeEventHandler RadarDataRowChanging;

        public event RadarDataRowChangeEventHandler RadarDataRowDeleted;

        public event RadarDataRowChangeEventHandler RadarDataRowDeleting;

        public void AddRadarDataRow(RadarDataRow row)
        {
            this.Rows.Add(row);
        }

        public RadarDataRow AddRadarDataRow(System.Single Latitude, int Longitude, System.Double Crime_Rate, int Death_Rate, int Education_Rate)
        {
            RadarDataRow rowRadarDataRow = ((RadarDataRow)(this.NewRow()));
            rowRadarDataRow.ItemArray = new object[] {
                        Latitude,
                        Longitude,
                        Crime_Rate,
                        Death_Rate,
                        Education_Rate};
            this.Rows.Add(rowRadarDataRow);
            return rowRadarDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            RadarDataDataTable cln = ((RadarDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new RadarDataDataTable();
        }

        internal void InitVars()
        {
            this.columnLatitude = this.Columns["Latitude"];
            this.columnLongitude = this.Columns["Longitude"];
            this.columnCrime_Rate = this.Columns["Crime Rate"];
            this.columnDeath_Rate = this.Columns["Death Rate"];
            this.columnEducation_Rate = this.Columns["Education Rate"];
        }

        private void InitClass()
        {
            this.columnLatitude = new DataColumn("Latitude", typeof(System.Single), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnLatitude);
            this.columnLongitude = new DataColumn("Longitude", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnLongitude);
            this.columnCrime_Rate = new DataColumn("Crime Rate", typeof(System.Double), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnCrime_Rate);
            this.columnDeath_Rate = new DataColumn("Death Rate", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnDeath_Rate);
            this.columnEducation_Rate = new DataColumn("Education Rate", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnEducation_Rate);
        }

        public RadarDataRow NewRadarDataRow()
        {
            return ((RadarDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new RadarDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(RadarDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this.RadarDataRowChanged != null))
            {
                this.RadarDataRowChanged(this, new RadarDataRowChangeEvent(((RadarDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this.RadarDataRowChanging != null))
            {
                this.RadarDataRowChanging(this, new RadarDataRowChangeEvent(((RadarDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this.RadarDataRowDeleted != null))
            {
                this.RadarDataRowDeleted(this, new RadarDataRowChangeEvent(((RadarDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this.RadarDataRowDeleting != null))
            {
                this.RadarDataRowDeleting(this, new RadarDataRowChangeEvent(((RadarDataRow)(e.Row)), e.Action));
            }
        }

        public void RemoveRadarDataRow(RadarDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class RadarDataRow : DataRow
    {

        private RadarDataDataTable tableRadarData;

        internal RadarDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.tableRadarData = ((RadarDataDataTable)(this.Table));
        }

        public System.Single Latitude
        {
            get
            {
                try
                {
                    return ((System.Single)(this[this.tableRadarData.LatitudeColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableRadarData.LatitudeColumn] = value;
            }
        }

        public int Longitude
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableRadarData.LongitudeColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableRadarData.LongitudeColumn] = value;
            }
        }

        public System.Double Crime_Rate
        {
            get
            {
                try
                {
                    return ((System.Double)(this[this.tableRadarData.Crime_RateColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableRadarData.Crime_RateColumn] = value;
            }
        }

        public int Death_Rate
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableRadarData.Death_RateColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableRadarData.Death_RateColumn] = value;
            }
        }

        public int Education_Rate
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableRadarData.Education_RateColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableRadarData.Education_RateColumn] = value;
            }
        }

        public bool IsLatitudeNull()
        {
            return this.IsNull(this.tableRadarData.LatitudeColumn);
        }

        public void SetLatitudeNull()
        {
            this[this.tableRadarData.LatitudeColumn] = System.Convert.DBNull;
        }

        public bool IsLongitudeNull()
        {
            return this.IsNull(this.tableRadarData.LongitudeColumn);
        }

        public void SetLongitudeNull()
        {
            this[this.tableRadarData.LongitudeColumn] = System.Convert.DBNull;
        }

        public bool IsCrime_RateNull()
        {
            return this.IsNull(this.tableRadarData.Crime_RateColumn);
        }

        public void SetCrime_RateNull()
        {
            this[this.tableRadarData.Crime_RateColumn] = System.Convert.DBNull;
        }

        public bool IsDeath_RateNull()
        {
            return this.IsNull(this.tableRadarData.Death_RateColumn);
        }

        public void SetDeath_RateNull()
        {
            this[this.tableRadarData.Death_RateColumn] = System.Convert.DBNull;
        }

        public bool IsEducation_RateNull()
        {
            return this.IsNull(this.tableRadarData.Education_RateColumn);
        }

        public void SetEducation_RateNull()
        {
            this[this.tableRadarData.Education_RateColumn] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class RadarDataRowChangeEvent : EventArgs
    {

        private RadarDataRow eventRow;

        private DataRowAction eventAction;

        public RadarDataRowChangeEvent(RadarDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public RadarDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class StepAreaDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnStockDate;

        private DataColumn columnStockOpen;

        private DataColumn columnStockClose;

        internal StepAreaDataDataTable() :
            base("StepAreaData")
        {
            this.InitClass();
        }

        internal StepAreaDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn StockDateColumn
        {
            get
            {
                return this.columnStockDate;
            }
        }

        internal DataColumn StockOpenColumn
        {
            get
            {
                return this.columnStockOpen;
            }
        }

        internal DataColumn StockCloseColumn
        {
            get
            {
                return this.columnStockClose;
            }
        }

        public StepAreaDataRow this[int index]
        {
            get
            {
                return ((StepAreaDataRow)(this.Rows[index]));
            }
        }

        public event StepAreaDataRowChangeEventHandler StepAreaDataRowChanged;

        public event StepAreaDataRowChangeEventHandler StepAreaDataRowChanging;

        public event StepAreaDataRowChangeEventHandler StepAreaDataRowDeleted;

        public event StepAreaDataRowChangeEventHandler StepAreaDataRowDeleting;

        public void AddStepAreaDataRow(StepAreaDataRow row)
        {
            this.Rows.Add(row);
        }

        public StepAreaDataRow AddStepAreaDataRow(System.DateTime StockDate, int StockOpen, int StockClose)
        {
            StepAreaDataRow rowStepAreaDataRow = ((StepAreaDataRow)(this.NewRow()));
            rowStepAreaDataRow.ItemArray = new object[] {
                        StockDate,
                        StockOpen,
                        StockClose};
            this.Rows.Add(rowStepAreaDataRow);
            return rowStepAreaDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            StepAreaDataDataTable cln = ((StepAreaDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new StepAreaDataDataTable();
        }

        internal void InitVars()
        {
            this.columnStockDate = this.Columns["StockDate"];
            this.columnStockOpen = this.Columns["StockOpen"];
            this.columnStockClose = this.Columns["StockClose"];
        }

        private void InitClass()
        {
            this.columnStockDate = new DataColumn("StockDate", typeof(System.DateTime), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnStockDate);
            this.columnStockOpen = new DataColumn("StockOpen", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnStockOpen);
            this.columnStockClose = new DataColumn("StockClose", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnStockClose);
        }

        public StepAreaDataRow NewStepAreaDataRow()
        {
            return ((StepAreaDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new StepAreaDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(StepAreaDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this.StepAreaDataRowChanged != null))
            {
                this.StepAreaDataRowChanged(this, new StepAreaDataRowChangeEvent(((StepAreaDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this.StepAreaDataRowChanging != null))
            {
                this.StepAreaDataRowChanging(this, new StepAreaDataRowChangeEvent(((StepAreaDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this.StepAreaDataRowDeleted != null))
            {
                this.StepAreaDataRowDeleted(this, new StepAreaDataRowChangeEvent(((StepAreaDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this.StepAreaDataRowDeleting != null))
            {
                this.StepAreaDataRowDeleting(this, new StepAreaDataRowChangeEvent(((StepAreaDataRow)(e.Row)), e.Action));
            }
        }

        public void RemoveStepAreaDataRow(StepAreaDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class StepAreaDataRow : DataRow
    {

        private StepAreaDataDataTable tableStepAreaData;

        internal StepAreaDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.tableStepAreaData = ((StepAreaDataDataTable)(this.Table));
        }

        public System.DateTime StockDate
        {
            get
            {
                try
                {
                    return ((System.DateTime)(this[this.tableStepAreaData.StockDateColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableStepAreaData.StockDateColumn] = value;
            }
        }

        public int StockOpen
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableStepAreaData.StockOpenColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableStepAreaData.StockOpenColumn] = value;
            }
        }

        public int StockClose
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableStepAreaData.StockCloseColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableStepAreaData.StockCloseColumn] = value;
            }
        }

        public bool IsStockDateNull()
        {
            return this.IsNull(this.tableStepAreaData.StockDateColumn);
        }

        public void SetStockDateNull()
        {
            this[this.tableStepAreaData.StockDateColumn] = System.Convert.DBNull;
        }

        public bool IsStockOpenNull()
        {
            return this.IsNull(this.tableStepAreaData.StockOpenColumn);
        }

        public void SetStockOpenNull()
        {
            this[this.tableStepAreaData.StockOpenColumn] = System.Convert.DBNull;
        }

        public bool IsStockCloseNull()
        {
            return this.IsNull(this.tableStepAreaData.StockCloseColumn);
        }

        public void SetStockCloseNull()
        {
            this[this.tableStepAreaData.StockCloseColumn] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class StepAreaDataRowChangeEvent : EventArgs
    {

        private StepAreaDataRow eventRow;

        private DataRowAction eventAction;

        public StepAreaDataRowChangeEvent(StepAreaDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public StepAreaDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class ConcentricPieDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnProduct;

        private DataColumn columnUnits_Sold_2004;

        private DataColumn columnUnits_Sold_2005;

        private DataColumn columnUnits_Sold_2006;

        internal ConcentricPieDataDataTable() :
            base("ConcentricPieData")
        {
            this.InitClass();
        }

        internal ConcentricPieDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn ProductColumn
        {
            get
            {
                return this.columnProduct;
            }
        }

        internal DataColumn Units_Sold_2004Column
        {
            get
            {
                return this.columnUnits_Sold_2004;
            }
        }

        internal DataColumn Units_Sold_2005Column
        {
            get
            {
                return this.columnUnits_Sold_2005;
            }
        }

        internal DataColumn Units_Sold_2006Column
        {
            get
            {
                return this.columnUnits_Sold_2006;
            }
        }

        public ConcentricPieDataRow this[int index]
        {
            get
            {
                return ((ConcentricPieDataRow)(this.Rows[index]));
            }
        }

        public event ConcentricPieDataRowChangeEventHandler ConcentricPieDataRowChanged;

        public event ConcentricPieDataRowChangeEventHandler ConcentricPieDataRowChanging;

        public event ConcentricPieDataRowChangeEventHandler ConcentricPieDataRowDeleted;

        public event ConcentricPieDataRowChangeEventHandler ConcentricPieDataRowDeleting;

        public void AddConcentricPieDataRow(ConcentricPieDataRow row)
        {
            this.Rows.Add(row);
        }

        public ConcentricPieDataRow AddConcentricPieDataRow(string Product, int Units_Sold_2004, int Units_Sold_2005, int Units_Sold_2006)
        {
            ConcentricPieDataRow rowConcentricPieDataRow = ((ConcentricPieDataRow)(this.NewRow()));
            rowConcentricPieDataRow.ItemArray = new object[] {
                        Product,
                        Units_Sold_2004,
                        Units_Sold_2005,
                        Units_Sold_2006};
            this.Rows.Add(rowConcentricPieDataRow);
            return rowConcentricPieDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            ConcentricPieDataDataTable cln = ((ConcentricPieDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new ConcentricPieDataDataTable();
        }

        internal void InitVars()
        {
            this.columnProduct = this.Columns["Product"];
            this.columnUnits_Sold_2004 = this.Columns["Units Sold 2004"];
            this.columnUnits_Sold_2005 = this.Columns["Units Sold 2005"];
            this.columnUnits_Sold_2006 = this.Columns["Units Sold 2006"];
        }

        private void InitClass()
        {
            this.columnProduct = new DataColumn("Product", typeof(string), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnProduct);
            this.columnUnits_Sold_2004 = new DataColumn("Units Sold 2004", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnUnits_Sold_2004);
            this.columnUnits_Sold_2005 = new DataColumn("Units Sold 2005", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnUnits_Sold_2005);
            this.columnUnits_Sold_2006 = new DataColumn("Units Sold 2006", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnUnits_Sold_2006);
        }

        public ConcentricPieDataRow NewConcentricPieDataRow()
        {
            return ((ConcentricPieDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new ConcentricPieDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(ConcentricPieDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this.ConcentricPieDataRowChanged != null))
            {
                this.ConcentricPieDataRowChanged(this, new ConcentricPieDataRowChangeEvent(((ConcentricPieDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this.ConcentricPieDataRowChanging != null))
            {
                this.ConcentricPieDataRowChanging(this, new ConcentricPieDataRowChangeEvent(((ConcentricPieDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this.ConcentricPieDataRowDeleted != null))
            {
                this.ConcentricPieDataRowDeleted(this, new ConcentricPieDataRowChangeEvent(((ConcentricPieDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this.ConcentricPieDataRowDeleting != null))
            {
                this.ConcentricPieDataRowDeleting(this, new ConcentricPieDataRowChangeEvent(((ConcentricPieDataRow)(e.Row)), e.Action));
            }
        }

        public void RemoveConcentricPieDataRow(ConcentricPieDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class ConcentricPieDataRow : DataRow
    {

        private ConcentricPieDataDataTable tableConcentricPieData;

        internal ConcentricPieDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.tableConcentricPieData = ((ConcentricPieDataDataTable)(this.Table));
        }

        public string Product
        {
            get
            {
                try
                {
                    return ((string)(this[this.tableConcentricPieData.ProductColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableConcentricPieData.ProductColumn] = value;
            }
        }

        public int Units_Sold_2004
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableConcentricPieData.Units_Sold_2004Column]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableConcentricPieData.Units_Sold_2004Column] = value;
            }
        }

        public int Units_Sold_2005
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableConcentricPieData.Units_Sold_2005Column]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableConcentricPieData.Units_Sold_2005Column] = value;
            }
        }

        public int Units_Sold_2006
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableConcentricPieData.Units_Sold_2006Column]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableConcentricPieData.Units_Sold_2006Column] = value;
            }
        }

        public bool IsProductNull()
        {
            return this.IsNull(this.tableConcentricPieData.ProductColumn);
        }

        public void SetProductNull()
        {
            this[this.tableConcentricPieData.ProductColumn] = System.Convert.DBNull;
        }

        public bool IsUnits_Sold_2004Null()
        {
            return this.IsNull(this.tableConcentricPieData.Units_Sold_2004Column);
        }

        public void SetUnits_Sold_2004Null()
        {
            this[this.tableConcentricPieData.Units_Sold_2004Column] = System.Convert.DBNull;
        }

        public bool IsUnits_Sold_2005Null()
        {
            return this.IsNull(this.tableConcentricPieData.Units_Sold_2005Column);
        }

        public void SetUnits_Sold_2005Null()
        {
            this[this.tableConcentricPieData.Units_Sold_2005Column] = System.Convert.DBNull;
        }

        public bool IsUnits_Sold_2006Null()
        {
            return this.IsNull(this.tableConcentricPieData.Units_Sold_2006Column);
        }

        public void SetUnits_Sold_2006Null()
        {
            this[this.tableConcentricPieData.Units_Sold_2006Column] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class ConcentricPieDataRowChangeEvent : EventArgs
    {

        private ConcentricPieDataRow eventRow;

        private DataRowAction eventAction;

        public ConcentricPieDataRowChangeEvent(ConcentricPieDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public ConcentricPieDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class CandleDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnStockDate;

        private DataColumn columnStockOpen;

        private DataColumn columnStockHigh;

        private DataColumn columnStockLow;

        private DataColumn columnStockClose;

        private DataColumn columnStockVolume;

        internal CandleDataDataTable() :
            base("CandleData")
        {
            this.InitClass();
        }

        internal CandleDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn StockDateColumn
        {
            get
            {
                return this.columnStockDate;
            }
        }

        internal DataColumn StockOpenColumn
        {
            get
            {
                return this.columnStockOpen;
            }
        }

        internal DataColumn StockHighColumn
        {
            get
            {
                return this.columnStockHigh;
            }
        }

        internal DataColumn StockLowColumn
        {
            get
            {
                return this.columnStockLow;
            }
        }

        internal DataColumn StockCloseColumn
        {
            get
            {
                return this.columnStockClose;
            }
        }

        internal DataColumn StockVolumeColumn
        {
            get
            {
                return this.columnStockVolume;
            }
        }

        public CandleDataRow this[int index]
        {
            get
            {
                return ((CandleDataRow)(this.Rows[index]));
            }
        }

        public event CandleDataRowChangeEventHandler CandleDataRowChanged;

        public event CandleDataRowChangeEventHandler CandleDataRowChanging;

        public event CandleDataRowChangeEventHandler CandleDataRowDeleted;

        public event CandleDataRowChangeEventHandler CandleDataRowDeleting;

        public void AddCandleDataRow(CandleDataRow row)
        {
            this.Rows.Add(row);
        }

        public CandleDataRow AddCandleDataRow(System.DateTime StockDate, int StockOpen, int StockHigh, int StockLow, int StockClose, int StockVolume)
        {
            CandleDataRow rowCandleDataRow = ((CandleDataRow)(this.NewRow()));
            rowCandleDataRow.ItemArray = new object[] {
                        StockDate,
                        StockOpen,
                        StockHigh,
                        StockLow,
                        StockClose,
                        StockVolume};
            this.Rows.Add(rowCandleDataRow);
            return rowCandleDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            CandleDataDataTable cln = ((CandleDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new CandleDataDataTable();
        }

        internal void InitVars()
        {
            this.columnStockDate = this.Columns["StockDate"];
            this.columnStockOpen = this.Columns["StockOpen"];
            this.columnStockHigh = this.Columns["StockHigh"];
            this.columnStockLow = this.Columns["StockLow"];
            this.columnStockClose = this.Columns["StockClose"];
            this.columnStockVolume = this.Columns["StockVolume"];
        }

        private void InitClass()
        {
            this.columnStockDate = new DataColumn("StockDate", typeof(System.DateTime), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnStockDate);
            this.columnStockOpen = new DataColumn("StockOpen", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnStockOpen);
            this.columnStockHigh = new DataColumn("StockHigh", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnStockHigh);
            this.columnStockLow = new DataColumn("StockLow", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnStockLow);
            this.columnStockClose = new DataColumn("StockClose", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnStockClose);
            this.columnStockVolume = new DataColumn("StockVolume", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnStockVolume);
        }

        public CandleDataRow NewCandleDataRow()
        {
            return ((CandleDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new CandleDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(CandleDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this.CandleDataRowChanged != null))
            {
                this.CandleDataRowChanged(this, new CandleDataRowChangeEvent(((CandleDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this.CandleDataRowChanging != null))
            {
                this.CandleDataRowChanging(this, new CandleDataRowChangeEvent(((CandleDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this.CandleDataRowDeleted != null))
            {
                this.CandleDataRowDeleted(this, new CandleDataRowChangeEvent(((CandleDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this.CandleDataRowDeleting != null))
            {
                this.CandleDataRowDeleting(this, new CandleDataRowChangeEvent(((CandleDataRow)(e.Row)), e.Action));
            }
        }

        public void RemoveCandleDataRow(CandleDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class CandleDataRow : DataRow
    {

        private CandleDataDataTable tableCandleData;

        internal CandleDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.tableCandleData = ((CandleDataDataTable)(this.Table));
        }

        public System.DateTime StockDate
        {
            get
            {
                try
                {
                    return ((System.DateTime)(this[this.tableCandleData.StockDateColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableCandleData.StockDateColumn] = value;
            }
        }

        public int StockOpen
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableCandleData.StockOpenColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableCandleData.StockOpenColumn] = value;
            }
        }

        public int StockHigh
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableCandleData.StockHighColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableCandleData.StockHighColumn] = value;
            }
        }

        public int StockLow
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableCandleData.StockLowColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableCandleData.StockLowColumn] = value;
            }
        }

        public int StockClose
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableCandleData.StockCloseColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableCandleData.StockCloseColumn] = value;
            }
        }

        public int StockVolume
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableCandleData.StockVolumeColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableCandleData.StockVolumeColumn] = value;
            }
        }

        public bool IsStockDateNull()
        {
            return this.IsNull(this.tableCandleData.StockDateColumn);
        }

        public void SetStockDateNull()
        {
            this[this.tableCandleData.StockDateColumn] = System.Convert.DBNull;
        }

        public bool IsStockOpenNull()
        {
            return this.IsNull(this.tableCandleData.StockOpenColumn);
        }

        public void SetStockOpenNull()
        {
            this[this.tableCandleData.StockOpenColumn] = System.Convert.DBNull;
        }

        public bool IsStockHighNull()
        {
            return this.IsNull(this.tableCandleData.StockHighColumn);
        }

        public void SetStockHighNull()
        {
            this[this.tableCandleData.StockHighColumn] = System.Convert.DBNull;
        }

        public bool IsStockLowNull()
        {
            return this.IsNull(this.tableCandleData.StockLowColumn);
        }

        public void SetStockLowNull()
        {
            this[this.tableCandleData.StockLowColumn] = System.Convert.DBNull;
        }

        public bool IsStockCloseNull()
        {
            return this.IsNull(this.tableCandleData.StockCloseColumn);
        }

        public void SetStockCloseNull()
        {
            this[this.tableCandleData.StockCloseColumn] = System.Convert.DBNull;
        }

        public bool IsStockVolumeNull()
        {
            return this.IsNull(this.tableCandleData.StockVolumeColumn);
        }

        public void SetStockVolumeNull()
        {
            this[this.tableCandleData.StockVolumeColumn] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class CandleDataRowChangeEvent : EventArgs
    {

        private CandleDataRow eventRow;

        private DataRowAction eventAction;

        public CandleDataRowChangeEvent(CandleDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public CandleDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class GanttDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnGanttSeries;

        private DataColumn columnGanttTask;

        private DataColumn columnGanttStart;

        private DataColumn columnGanttEnd;

        private DataColumn columnGanttID;

        private DataColumn columnGanttLinkTo;

        private DataColumn columnGanttPercentComplete;

        private DataColumn columnGanttOwner;

        internal GanttDataDataTable() :
            base("GanttData")
        {
            this.InitClass();
        }

        internal GanttDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn GanttSeriesColumn
        {
            get
            {
                return this.columnGanttSeries;
            }
        }

        internal DataColumn GanttTaskColumn
        {
            get
            {
                return this.columnGanttTask;
            }
        }

        internal DataColumn GanttStartColumn
        {
            get
            {
                return this.columnGanttStart;
            }
        }

        internal DataColumn GanttEndColumn
        {
            get
            {
                return this.columnGanttEnd;
            }
        }

        internal DataColumn GanttIDColumn
        {
            get
            {
                return this.columnGanttID;
            }
        }

        internal DataColumn GanttLinkToColumn
        {
            get
            {
                return this.columnGanttLinkTo;
            }
        }

        internal DataColumn GanttPercentCompleteColumn
        {
            get
            {
                return this.columnGanttPercentComplete;
            }
        }

        internal DataColumn GanttOwnerColumn
        {
            get
            {
                return this.columnGanttOwner;
            }
        }

        public GanttDataRow this[int index]
        {
            get
            {
                return ((GanttDataRow)(this.Rows[index]));
            }
        }

        public event GanttDataRowChangeEventHandler GanttDataRowChanged;

        public event GanttDataRowChangeEventHandler GanttDataRowChanging;

        public event GanttDataRowChangeEventHandler GanttDataRowDeleted;

        public event GanttDataRowChangeEventHandler GanttDataRowDeleting;

        public void AddGanttDataRow(GanttDataRow row)
        {
            this.Rows.Add(row);
        }

        public GanttDataRow AddGanttDataRow(string GanttSeries, string GanttTask, System.DateTime GanttStart, System.DateTime GanttEnd, int GanttID, int GanttLinkTo, System.Double GanttPercentComplete, string GanttOwner)
        {
            GanttDataRow rowGanttDataRow = ((GanttDataRow)(this.NewRow()));
            rowGanttDataRow.ItemArray = new object[] {
                        GanttSeries,
                        GanttTask,
                        GanttStart,
                        GanttEnd,
                        GanttID,
                        GanttLinkTo,
                        GanttPercentComplete,
                        GanttOwner};
            this.Rows.Add(rowGanttDataRow);
            return rowGanttDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            GanttDataDataTable cln = ((GanttDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new GanttDataDataTable();
        }

        internal void InitVars()
        {
            this.columnGanttSeries = this.Columns["GanttSeries"];
            this.columnGanttTask = this.Columns["GanttTask"];
            this.columnGanttStart = this.Columns["GanttStart"];
            this.columnGanttEnd = this.Columns["GanttEnd"];
            this.columnGanttID = this.Columns["GanttID"];
            this.columnGanttLinkTo = this.Columns["GanttLinkTo"];
            this.columnGanttPercentComplete = this.Columns["GanttPercentComplete"];
            this.columnGanttOwner = this.Columns["GanttOwner"];
        }

        private void InitClass()
        {
            this.columnGanttSeries = new DataColumn("GanttSeries", typeof(string), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnGanttSeries);
            this.columnGanttTask = new DataColumn("GanttTask", typeof(string), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnGanttTask);
            this.columnGanttStart = new DataColumn("GanttStart", typeof(System.DateTime), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnGanttStart);
            this.columnGanttEnd = new DataColumn("GanttEnd", typeof(System.DateTime), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnGanttEnd);
            this.columnGanttID = new DataColumn("GanttID", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnGanttID);
            this.columnGanttLinkTo = new DataColumn("GanttLinkTo", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnGanttLinkTo);
            this.columnGanttPercentComplete = new DataColumn("GanttPercentComplete", typeof(System.Double), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnGanttPercentComplete);
            this.columnGanttOwner = new DataColumn("GanttOwner", typeof(string), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnGanttOwner);
        }

        public GanttDataRow NewGanttDataRow()
        {
            return ((GanttDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new GanttDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(GanttDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this.GanttDataRowChanged != null))
            {
                this.GanttDataRowChanged(this, new GanttDataRowChangeEvent(((GanttDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this.GanttDataRowChanging != null))
            {
                this.GanttDataRowChanging(this, new GanttDataRowChangeEvent(((GanttDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this.GanttDataRowDeleted != null))
            {
                this.GanttDataRowDeleted(this, new GanttDataRowChangeEvent(((GanttDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this.GanttDataRowDeleting != null))
            {
                this.GanttDataRowDeleting(this, new GanttDataRowChangeEvent(((GanttDataRow)(e.Row)), e.Action));
            }
        }

        public void RemoveGanttDataRow(GanttDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class GanttDataRow : DataRow
    {

        private GanttDataDataTable tableGanttData;

        internal GanttDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.tableGanttData = ((GanttDataDataTable)(this.Table));
        }

        public string GanttSeries
        {
            get
            {
                try
                {
                    return ((string)(this[this.tableGanttData.GanttSeriesColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableGanttData.GanttSeriesColumn] = value;
            }
        }

        public string GanttTask
        {
            get
            {
                try
                {
                    return ((string)(this[this.tableGanttData.GanttTaskColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableGanttData.GanttTaskColumn] = value;
            }
        }

        public System.DateTime GanttStart
        {
            get
            {
                try
                {
                    return ((System.DateTime)(this[this.tableGanttData.GanttStartColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableGanttData.GanttStartColumn] = value;
            }
        }

        public System.DateTime GanttEnd
        {
            get
            {
                try
                {
                    return ((System.DateTime)(this[this.tableGanttData.GanttEndColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableGanttData.GanttEndColumn] = value;
            }
        }

        public int GanttID
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableGanttData.GanttIDColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableGanttData.GanttIDColumn] = value;
            }
        }

        public int GanttLinkTo
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableGanttData.GanttLinkToColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableGanttData.GanttLinkToColumn] = value;
            }
        }

        public System.Double GanttPercentComplete
        {
            get
            {
                try
                {
                    return ((System.Double)(this[this.tableGanttData.GanttPercentCompleteColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableGanttData.GanttPercentCompleteColumn] = value;
            }
        }

        public string GanttOwner
        {
            get
            {
                try
                {
                    return ((string)(this[this.tableGanttData.GanttOwnerColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableGanttData.GanttOwnerColumn] = value;
            }
        }

        public bool IsGanttSeriesNull()
        {
            return this.IsNull(this.tableGanttData.GanttSeriesColumn);
        }

        public void SetGanttSeriesNull()
        {
            this[this.tableGanttData.GanttSeriesColumn] = System.Convert.DBNull;
        }

        public bool IsGanttTaskNull()
        {
            return this.IsNull(this.tableGanttData.GanttTaskColumn);
        }

        public void SetGanttTaskNull()
        {
            this[this.tableGanttData.GanttTaskColumn] = System.Convert.DBNull;
        }

        public bool IsGanttStartNull()
        {
            return this.IsNull(this.tableGanttData.GanttStartColumn);
        }

        public void SetGanttStartNull()
        {
            this[this.tableGanttData.GanttStartColumn] = System.Convert.DBNull;
        }

        public bool IsGanttEndNull()
        {
            return this.IsNull(this.tableGanttData.GanttEndColumn);
        }

        public void SetGanttEndNull()
        {
            this[this.tableGanttData.GanttEndColumn] = System.Convert.DBNull;
        }

        public bool IsGanttIDNull()
        {
            return this.IsNull(this.tableGanttData.GanttIDColumn);
        }

        public void SetGanttIDNull()
        {
            this[this.tableGanttData.GanttIDColumn] = System.Convert.DBNull;
        }

        public bool IsGanttLinkToNull()
        {
            return this.IsNull(this.tableGanttData.GanttLinkToColumn);
        }

        public void SetGanttLinkToNull()
        {
            this[this.tableGanttData.GanttLinkToColumn] = System.Convert.DBNull;
        }

        public bool IsGanttPercentCompleteNull()
        {
            return this.IsNull(this.tableGanttData.GanttPercentCompleteColumn);
        }

        public void SetGanttPercentCompleteNull()
        {
            this[this.tableGanttData.GanttPercentCompleteColumn] = System.Convert.DBNull;
        }

        public bool IsGanttOwnerNull()
        {
            return this.IsNull(this.tableGanttData.GanttOwnerColumn);
        }

        public void SetGanttOwnerNull()
        {
            this[this.tableGanttData.GanttOwnerColumn] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class GanttDataRowChangeEvent : EventArgs
    {

        private GanttDataRow eventRow;

        private DataRowAction eventAction;

        public GanttDataRowChangeEvent(GanttDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public GanttDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class BubbleScatterDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnCrimerate;

        private DataColumn columnLatitude;

        private DataColumn columnLongitude;

        internal BubbleScatterDataDataTable() :
            base("BubbleScatterData")
        {
            this.InitClass();
        }

        internal BubbleScatterDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn CrimerateColumn
        {
            get
            {
                return this.columnCrimerate;
            }
        }

        internal DataColumn LatitudeColumn
        {
            get
            {
                return this.columnLatitude;
            }
        }

        internal DataColumn LongitudeColumn
        {
            get
            {
                return this.columnLongitude;
            }
        }

        public BubbleScatterDataRow this[int index]
        {
            get
            {
                return ((BubbleScatterDataRow)(this.Rows[index]));
            }
        }

        public event BubbleScatterDataRowChangeEventHandler BubbleScatterDataRowChanged;

        public event BubbleScatterDataRowChangeEventHandler BubbleScatterDataRowChanging;

        public event BubbleScatterDataRowChangeEventHandler BubbleScatterDataRowDeleted;

        public event BubbleScatterDataRowChangeEventHandler BubbleScatterDataRowDeleting;

        public void AddBubbleScatterDataRow(BubbleScatterDataRow row)
        {
            this.Rows.Add(row);
        }

        public BubbleScatterDataRow AddBubbleScatterDataRow(System.Double Crimerate, System.Single Latitude, int Longitude)
        {
            BubbleScatterDataRow rowBubbleScatterDataRow = ((BubbleScatterDataRow)(this.NewRow()));
            rowBubbleScatterDataRow.ItemArray = new object[] {
                        Crimerate,
                        Latitude,
                        Longitude};
            this.Rows.Add(rowBubbleScatterDataRow);
            return rowBubbleScatterDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            BubbleScatterDataDataTable cln = ((BubbleScatterDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new BubbleScatterDataDataTable();
        }

        internal void InitVars()
        {
            this.columnCrimerate = this.Columns["Crimerate"];
            this.columnLatitude = this.Columns["Latitude"];
            this.columnLongitude = this.Columns["Longitude"];
        }

        private void InitClass()
        {
            this.columnCrimerate = new DataColumn("Crimerate", typeof(System.Double), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnCrimerate);
            this.columnLatitude = new DataColumn("Latitude", typeof(System.Single), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnLatitude);
            this.columnLongitude = new DataColumn("Longitude", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnLongitude);
        }

        public BubbleScatterDataRow NewBubbleScatterDataRow()
        {
            return ((BubbleScatterDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new BubbleScatterDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(BubbleScatterDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this.BubbleScatterDataRowChanged != null))
            {
                this.BubbleScatterDataRowChanged(this, new BubbleScatterDataRowChangeEvent(((BubbleScatterDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this.BubbleScatterDataRowChanging != null))
            {
                this.BubbleScatterDataRowChanging(this, new BubbleScatterDataRowChangeEvent(((BubbleScatterDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this.BubbleScatterDataRowDeleted != null))
            {
                this.BubbleScatterDataRowDeleted(this, new BubbleScatterDataRowChangeEvent(((BubbleScatterDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this.BubbleScatterDataRowDeleting != null))
            {
                this.BubbleScatterDataRowDeleting(this, new BubbleScatterDataRowChangeEvent(((BubbleScatterDataRow)(e.Row)), e.Action));
            }
        }

        public void RemoveBubbleScatterDataRow(BubbleScatterDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class BubbleScatterDataRow : DataRow
    {

        private BubbleScatterDataDataTable tableBubbleScatterData;

        internal BubbleScatterDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.tableBubbleScatterData = ((BubbleScatterDataDataTable)(this.Table));
        }

        public System.Double Crimerate
        {
            get
            {
                try
                {
                    return ((System.Double)(this[this.tableBubbleScatterData.CrimerateColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableBubbleScatterData.CrimerateColumn] = value;
            }
        }

        public System.Single Latitude
        {
            get
            {
                try
                {
                    return ((System.Single)(this[this.tableBubbleScatterData.LatitudeColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableBubbleScatterData.LatitudeColumn] = value;
            }
        }

        public int Longitude
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableBubbleScatterData.LongitudeColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableBubbleScatterData.LongitudeColumn] = value;
            }
        }

        public bool IsCrimerateNull()
        {
            return this.IsNull(this.tableBubbleScatterData.CrimerateColumn);
        }

        public void SetCrimerateNull()
        {
            this[this.tableBubbleScatterData.CrimerateColumn] = System.Convert.DBNull;
        }

        public bool IsLatitudeNull()
        {
            return this.IsNull(this.tableBubbleScatterData.LatitudeColumn);
        }

        public void SetLatitudeNull()
        {
            this[this.tableBubbleScatterData.LatitudeColumn] = System.Convert.DBNull;
        }

        public bool IsLongitudeNull()
        {
            return this.IsNull(this.tableBubbleScatterData.LongitudeColumn);
        }

        public void SetLongitudeNull()
        {
            this[this.tableBubbleScatterData.LongitudeColumn] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class BubbleScatterDataRowChangeEvent : EventArgs
    {

        private BubbleScatterDataRow eventRow;

        private DataRowAction eventAction;

        public BubbleScatterDataRowChangeEvent(BubbleScatterDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public BubbleScatterDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class HeatDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnAfternoonTemp;

        private DataColumn columnEveningTemp;

        private DataColumn columnLocation;

        private DataColumn columnMorningTemp;

        private DataColumn columnNightTemp;

        internal HeatDataDataTable() :
            base("HeatData")
        {
            this.InitClass();
        }

        internal HeatDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn AfternoonTempColumn
        {
            get
            {
                return this.columnAfternoonTemp;
            }
        }

        internal DataColumn EveningTempColumn
        {
            get
            {
                return this.columnEveningTemp;
            }
        }

        internal DataColumn LocationColumn
        {
            get
            {
                return this.columnLocation;
            }
        }

        internal DataColumn MorningTempColumn
        {
            get
            {
                return this.columnMorningTemp;
            }
        }

        internal DataColumn NightTempColumn
        {
            get
            {
                return this.columnNightTemp;
            }
        }

        public HeatDataRow this[int index]
        {
            get
            {
                return ((HeatDataRow)(this.Rows[index]));
            }
        }

        public event HeatDataRowChangeEventHandler HeatDataRowChanged;

        public event HeatDataRowChangeEventHandler HeatDataRowChanging;

        public event HeatDataRowChangeEventHandler HeatDataRowDeleted;

        public event HeatDataRowChangeEventHandler HeatDataRowDeleting;

        public void AddHeatDataRow(HeatDataRow row)
        {
            this.Rows.Add(row);
        }

        public HeatDataRow AddHeatDataRow(int AfternoonTemp, int EveningTemp, string Location, int MorningTemp, int NightTemp)
        {
            HeatDataRow rowHeatDataRow = ((HeatDataRow)(this.NewRow()));
            rowHeatDataRow.ItemArray = new object[] {
                        AfternoonTemp,
                        EveningTemp,
                        Location,
                        MorningTemp,
                        NightTemp};
            this.Rows.Add(rowHeatDataRow);
            return rowHeatDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            HeatDataDataTable cln = ((HeatDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new HeatDataDataTable();
        }

        internal void InitVars()
        {
            this.columnAfternoonTemp = this.Columns["AfternoonTemp"];
            this.columnEveningTemp = this.Columns["EveningTemp"];
            this.columnLocation = this.Columns["Location"];
            this.columnMorningTemp = this.Columns["MorningTemp"];
            this.columnNightTemp = this.Columns["NightTemp"];
        }

        private void InitClass()
        {
            this.columnAfternoonTemp = new DataColumn("AfternoonTemp", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnAfternoonTemp);
            this.columnEveningTemp = new DataColumn("EveningTemp", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnEveningTemp);
            this.columnLocation = new DataColumn("Location", typeof(string), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnLocation);
            this.columnMorningTemp = new DataColumn("MorningTemp", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnMorningTemp);
            this.columnNightTemp = new DataColumn("NightTemp", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnNightTemp);
        }

        public HeatDataRow NewHeatDataRow()
        {
            return ((HeatDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new HeatDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(HeatDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this.HeatDataRowChanged != null))
            {
                this.HeatDataRowChanged(this, new HeatDataRowChangeEvent(((HeatDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this.HeatDataRowChanging != null))
            {
                this.HeatDataRowChanging(this, new HeatDataRowChangeEvent(((HeatDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this.HeatDataRowDeleted != null))
            {
                this.HeatDataRowDeleted(this, new HeatDataRowChangeEvent(((HeatDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this.HeatDataRowDeleting != null))
            {
                this.HeatDataRowDeleting(this, new HeatDataRowChangeEvent(((HeatDataRow)(e.Row)), e.Action));
            }
        }

        public void RemoveHeatDataRow(HeatDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class HeatDataRow : DataRow
    {

        private HeatDataDataTable tableHeatData;

        internal HeatDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.tableHeatData = ((HeatDataDataTable)(this.Table));
        }

        public int AfternoonTemp
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableHeatData.AfternoonTempColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableHeatData.AfternoonTempColumn] = value;
            }
        }

        public int EveningTemp
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableHeatData.EveningTempColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableHeatData.EveningTempColumn] = value;
            }
        }

        public string Location
        {
            get
            {
                try
                {
                    return ((string)(this[this.tableHeatData.LocationColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableHeatData.LocationColumn] = value;
            }
        }

        public int MorningTemp
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableHeatData.MorningTempColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableHeatData.MorningTempColumn] = value;
            }
        }

        public int NightTemp
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableHeatData.NightTempColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableHeatData.NightTempColumn] = value;
            }
        }

        public bool IsAfternoonTempNull()
        {
            return this.IsNull(this.tableHeatData.AfternoonTempColumn);
        }

        public void SetAfternoonTempNull()
        {
            this[this.tableHeatData.AfternoonTempColumn] = System.Convert.DBNull;
        }

        public bool IsEveningTempNull()
        {
            return this.IsNull(this.tableHeatData.EveningTempColumn);
        }

        public void SetEveningTempNull()
        {
            this[this.tableHeatData.EveningTempColumn] = System.Convert.DBNull;
        }

        public bool IsLocationNull()
        {
            return this.IsNull(this.tableHeatData.LocationColumn);
        }

        public void SetLocationNull()
        {
            this[this.tableHeatData.LocationColumn] = System.Convert.DBNull;
        }

        public bool IsMorningTempNull()
        {
            return this.IsNull(this.tableHeatData.MorningTempColumn);
        }

        public void SetMorningTempNull()
        {
            this[this.tableHeatData.MorningTempColumn] = System.Convert.DBNull;
        }

        public bool IsNightTempNull()
        {
            return this.IsNull(this.tableHeatData.NightTempColumn);
        }

        public void SetNightTempNull()
        {
            this[this.tableHeatData.NightTempColumn] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class HeatDataRowChangeEvent : EventArgs
    {

        private HeatDataRow eventRow;

        private DataRowAction eventAction;

        public HeatDataRowChangeEvent(HeatDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public HeatDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class LineAreaDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnStockName;

        private DataColumn columnMonday;

        private DataColumn columnTuesday;

        private DataColumn columnWednesday;

        private DataColumn columnThursday;

        private DataColumn columnFriday;

        internal LineAreaDataDataTable() :
            base("LineAreaData")
        {
            this.InitClass();
        }

        internal LineAreaDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn StockNameColumn
        {
            get
            {
                return this.columnStockName;
            }
        }

        internal DataColumn MondayColumn
        {
            get
            {
                return this.columnMonday;
            }
        }

        internal DataColumn TuesdayColumn
        {
            get
            {
                return this.columnTuesday;
            }
        }

        internal DataColumn WednesdayColumn
        {
            get
            {
                return this.columnWednesday;
            }
        }

        internal DataColumn ThursdayColumn
        {
            get
            {
                return this.columnThursday;
            }
        }

        internal DataColumn FridayColumn
        {
            get
            {
                return this.columnFriday;
            }
        }

        public LineAreaDataRow this[int index]
        {
            get
            {
                return ((LineAreaDataRow)(this.Rows[index]));
            }
        }

        public event LineAreaDataRowChangeEventHandler LineAreaDataRowChanged;

        public event LineAreaDataRowChangeEventHandler LineAreaDataRowChanging;

        public event LineAreaDataRowChangeEventHandler LineAreaDataRowDeleted;

        public event LineAreaDataRowChangeEventHandler LineAreaDataRowDeleting;

        public void AddLineAreaDataRow(LineAreaDataRow row)
        {
            this.Rows.Add(row);
        }

        public LineAreaDataRow AddLineAreaDataRow(string StockName, int Monday, int Tuesday, int Wednesday, int Thursday, int Friday)
        {
            LineAreaDataRow rowLineAreaDataRow = ((LineAreaDataRow)(this.NewRow()));
            rowLineAreaDataRow.ItemArray = new object[] {
                        StockName,    
                        Monday,    
                        Tuesday,    
                        Wednesday,
                        Thursday,
                        Friday};
            this.Rows.Add(rowLineAreaDataRow);
            return rowLineAreaDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            LineAreaDataDataTable cln = ((LineAreaDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new LineAreaDataDataTable();
        }

        internal void InitVars()
        {
            this.columnStockName = this.Columns["StockName"];
            this.columnMonday = this.Columns["Monday"];
            this.columnTuesday = this.Columns["Tuesday"];
            this.columnWednesday = this.Columns["Wednesday"];
            this.columnThursday = this.Columns["Thursday"];
            this.columnFriday = this.Columns["Friday"];
        }

        private void InitClass()
        {
            this.columnStockName = new DataColumn("StockName", typeof(string), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnStockName);
            this.columnMonday = new DataColumn("Monday", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnMonday);
            this.columnTuesday = new DataColumn("Tuesday", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnTuesday);
            this.columnWednesday = new DataColumn("Wednesday", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnWednesday);
            this.columnThursday = new DataColumn("Thursday", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnThursday);
            this.columnFriday = new DataColumn("Friday", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnFriday);

        }

        public LineAreaDataRow NewLineAreaDataRow()
        {
            return ((LineAreaDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new LineAreaDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(LineAreaDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this.LineAreaDataRowChanged != null))
            {
                this.LineAreaDataRowChanged(this, new LineAreaDataRowChangeEvent(((LineAreaDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this.LineAreaDataRowChanging != null))
            {
                this.LineAreaDataRowChanging(this, new LineAreaDataRowChangeEvent(((LineAreaDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this.LineAreaDataRowDeleted != null))
            {
                this.LineAreaDataRowDeleted(this, new LineAreaDataRowChangeEvent(((LineAreaDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this.LineAreaDataRowDeleting != null))
            {
                this.LineAreaDataRowDeleting(this, new LineAreaDataRowChangeEvent(((LineAreaDataRow)(e.Row)), e.Action));
            }
        }

        public void RemoveLineAreaDataRow(LineAreaDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class LineAreaDataRow : DataRow
    {

        private LineAreaDataDataTable tableLineAreaData;

        internal LineAreaDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.tableLineAreaData = ((LineAreaDataDataTable)(this.Table));
        }

        public int Friday
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableLineAreaData.FridayColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableLineAreaData.FridayColumn] = value;
            }
        }

        public int Monday
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableLineAreaData.MondayColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableLineAreaData.MondayColumn] = value;
            }
        }

        public string StockName
        {
            get
            {
                try
                {
                    return ((string)(this[this.tableLineAreaData.StockNameColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableLineAreaData.StockNameColumn] = value;
            }
        }

        public int Thursday
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableLineAreaData.ThursdayColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableLineAreaData.ThursdayColumn] = value;
            }
        }

        public int Tuesday
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableLineAreaData.TuesdayColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableLineAreaData.TuesdayColumn] = value;
            }
        }

        public int Wednesday
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableLineAreaData.WednesdayColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableLineAreaData.WednesdayColumn] = value;
            }
        }

        public bool IsFridayNull()
        {
            return this.IsNull(this.tableLineAreaData.FridayColumn);
        }

        public void SetFridayNull()
        {
            this[this.tableLineAreaData.FridayColumn] = System.Convert.DBNull;
        }

        public bool IsMondayNull()
        {
            return this.IsNull(this.tableLineAreaData.MondayColumn);
        }

        public void SetMondayNull()
        {
            this[this.tableLineAreaData.MondayColumn] = System.Convert.DBNull;
        }

        public bool IsStockNameNull()
        {
            return this.IsNull(this.tableLineAreaData.StockNameColumn);
        }

        public void SetStockNameNull()
        {
            this[this.tableLineAreaData.StockNameColumn] = System.Convert.DBNull;
        }

        public bool IsThursdayNull()
        {
            return this.IsNull(this.tableLineAreaData.ThursdayColumn);
        }

        public void SetThursdayNull()
        {
            this[this.tableLineAreaData.ThursdayColumn] = System.Convert.DBNull;
        }

        public bool IsTuesdayNull()
        {
            return this.IsNull(this.tableLineAreaData.TuesdayColumn);
        }

        public void SetTuesdayNull()
        {
            this[this.tableLineAreaData.TuesdayColumn] = System.Convert.DBNull;
        }

        public bool IsWednesdayNull()
        {
            return this.IsNull(this.tableLineAreaData.WednesdayColumn);
        }

        public void SetWednesdayNull()
        {
            this[this.tableLineAreaData.WednesdayColumn] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class LineAreaDataRowChangeEvent : EventArgs
    {

        private LineAreaDataRow eventRow;

        private DataRowAction eventAction;

        public LineAreaDataRowChangeEvent(LineAreaDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public LineAreaDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class PieDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnProduct;

        private DataColumn columnUnits_Sold;

        internal PieDataDataTable() :
            base("PieData")
        {
            this.InitClass();
        }

        internal PieDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn ProductColumn
        {
            get
            {
                return this.columnProduct;
            }
        }

        internal DataColumn Units_SoldColumn
        {
            get
            {
                return this.columnUnits_Sold;
            }
        }

        public PieDataRow this[int index]
        {
            get
            {
                return ((PieDataRow)(this.Rows[index]));
            }
        }

        public event PieDataRowChangeEventHandler PieDataRowChanged;

        public event PieDataRowChangeEventHandler PieDataRowChanging;

        public event PieDataRowChangeEventHandler PieDataRowDeleted;

        public event PieDataRowChangeEventHandler PieDataRowDeleting;

        public void AddPieDataRow(PieDataRow row)
        {
            this.Rows.Add(row);
        }

        public PieDataRow AddPieDataRow(string Product, int Units_Sold)
        {
            PieDataRow rowPieDataRow = ((PieDataRow)(this.NewRow()));
            rowPieDataRow.ItemArray = new object[] {
                        Product,
                        Units_Sold};
            this.Rows.Add(rowPieDataRow);
            return rowPieDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            PieDataDataTable cln = ((PieDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new PieDataDataTable();
        }

        internal void InitVars()
        {
            this.columnProduct = this.Columns["Product"];
            this.columnUnits_Sold = this.Columns["Units Sold"];
        }

        private void InitClass()
        {
            this.columnProduct = new DataColumn("Product", typeof(string), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnProduct);
            this.columnUnits_Sold = new DataColumn("Units Sold", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnUnits_Sold);
        }

        public PieDataRow NewPieDataRow()
        {
            return ((PieDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new PieDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(PieDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this.PieDataRowChanged != null))
            {
                this.PieDataRowChanged(this, new PieDataRowChangeEvent(((PieDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this.PieDataRowChanging != null))
            {
                this.PieDataRowChanging(this, new PieDataRowChangeEvent(((PieDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this.PieDataRowDeleted != null))
            {
                this.PieDataRowDeleted(this, new PieDataRowChangeEvent(((PieDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this.PieDataRowDeleting != null))
            {
                this.PieDataRowDeleting(this, new PieDataRowChangeEvent(((PieDataRow)(e.Row)), e.Action));
            }
        }

        public void RemovePieDataRow(PieDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class PieDataRow : DataRow
    {

        private PieDataDataTable tablePieData;

        internal PieDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.tablePieData = ((PieDataDataTable)(this.Table));
        }

        public string Product
        {
            get
            {
                try
                {
                    return ((string)(this[this.tablePieData.ProductColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tablePieData.ProductColumn] = value;
            }
        }

        public int Units_Sold
        {
            get
            {
                try
                {
                    return ((int)(this[this.tablePieData.Units_SoldColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tablePieData.Units_SoldColumn] = value;
            }
        }

        public bool IsProductNull()
        {
            return this.IsNull(this.tablePieData.ProductColumn);
        }

        public void SetProductNull()
        {
            this[this.tablePieData.ProductColumn] = System.Convert.DBNull;
        }

        public bool IsUnits_SoldNull()
        {
            return this.IsNull(this.tablePieData.Units_SoldColumn);
        }

        public void SetUnits_SoldNull()
        {
            this[this.tablePieData.Units_SoldColumn] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class PieDataRowChangeEvent : EventArgs
    {

        private PieDataRow eventRow;

        private DataRowAction eventAction;

        public PieDataRowChangeEvent(PieDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public PieDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class BarColumnDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnActiveX;

        private DataColumn columnJava;

        private DataColumn columnNET;

        private DataColumn column_Week_;

        internal BarColumnDataDataTable() :
            base("BarColumnData")
        {
            this.InitClass();
        }

        internal BarColumnDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn ActiveXColumn
        {
            get
            {
                return this.columnActiveX;
            }
        }

        internal DataColumn JavaColumn
        {
            get
            {
                return this.columnJava;
            }
        }

        internal DataColumn NETColumn
        {
            get
            {
                return this.columnNET;
            }
        }

        internal DataColumn _Week_Column
        {
            get
            {
                return this.column_Week_;
            }
        }

        public BarColumnDataRow this[int index]
        {
            get
            {
                return ((BarColumnDataRow)(this.Rows[index]));
            }
        }

        public event BarColumnDataRowChangeEventHandler BarColumnDataRowChanged;

        public event BarColumnDataRowChangeEventHandler BarColumnDataRowChanging;

        public event BarColumnDataRowChangeEventHandler BarColumnDataRowDeleted;

        public event BarColumnDataRowChangeEventHandler BarColumnDataRowDeleting;

        public void AddBarColumnDataRow(BarColumnDataRow row)
        {
            this.Rows.Add(row);
        }

        public BarColumnDataRow AddBarColumnDataRow(int ActiveX, int Java, int NET, string _Week_)
        {
            BarColumnDataRow rowBarColumnDataRow = ((BarColumnDataRow)(this.NewRow()));
            rowBarColumnDataRow.ItemArray = new object[] {
                        ActiveX,
                        Java,
                        NET,
                        _Week_};
            this.Rows.Add(rowBarColumnDataRow);
            return rowBarColumnDataRow;
        }

        public BarColumnDataRow FindBy_Week_(string _Week_)
        {
            return ((BarColumnDataRow)(this.Rows.Find(new object[] {
                            _Week_})));
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            BarColumnDataDataTable cln = ((BarColumnDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new BarColumnDataDataTable();
        }

        internal void InitVars()
        {
            this.columnActiveX = this.Columns["ActiveX"];
            this.columnJava = this.Columns["Java"];
            this.columnNET = this.Columns["NET"];
            this.column_Week_ = this.Columns["Week#"];
        }

        private void InitClass()
        {
            this.columnActiveX = new DataColumn("ActiveX", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnActiveX);
            this.columnJava = new DataColumn("Java", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnJava);
            this.columnNET = new DataColumn("NET", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnNET);
            this.column_Week_ = new DataColumn("Week#", typeof(string), null, System.Data.MappingType.Element);
            this.Columns.Add(this.column_Week_);
            this.Constraints.Add(new UniqueConstraint("Constraint1", new DataColumn[] {
                                this.column_Week_}, true));
            this.column_Week_.AllowDBNull = false;
            this.column_Week_.Unique = true;
        }

        public BarColumnDataRow NewBarColumnDataRow()
        {
            return ((BarColumnDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new BarColumnDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(BarColumnDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this.BarColumnDataRowChanged != null))
            {
                this.BarColumnDataRowChanged(this, new BarColumnDataRowChangeEvent(((BarColumnDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this.BarColumnDataRowChanging != null))
            {
                this.BarColumnDataRowChanging(this, new BarColumnDataRowChangeEvent(((BarColumnDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this.BarColumnDataRowDeleted != null))
            {
                this.BarColumnDataRowDeleted(this, new BarColumnDataRowChangeEvent(((BarColumnDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this.BarColumnDataRowDeleting != null))
            {
                this.BarColumnDataRowDeleting(this, new BarColumnDataRowChangeEvent(((BarColumnDataRow)(e.Row)), e.Action));
            }
        }

        public void RemoveBarColumnDataRow(BarColumnDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class BarColumnDataRow : DataRow
    {

        private BarColumnDataDataTable tableBarColumnData;

        internal BarColumnDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.tableBarColumnData = ((BarColumnDataDataTable)(this.Table));
        }

        public int ActiveX
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableBarColumnData.ActiveXColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableBarColumnData.ActiveXColumn] = value;
            }
        }

        public int Java
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableBarColumnData.JavaColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableBarColumnData.JavaColumn] = value;
            }
        }

        public int NET
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableBarColumnData.NETColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableBarColumnData.NETColumn] = value;
            }
        }

        public string _Week_
        {
            get
            {
                return ((string)(this[this.tableBarColumnData._Week_Column]));
            }
            set
            {
                this[this.tableBarColumnData._Week_Column] = value;
            }
        }

        public bool IsActiveXNull()
        {
            return this.IsNull(this.tableBarColumnData.ActiveXColumn);
        }

        public void SetActiveXNull()
        {
            this[this.tableBarColumnData.ActiveXColumn] = System.Convert.DBNull;
        }

        public bool IsJavaNull()
        {
            return this.IsNull(this.tableBarColumnData.JavaColumn);
        }

        public void SetJavaNull()
        {
            this[this.tableBarColumnData.JavaColumn] = System.Convert.DBNull;
        }

        public bool IsNETNull()
        {
            return this.IsNull(this.tableBarColumnData.NETColumn);
        }

        public void SetNETNull()
        {
            this[this.tableBarColumnData.NETColumn] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class BarColumnDataRowChangeEvent : EventArgs
    {

        private BarColumnDataRow eventRow;

        private DataRowAction eventAction;

        public BarColumnDataRowChangeEvent(BarColumnDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public BarColumnDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class _3DLineAreaDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnFriday;

        private DataColumn columnMonday;

        private DataColumn columnStockName;

        private DataColumn columnThursday;

        private DataColumn columnTuesday;

        private DataColumn columnWednesday;

        internal _3DLineAreaDataDataTable() :
            base("3DLineAreaData")
        {
            this.InitClass();
        }

        internal _3DLineAreaDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn FridayColumn
        {
            get
            {
                return this.columnFriday;
            }
        }

        internal DataColumn MondayColumn
        {
            get
            {
                return this.columnMonday;
            }
        }

        internal DataColumn StockNameColumn
        {
            get
            {
                return this.columnStockName;
            }
        }

        internal DataColumn ThursdayColumn
        {
            get
            {
                return this.columnThursday;
            }
        }

        internal DataColumn TuesdayColumn
        {
            get
            {
                return this.columnTuesday;
            }
        }

        internal DataColumn WednesdayColumn
        {
            get
            {
                return this.columnWednesday;
            }
        }

        public _3DLineAreaDataRow this[int index]
        {
            get
            {
                return ((_3DLineAreaDataRow)(this.Rows[index]));
            }
        }

        public event _3DLineAreaDataRowChangeEventHandler _3DLineAreaDataRowChanged;

        public event _3DLineAreaDataRowChangeEventHandler _3DLineAreaDataRowChanging;

        public event _3DLineAreaDataRowChangeEventHandler _3DLineAreaDataRowDeleted;

        public event _3DLineAreaDataRowChangeEventHandler _3DLineAreaDataRowDeleting;

        public void Add_3DLineAreaDataRow(_3DLineAreaDataRow row)
        {
            this.Rows.Add(row);
        }

        public _3DLineAreaDataRow Add_3DLineAreaDataRow(int Friday, int Monday, string StockName, int Thursday, int Tuesday, int Wednesday)
        {
            _3DLineAreaDataRow row_3DLineAreaDataRow = ((_3DLineAreaDataRow)(this.NewRow()));
            row_3DLineAreaDataRow.ItemArray = new object[] {
                        Friday,
                        Monday,
                        StockName,
                        Thursday,
                        Tuesday,
                        Wednesday};
            this.Rows.Add(row_3DLineAreaDataRow);
            return row_3DLineAreaDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            _3DLineAreaDataDataTable cln = ((_3DLineAreaDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new _3DLineAreaDataDataTable();
        }

        internal void InitVars()
        {
            this.columnFriday = this.Columns["Friday"];
            this.columnMonday = this.Columns["Monday"];
            this.columnStockName = this.Columns["StockName"];
            this.columnThursday = this.Columns["Thursday"];
            this.columnTuesday = this.Columns["Tuesday"];
            this.columnWednesday = this.Columns["Wednesday"];
        }

        private void InitClass()
        {
            this.columnFriday = new DataColumn("Friday", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnFriday);
            this.columnMonday = new DataColumn("Monday", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnMonday);
            this.columnStockName = new DataColumn("StockName", typeof(string), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnStockName);
            this.columnThursday = new DataColumn("Thursday", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnThursday);
            this.columnTuesday = new DataColumn("Tuesday", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnTuesday);
            this.columnWednesday = new DataColumn("Wednesday", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnWednesday);
        }

        public _3DLineAreaDataRow New_3DLineAreaDataRow()
        {
            return ((_3DLineAreaDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new _3DLineAreaDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(_3DLineAreaDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this._3DLineAreaDataRowChanged != null))
            {
                this._3DLineAreaDataRowChanged(this, new _3DLineAreaDataRowChangeEvent(((_3DLineAreaDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this._3DLineAreaDataRowChanging != null))
            {
                this._3DLineAreaDataRowChanging(this, new _3DLineAreaDataRowChangeEvent(((_3DLineAreaDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this._3DLineAreaDataRowDeleted != null))
            {
                this._3DLineAreaDataRowDeleted(this, new _3DLineAreaDataRowChangeEvent(((_3DLineAreaDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this._3DLineAreaDataRowDeleting != null))
            {
                this._3DLineAreaDataRowDeleting(this, new _3DLineAreaDataRowChangeEvent(((_3DLineAreaDataRow)(e.Row)), e.Action));
            }
        }

        public void Remove_3DLineAreaDataRow(_3DLineAreaDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class _3DLineAreaDataRow : DataRow
    {

        private _3DLineAreaDataDataTable table_3DLineAreaData;

        internal _3DLineAreaDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.table_3DLineAreaData = ((_3DLineAreaDataDataTable)(this.Table));
        }

        public int Friday
        {
            get
            {
                try
                {
                    return ((int)(this[this.table_3DLineAreaData.FridayColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.table_3DLineAreaData.FridayColumn] = value;
            }
        }

        public int Monday
        {
            get
            {
                try
                {
                    return ((int)(this[this.table_3DLineAreaData.MondayColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.table_3DLineAreaData.MondayColumn] = value;
            }
        }

        public string StockName
        {
            get
            {
                try
                {
                    return ((string)(this[this.table_3DLineAreaData.StockNameColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.table_3DLineAreaData.StockNameColumn] = value;
            }
        }

        public int Thursday
        {
            get
            {
                try
                {
                    return ((int)(this[this.table_3DLineAreaData.ThursdayColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.table_3DLineAreaData.ThursdayColumn] = value;
            }
        }

        public int Tuesday
        {
            get
            {
                try
                {
                    return ((int)(this[this.table_3DLineAreaData.TuesdayColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.table_3DLineAreaData.TuesdayColumn] = value;
            }
        }

        public int Wednesday
        {
            get
            {
                try
                {
                    return ((int)(this[this.table_3DLineAreaData.WednesdayColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.table_3DLineAreaData.WednesdayColumn] = value;
            }
        }

        public bool IsFridayNull()
        {
            return this.IsNull(this.table_3DLineAreaData.FridayColumn);
        }

        public void SetFridayNull()
        {
            this[this.table_3DLineAreaData.FridayColumn] = System.Convert.DBNull;
        }

        public bool IsMondayNull()
        {
            return this.IsNull(this.table_3DLineAreaData.MondayColumn);
        }

        public void SetMondayNull()
        {
            this[this.table_3DLineAreaData.MondayColumn] = System.Convert.DBNull;
        }

        public bool IsStockNameNull()
        {
            return this.IsNull(this.table_3DLineAreaData.StockNameColumn);
        }

        public void SetStockNameNull()
        {
            this[this.table_3DLineAreaData.StockNameColumn] = System.Convert.DBNull;
        }

        public bool IsThursdayNull()
        {
            return this.IsNull(this.table_3DLineAreaData.ThursdayColumn);
        }

        public void SetThursdayNull()
        {
            this[this.table_3DLineAreaData.ThursdayColumn] = System.Convert.DBNull;
        }

        public bool IsTuesdayNull()
        {
            return this.IsNull(this.table_3DLineAreaData.TuesdayColumn);
        }

        public void SetTuesdayNull()
        {
            this[this.table_3DLineAreaData.TuesdayColumn] = System.Convert.DBNull;
        }

        public bool IsWednesdayNull()
        {
            return this.IsNull(this.table_3DLineAreaData.WednesdayColumn);
        }

        public void SetWednesdayNull()
        {
            this[this.table_3DLineAreaData.WednesdayColumn] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class _3DLineAreaDataRowChangeEvent : EventArgs
    {

        private _3DLineAreaDataRow eventRow;

        private DataRowAction eventAction;

        public _3DLineAreaDataRowChangeEvent(_3DLineAreaDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public _3DLineAreaDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class ProbabilityDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnSeriesLabel;

        private DataColumn columnProbability;

        private DataColumn columnVariable;

        internal ProbabilityDataDataTable() :
            base("ProbabilityData")
        {
            this.InitClass();
        }

        internal ProbabilityDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn SeriesLabelColumn
        {
            get
            {
                return this.columnSeriesLabel;
            }
        }

        internal DataColumn ProbabilityColumn
        {
            get
            {
                return this.columnProbability;
            }
        }

        internal DataColumn VariableColumn
        {
            get
            {
                return this.columnVariable;
            }
        }

        public ProbabilityDataRow this[int index]
        {
            get
            {
                return ((ProbabilityDataRow)(this.Rows[index]));
            }
        }

        public event ProbabilityDataRowChangeEventHandler ProbabilityDataRowChanged;

        public event ProbabilityDataRowChangeEventHandler ProbabilityDataRowChanging;

        public event ProbabilityDataRowChangeEventHandler ProbabilityDataRowDeleted;

        public event ProbabilityDataRowChangeEventHandler ProbabilityDataRowDeleting;

        public void AddProbabilityDataRow(ProbabilityDataRow row)
        {
            this.Rows.Add(row);
        }

        public ProbabilityDataRow AddProbabilityDataRow(string SeriesLabel, System.Double Probability, int Variable)
        {
            ProbabilityDataRow rowProbabilityDataRow = ((ProbabilityDataRow)(this.NewRow()));
            rowProbabilityDataRow.ItemArray = new object[] {
                        SeriesLabel,
                        Probability,
                        Variable};
            this.Rows.Add(rowProbabilityDataRow);
            return rowProbabilityDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            ProbabilityDataDataTable cln = ((ProbabilityDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new ProbabilityDataDataTable();
        }

        internal void InitVars()
        {
            this.columnSeriesLabel = this.Columns["SeriesLabel"];
            this.columnProbability = this.Columns["Probability"];
            this.columnVariable = this.Columns["Variable"];
        }

        private void InitClass()
        {
            this.columnSeriesLabel = new DataColumn("SeriesLabel", typeof(string), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnSeriesLabel);
            this.columnProbability = new DataColumn("Probability", typeof(System.Double), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnProbability);
            this.columnVariable = new DataColumn("Variable", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnVariable);
        }

        public ProbabilityDataRow NewProbabilityDataRow()
        {
            return ((ProbabilityDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new ProbabilityDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(ProbabilityDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this.ProbabilityDataRowChanged != null))
            {
                this.ProbabilityDataRowChanged(this, new ProbabilityDataRowChangeEvent(((ProbabilityDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this.ProbabilityDataRowChanging != null))
            {
                this.ProbabilityDataRowChanging(this, new ProbabilityDataRowChangeEvent(((ProbabilityDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this.ProbabilityDataRowDeleted != null))
            {
                this.ProbabilityDataRowDeleted(this, new ProbabilityDataRowChangeEvent(((ProbabilityDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this.ProbabilityDataRowDeleting != null))
            {
                this.ProbabilityDataRowDeleting(this, new ProbabilityDataRowChangeEvent(((ProbabilityDataRow)(e.Row)), e.Action));
            }
        }

        public void RemoveProbabilityDataRow(ProbabilityDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class ProbabilityDataRow : DataRow
    {

        private ProbabilityDataDataTable tableProbabilityData;

        internal ProbabilityDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.tableProbabilityData = ((ProbabilityDataDataTable)(this.Table));
        }

        public string SeriesLabel
        {
            get
            {
                try
                {
                    return ((string)(this[this.tableProbabilityData.SeriesLabelColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableProbabilityData.SeriesLabelColumn] = value;
            }
        }

        public System.Double Probability
        {
            get
            {
                try
                {
                    return ((System.Double)(this[this.tableProbabilityData.ProbabilityColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableProbabilityData.ProbabilityColumn] = value;
            }
        }

        public int Variable
        {
            get
            {
                try
                {
                    return ((int)(this[this.tableProbabilityData.VariableColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tableProbabilityData.VariableColumn] = value;
            }
        }

        public bool IsSeriesLabelNull()
        {
            return this.IsNull(this.tableProbabilityData.SeriesLabelColumn);
        }

        public void SetSeriesLabelNull()
        {
            this[this.tableProbabilityData.SeriesLabelColumn] = System.Convert.DBNull;
        }

        public bool IsProbabilityNull()
        {
            return this.IsNull(this.tableProbabilityData.ProbabilityColumn);
        }

        public void SetProbabilityNull()
        {
            this[this.tableProbabilityData.ProbabilityColumn] = System.Convert.DBNull;
        }

        public bool IsVariableNull()
        {
            return this.IsNull(this.tableProbabilityData.VariableColumn);
        }

        public void SetVariableNull()
        {
            this[this.tableProbabilityData.VariableColumn] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class ProbabilityDataRowChangeEvent : EventArgs
    {

        private ProbabilityDataRow eventRow;

        private DataRowAction eventAction;

        public ProbabilityDataRowChangeEvent(ProbabilityDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public ProbabilityDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class PolarDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnCompany;

        private DataColumn columnAngle;

        private DataColumn columnStrength;

        internal PolarDataDataTable() :
            base("PolarData")
        {
            this.InitClass();
        }

        internal PolarDataDataTable(DataTable table) :
            base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn CompanyColumn
        {
            get
            {
                return this.columnCompany;
            }
        }

        internal DataColumn AngleColumn
        {
            get
            {
                return this.columnAngle;
            }
        }

        internal DataColumn StrengthColumn
        {
            get
            {
                return this.columnStrength;
            }
        }

        public PolarDataRow this[int index]
        {
            get
            {
                return ((PolarDataRow)(this.Rows[index]));
            }
        }

        public event PolarDataRowChangeEventHandler PolarDataRowChanged;

        public event PolarDataRowChangeEventHandler PolarDataRowChanging;

        public event PolarDataRowChangeEventHandler PolarDataRowDeleted;

        public event PolarDataRowChangeEventHandler PolarDataRowDeleting;

        public void AddPolarDataRow(PolarDataRow row)
        {
            this.Rows.Add(row);
        }

        public PolarDataRow AddPolarDataRow(string Company, int Angle, int Strength)
        {
            PolarDataRow rowPolarDataRow = ((PolarDataRow)(this.NewRow()));
            rowPolarDataRow.ItemArray = new object[] {
                        Company,
                        Angle,
                        Strength};
            this.Rows.Add(rowPolarDataRow);
            return rowPolarDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            PolarDataDataTable cln = ((PolarDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new PolarDataDataTable();
        }

        internal void InitVars()
        {
            this.columnCompany = this.Columns["Company"];
            this.columnAngle = this.Columns["Angle"];
            this.columnStrength = this.Columns["Strength"];
        }

        private void InitClass()
        {
            this.columnCompany = new DataColumn("Company", typeof(string), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnCompany);
            this.columnAngle = new DataColumn("Angle", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnAngle);
            this.columnStrength = new DataColumn("Strength", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnStrength);
        }

        public PolarDataRow NewPolarDataRow()
        {
            return ((PolarDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new PolarDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(PolarDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this.PolarDataRowChanged != null))
            {
                this.PolarDataRowChanged(this, new PolarDataRowChangeEvent(((PolarDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this.PolarDataRowChanging != null))
            {
                this.PolarDataRowChanging(this, new PolarDataRowChangeEvent(((PolarDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this.PolarDataRowDeleted != null))
            {
                this.PolarDataRowDeleted(this, new PolarDataRowChangeEvent(((PolarDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this.PolarDataRowDeleting != null))
            {
                this.PolarDataRowDeleting(this, new PolarDataRowChangeEvent(((PolarDataRow)(e.Row)), e.Action));
            }
        }

        public void RemovePolarDataRow(PolarDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class PolarDataRow : DataRow
    {

        private PolarDataDataTable tablePolarData;

        internal PolarDataRow(DataRowBuilder rb) :
            base(rb)
        {
            this.tablePolarData = ((PolarDataDataTable)(this.Table));
        }

        public string Company
        {
            get
            {
                try
                {
                    return ((string)(this[this.tablePolarData.CompanyColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tablePolarData.CompanyColumn] = value;
            }
        }

        public int Angle
        {
            get
            {
                try
                {
                    return ((int)(this[this.tablePolarData.AngleColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tablePolarData.AngleColumn] = value;
            }
        }

        public int Strength
        {
            get
            {
                try
                {
                    return ((int)(this[this.tablePolarData.StrengthColumn]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.tablePolarData.StrengthColumn] = value;
            }
        }

        public bool IsCompanyNull()
        {
            return this.IsNull(this.tablePolarData.CompanyColumn);
        }

        public void SetCompanyNull()
        {
            this[this.tablePolarData.CompanyColumn] = System.Convert.DBNull;
        }

        public bool IsAngleNull()
        {
            return this.IsNull(this.tablePolarData.AngleColumn);
        }

        public void SetAngleNull()
        {
            this[this.tablePolarData.AngleColumn] = System.Convert.DBNull;
        }

        public bool IsStrengthNull()
        {
            return this.IsNull(this.tablePolarData.StrengthColumn);
        }

        public void SetStrengthNull()
        {
            this[this.tablePolarData.StrengthColumn] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class PolarDataRowChangeEvent : EventArgs
    {

        private PolarDataRow eventRow;

        private DataRowAction eventAction;

        public PolarDataRowChangeEvent(PolarDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public PolarDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }
    [System.Diagnostics.DebuggerStepThrough()]
    public class _3LinesDataDataTable : DataTable, System.Collections.IEnumerable
    {

        private DataColumn columnStockName;

        private DataColumn columnMonday;

        private DataColumn columnTuesday;

        private DataColumn columnWednesday;

        internal _3LinesDataDataTable()
            :
                base("_3LinesData")
        {
            this.InitClass();
        }

        internal _3LinesDataDataTable(DataTable table)
            :
                base(table.TableName)
        {
            if ((table.CaseSensitive != table.DataSet.CaseSensitive))
            {
                this.CaseSensitive = table.CaseSensitive;
            }
            if ((table.Locale.ToString() != table.DataSet.Locale.ToString()))
            {
                this.Locale = table.Locale;
            }
            if ((table.Namespace != table.DataSet.Namespace))
            {
                this.Namespace = table.Namespace;
            }
            this.Prefix = table.Prefix;
            this.MinimumCapacity = table.MinimumCapacity;
            this.DisplayExpression = table.DisplayExpression;
        }

        [System.ComponentModel.Browsable(false)]
        public int Count
        {
            get
            {
                return this.Rows.Count;
            }
        }

        internal DataColumn Column1Column
        {
            get
            {
                return this.columnStockName;
            }
        }

        internal DataColumn Column2Column
        {
            get
            {
                return this.columnMonday;
            }
        }

        internal DataColumn Column3Column
        {
            get
            {
                return this.columnTuesday;
            }
        }

        internal DataColumn Column4Column
        {
            get
            {
                return this.columnWednesday;
            }
        }


        public _3LinesDataRow this[int index]
        {
            get
            {
                return ((_3LinesDataRow)(this.Rows[index]));
            }
        }

        public event _3LinesDataRowChangeEventHandler _3LinesDataRowChanged;

        public event _3LinesDataRowChangeEventHandler _3LinesDataRowChanging;

        public event _3LinesDataRowChangeEventHandler _3LinesDataRowDeleted;

        public event _3LinesDataRowChangeEventHandler _3LinesDataRowDeleting;

        public void Add_3LinesDataRow(_3LinesDataRow row)
        {
            this.Rows.Add(row);
        }

        public _3LinesDataRow Add_3LinesDataRow(string Column1, int Column2, int Column3, int Column4)
        {
            _3LinesDataRow row_3LinesDataRow = ((_3LinesDataRow)(this.NewRow()));
            row_3LinesDataRow.ItemArray = new object[] {
                        Column1,
                        Column2,
                        Column3,
                        Column4};
            this.Rows.Add(row_3LinesDataRow);
            return row_3LinesDataRow;
        }

        public System.Collections.IEnumerator GetEnumerator()
        {
            return this.Rows.GetEnumerator();
        }

        public override DataTable Clone()
        {
            _3LinesDataDataTable cln = ((_3LinesDataDataTable)(base.Clone()));
            cln.InitVars();
            return cln;
        }

        protected override DataTable CreateInstance()
        {
            return new _3LinesDataDataTable();
        }

        internal void InitVars()
        {
            this.columnStockName = this.Columns["StockName"];
            this.columnMonday = this.Columns["Monday"];
            this.columnTuesday = this.Columns["Tuesday"];
            this.columnWednesday = this.Columns["Wednesday"];
        }

        private void InitClass()
        {
            this.columnStockName = new DataColumn("StockName", typeof(string), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnStockName);
            this.columnMonday = new DataColumn("Monday", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnMonday);
            this.columnTuesday = new DataColumn("Tuesday", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnTuesday);
            this.columnWednesday = new DataColumn("Wednesday", typeof(int), null, System.Data.MappingType.Element);
            this.Columns.Add(this.columnWednesday);
        }

        public _3LinesDataRow New_3LinesDataRow()
        {
            return ((_3LinesDataRow)(this.NewRow()));
        }

        protected override DataRow NewRowFromBuilder(DataRowBuilder builder)
        {
            return new _3LinesDataRow(builder);
        }

        protected override System.Type GetRowType()
        {
            return typeof(_3LinesDataRow);
        }

        protected override void OnRowChanged(DataRowChangeEventArgs e)
        {
            base.OnRowChanged(e);
            if ((this._3LinesDataRowChanged != null))
            {
                this._3LinesDataRowChanged(this, new _3LinesDataRowChangeEvent(((_3LinesDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowChanging(DataRowChangeEventArgs e)
        {
            base.OnRowChanging(e);
            if ((this._3LinesDataRowChanging != null))
            {
                this._3LinesDataRowChanging(this, new _3LinesDataRowChangeEvent(((_3LinesDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleted(DataRowChangeEventArgs e)
        {
            base.OnRowDeleted(e);
            if ((this._3LinesDataRowDeleted != null))
            {
                this._3LinesDataRowDeleted(this, new _3LinesDataRowChangeEvent(((_3LinesDataRow)(e.Row)), e.Action));
            }
        }

        protected override void OnRowDeleting(DataRowChangeEventArgs e)
        {
            base.OnRowDeleting(e);
            if ((this._3LinesDataRowDeleting != null))
            {
                this._3LinesDataRowDeleting(this, new _3LinesDataRowChangeEvent(((_3LinesDataRow)(e.Row)), e.Action));
            }
        }

        public void Remove_3LinesDataRow(_3LinesDataRow row)
        {
            this.Rows.Remove(row);
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class _3LinesDataRow : DataRow
    {

        private _3LinesDataDataTable table_3LinesData;

        internal _3LinesDataRow(DataRowBuilder rb)
            :
                base(rb)
        {
            this.table_3LinesData = ((_3LinesDataDataTable)(this.Table));
        }

        public string Column1
        {
            get
            {
                try
                {
                    return ((string)(this[this.table_3LinesData.Column1Column]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.table_3LinesData.Column1Column] = value;
            }
        }

        public int Column2
        {
            get
            {
                try
                {
                    return ((int)(this[this.table_3LinesData.Column2Column]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.table_3LinesData.Column2Column] = value;
            }
        }

        public int Column3
        {
            get
            {
                try
                {
                    return ((int)(this[this.table_3LinesData.Column3Column]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.table_3LinesData.Column3Column] = value;
            }
        }

        public int Column4
        {
            get
            {
                try
                {
                    return ((int)(this[this.table_3LinesData.Column4Column]));
                }
                catch (InvalidCastException e)
                {
                    throw new StrongTypingException("Cannot get value because it is DBNull.", e);
                }
            }
            set
            {
                this[this.table_3LinesData.Column4Column] = value;
            }
        }

        public bool IsColumn1Null()
        {
            return this.IsNull(this.table_3LinesData.Column1Column);
        }

        public void SetColumn1Null()
        {
            this[this.table_3LinesData.Column1Column] = System.Convert.DBNull;
        }

        public bool IsColumn2Null()
        {
            return this.IsNull(this.table_3LinesData.Column2Column);
        }

        public void SetColumn2Null()
        {
            this[this.table_3LinesData.Column2Column] = System.Convert.DBNull;
        }

        public bool IsColumn3Null()
        {
            return this.IsNull(this.table_3LinesData.Column3Column);
        }

        public void SetColumn3Null()
        {
            this[this.table_3LinesData.Column3Column] = System.Convert.DBNull;
        }

        public bool IsColumn4Null()
        {
            return this.IsNull(this.table_3LinesData.Column4Column);
        }

        public void SetColumn4Null()
        {
            this[this.table_3LinesData.Column4Column] = System.Convert.DBNull;
        }
    }

    [System.Diagnostics.DebuggerStepThrough()]
    public class _3LinesDataRowChangeEvent : EventArgs
    {

        private _3LinesDataRow eventRow;

        private DataRowAction eventAction;

        public _3LinesDataRowChangeEvent(_3LinesDataRow row, DataRowAction action)
        {
            this.eventRow = row;
            this.eventAction = action;
        }

        public _3LinesDataRow Row
        {
            get
            {
                return this.eventRow;
            }
        }

        public DataRowAction Action
        {
            get
            {
                return this.eventAction;
            }
        }
    }
}

}