<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BibliotekaPdf.Models.Document>" %>
	
    <div>
        <h5>Autorzy: <%: Model.Authors %> <br />
        Ocena: <%: Model.Rating%>/10</h5>
        <p><%: Model.Description%></p>
        
        <table>
        <tr>
        <td><button class="openPdf" id="<%: Model.FilePath %>">Otwórz</button></td>
        <% if (Request.IsAuthenticated)
           { %>
            <td><button class="showEdit" id="<%: Model.Id %>">Edytuj</button></td>
            <td><form class="deleteForm" method="post" action="/Document/Delete/<%: Model.Id %>">      
		        <input class="ajaxDeleteSubmit" type="submit" value="Usuń" />
            </form></td>
            </tr>
            </table>
        <% }
           else
           { %>
           </tr></table>
        <% } %>
        
	</div>		
    


