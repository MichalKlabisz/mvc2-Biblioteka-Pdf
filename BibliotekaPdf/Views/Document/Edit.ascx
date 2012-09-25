<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BibliotekaPdf.Models.Document>" %>

    <form action="/Document/Edit/<%: Model.Id %>" class="editForm" method="post">
        <% Html.ValidationSummary(true); %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Title) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Title) %>
                <%: Html.ValidationMessageFor(model => model.Title) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Authors) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Authors) %>
                <%: Html.ValidationMessageFor(model => model.Authors) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Description) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Description) %>
                <%: Html.ValidationMessageFor(model => model.Description) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Rating) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Rating) %>
                <%: Html.ValidationMessageFor(model => model.Rating) %>
            </div>
            
            <p>
                <input class="ajaxEditSubmit" type="submit" value="Zapisz" />
            </p>
        </fieldset>

    </form>

    <div>
        <p><button class="showDetails" id="<%: Model.Id %>">Powrót</button></p>
    </div>


