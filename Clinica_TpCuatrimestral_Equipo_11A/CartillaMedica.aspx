<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPaciente.Master" AutoEventWireup="true" CodeBehind="CartillaMedica.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.CartillaMedica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <h1 class="mt-5">Encontrá a tu especialista</h1>
            <p style="color: gray; font-weight: 100;">¡Conoce a nuestro equipo! Navega la cartilla médica o usa los filtros de nombre o especialidad para encontrar a tu profesional ideal.</p>
        </div>
        
        <div class="d-flex">
            <div class="d-flex me-3 rounded-3" style="background-color: #d3d3d38f;">
                <img src="<%= ResolveUrl("~/Imagenes/Lupa.png") %>" class="m-2" style="height: 20px;" />
                <asp:TextBox ID="txtMedico" runat="server" class="border-dark-subtle form-control" Style="width: 300px;" placeholder="Dr. App" />
            </div>
            <div>
                <asp:DropDownList ID="ddlEspecialidades" runat="server" class="border-dark-subtle h-100 rounded-2" Style="width: 210px;">
                </asp:DropDownList>
            </div>
        </div>
        
        <br />
        
        <div class="g-4 p-3 row row-cols-1 row-cols-md-3">
            <% foreach (dominio.Medico medico in ListaMedico)
               { %>
                   <div class="col mb-4" style="width: 300px;">
                       <div class="card h-100 shadow-sm">
                           <img src="<%:medico.Imagen.UrlImagen%>" 
                                class="card-img-top object-fit-contain" 
                                style="height: 250px;" 
                                onerror="this.onerror=null; this.src='<%= ResolveUrl("~/Imagenes/Perfil_Placeholder.png") %>';">
                           
                           <div class="card-body d-flex flex-column">
                               <h5 class="card-title"><%:medico.Nombre + " " + medico.Apellido %></h5>
                               
                               <% string especialidades = "";
                                  for (int i = 0; i < medico.Especialidades.Count(); i++)
                                  {
                                      especialidades += medico.Especialidades[i].Descripcion;
                                      if (medico.Especialidades.Count() != 1 && i != medico.Especialidades.Count() - 1)
                                          especialidades += ", ";
                                  } %>
                               
                               <p class="card-text text-muted mb-3"><%:especialidades%></p>
                               
                               <a class="btn btn-primary w-100 mt-auto" href="SolicitarTurno.aspx">Solicitar Turno</a>
                           </div>
                       </div>
                   </div>
            <% } %>
        </div>
    </div>
</asp:Content>