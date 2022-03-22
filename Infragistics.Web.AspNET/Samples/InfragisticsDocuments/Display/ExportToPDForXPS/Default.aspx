<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/InfragisticsDocuments/Display/ExportToPDForXPS/Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div class="export-pdf-xps-sample">
      <fieldset>
        <legend><%= this.GetGlobalResourceObject("InfragisticsDocuments", "INVOICE_REPORT")%></legend>
          <fieldset>
              <legend><%= this.GetGlobalResourceObject("InfragisticsDocuments", "COMPANY_INFO")%></legend>
              <div class="column-one">
                  <asp:Label runat="server" AssociatedControlID="companyInfoName">
                    <%= this.GetGlobalResourceObject("InfragisticsDocuments", "COMPANY_NAME")%>
                  </asp:Label>
                  <asp:TextBox runat="server" ID="companyInfoName" Text="Infragistics"></asp:TextBox>
                  <asp:Label runat="server" AssociatedControlID="companyInfoAddress">
                    <%= this.GetGlobalResourceObject("InfragisticsDocuments", "ADDRESS")%>
                  </asp:Label>
                  <asp:TextBox runat="server" ID="companyInfoAddress" Text="110 B, Simeonovsko Shosse Bul"></asp:TextBox>
              </div>
              <div class="column-two">
                  <asp:Label runat="server" AssociatedControlID="companyInfoPhone">
                    <%= this.GetGlobalResourceObject("InfragisticsDocuments", "PHONE") %>
                  </asp:Label>
                  <asp:TextBox runat="server" ID="companyInfoPhone" Text="999-999-999"></asp:TextBox>
                  <asp:Label runat="server" AssociatedControlID="companyInfoEmail">
                    <%= this.GetGlobalResourceObject("InfragisticsDocuments", "EMAIL") %>
                  </asp:Label>
                  <asp:TextBox runat="server" ID="companyInfoEmail" Text="stocks@infragistics.com"></asp:TextBox>
              </div>
          </fieldset>
          <fieldset>
              <legend><%= this.GetGlobalResourceObject("InfragisticsDocuments", "INVOICE_RECIPIENT_INFORMATION")%></legend>
              <div class="column-one">
                  <asp:Label runat="server" AssociatedControlID="invoiceRecipientName">
                    <%= this.GetGlobalResourceObject("InfragisticsDocuments", "NAME") %>
                  </asp:Label>
                  <asp:TextBox runat="server" ID="invoiceRecipientName" Text="John Doe"></asp:TextBox>
                  <asp:Label runat="server" AssociatedControlID="invoiceRecipientCompanyName">
                    <%= this.GetGlobalResourceObject("InfragisticsDocuments", "COMPANY_NAME") %>
                  </asp:Label>
                  <asp:TextBox runat="server" ID="invoiceRecipientCompanyName" Text="Microsoft"></asp:TextBox>
                  <asp:Label runat="server" AssociatedControlID="invoiceRecipientStreetAddress">
                    <%= this.GetGlobalResourceObject("InfragisticsDocuments", "STREET_ADDRESS") %>
                  </asp:Label>
                  <asp:TextBox runat="server" ID="invoiceRecipientStreetAddress" Text="1 Microsoft Way, Redmond, Washington 98052"></asp:TextBox>
              </div>
              <div class="column-two">
                  <asp:Label runat="server" AssociatedControlID="invoiceRecipientCity">
                    <%= this.GetGlobalResourceObject("InfragisticsDocuments", "CITY") %>
                  </asp:Label>
                  <asp:TextBox runat="server" ID="invoiceRecipientCity" Text="Redmond"></asp:TextBox>
                  <asp:Label runat="server" AssociatedControlID="invoiceRecipientPhone">
                    <%= this.GetGlobalResourceObject("InfragisticsDocuments", "PHONE") %>
                  </asp:Label>
                  <asp:TextBox runat="server" ID="invoiceRecipientPhone" Text="888-888-777"></asp:TextBox>
              </div>
          </fieldset>
            <fieldset class="export-fieldset"> 
                <legend><%= this.GetGlobalResourceObject("InfragisticsDocuments", "EXPORT_PDF_OR_XPS")%></legend> 
                <span>
                    <%= this.GetGlobalResourceObject("InfragisticsDocuments", "CHOOSE_FILE_FORMAT")%>
                </span> 
                <asp:DropDownList runat="server" ID="expFormat"> 
                    <asp:ListItem Text="Adobe PDF" Value="pdf" /> 
                    <asp:ListItem Text="Microsoft XPS" Value="xps" />
                </asp:DropDownList> 
            </fieldset>
            <div class="buttonConteiner">
                <asp:Button runat="server" ID="btnExport" Text="<%$ Resources:InfragisticsDocuments, EXPORT%>" OnClick="btnSave_Click" />
            </div>
        </fieldset>
    </div>
</asp:Content>