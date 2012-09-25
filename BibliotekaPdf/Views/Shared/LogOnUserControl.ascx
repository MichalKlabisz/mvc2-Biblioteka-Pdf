<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        Witaj <b><%: Page.User.Identity.Name %></b>!
        [ <%: Html.ActionLink("Wyloguj się", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Zaloguj się", "LogOn", "Account") %> ]
<%
    }
%>
