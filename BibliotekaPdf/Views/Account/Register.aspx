<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<BibliotekaPdf.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Rejestracja
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Utwórz nowe konto</h2>

    <p>
        Hasło musi składać się z minimum <%: ViewData["PasswordLength"] %> znaków.
    </p>

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "Nie można utworzyć konta. Popraw błędy i spróbuj ponownie.") %>
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
                    <%: Html.LabelFor(m => m.Email) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Email) %>
                    <%: Html.ValidationMessageFor(m => m.Email) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.ConfirmPassword) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                    <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                </div>
                
                <p>
                    <input type="submit" value="Rejestruj" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
