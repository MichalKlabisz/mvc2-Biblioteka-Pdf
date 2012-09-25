<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<BibliotekaPdf.Models.Document>>" %>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="ajaxSpace" id="ajaxSpace"> <% Html.RenderPartial("ListAll"); %> </div>
    

</asp:Content>

