<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<BibliotekaPdf.Models.Document>>" %>

    <% if (Model.ToList().Count == 0) {  %>
        <h3>Nie ma żadnych elementów. Zaloguj lub zarejestruj się aby je dodać.</h3>
    <% } %>

    <div id="accordion">
    <% foreach (var item in Model) { %>
			<div>
				<h3><a href="#"><%: item.Title %></a></h3>
				<% Html.RenderPartial("Details", item); %>
			</div>		
    <% } %>
	</div>


    <% if (Request.IsAuthenticated) { %>
    <p>
    <button class="ajaxCreate">Utwórz</button>
    </p>
    <div class="ajaxCreateSpace"></div>
    <% } %>
   


