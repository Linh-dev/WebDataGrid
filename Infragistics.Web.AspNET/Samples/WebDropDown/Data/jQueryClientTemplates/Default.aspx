<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDropDown_Data_jQuery_Client_Templates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript" src="/SamplesBrowser/Scripts/jquery.min.js"></script>
    <script type="text/javascript" src="/SamplesBrowser/Scripts/jquery.tmpl.js"></script>
    <script type="text/javascript" src="/SamplesBrowser/Scripts/jquery-ui.min.js"></script>
    <script type="text/javascript">

        function onDataBind(sender, evntArgs) {
            evntArgs.set_cancel(true);
            sender._pi.show(sender);
            var dataSource = [
                        { Data: 'Chai' },
                        { Data: 'Chang' },
                        { Data: 'Aniseed Syrup' },
                        { Data: 'Cajun Seasoning' },
                        { Data: 'Ikura' },
                        { Data: 'Tofu' },
                        { Data: 'Pavlova' }
                    ];
            sender.set_dataSource(dataSource);
            setTimeout(function () {
                sender.dataBind();
                sender._pi.hide(sender);
            }, 500);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDropDown ID="WebDropDown1" runat="server" Width="200px" EnableClientRendering="true"
        DropDownContainerMaxHeight="200" EnableDropDownAsChild="false" CurrentValue="" EnableCustomValues="true" TextField="Data"
        ClientEvents-DataBinding="onDataBind" DisplayMode="DropDown">
        <ClientRenderingTemplate>
            <li>Product: ${Data}</li>
        </ClientRenderingTemplate>
    </ig:WebDropDown>
</asp:Content>
