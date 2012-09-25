<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<BibliotekaPdf.Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Logowanie
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Logowanie</h2>
    <p>
        Podaj login i hasło. <%: Html.ActionLink("Zarejestruj się", "Register") %>, jeśli nie masz konta.
    </p>

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "Logowanie zakończone niepowodzeniem. Popraw błędy i spróbuj ponownie.") %>
        <div>
            <fieldset>
                <legend>Informacje o koncie:</legend>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.UserName) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.CheckBoxFor(m => m.RememberMe) %>
                    <%: Html.LabelFor(m => m.RememberMe) %>
                </div>
                
                <p>
                    <input type="submit" value="Zaloguj się" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
