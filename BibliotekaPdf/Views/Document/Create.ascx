<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BibliotekaPdf.Models.Document>" %>


    <% Html.EnableClientValidation(); %>
        
      <form id="createForm" action="#" method="post" enctype="multipart/form-data">  
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Dane:</legend>
             
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
                <%: Html.TextBoxFor(model => model.Rating, new { Value = "0" })%>
                <%: Html.ValidationMessageFor(model => model.Rating) %>
            </div>

            <input class="file" name="file" type="file" />
            
            
            
            <div id="progressbar"></div>
            
            <p>
                <input class="ajaxCreateSubmit" type="submit" value="Utwórz" disabled="disabled" />
            </p>
        </fieldset>
        </form> 
     
    

    <div>
        <button class="ajaxListAll">Powrót do listy</button>
    </div>


