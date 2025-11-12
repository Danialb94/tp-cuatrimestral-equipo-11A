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
                <asp:TextBox ID="txtMedico" runat="server" class="border-dark-subtle form-control" Style="width: 300px;" placeholder="Dr. App" AutoPostBack="true" OnTextChanged="txtMedico_TextChanged"/>
            </div>
            <div>
                <asp:DropDownList ID="ddlEspecialidades" runat="server" 
                    class="border-dark-subtle h-100 rounded-2" Style="width: 210px;"
                    AutoPostBack="true" OnSelectedIndexChanged="ddlEspecialidades_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>

        <br />

        <div class="g-4 p-3 row row-cols-1 row-cols-md-3">
            <% foreach (dominio.Medico medico in ListaMedico)
               { %>
                    <div class="col h-100 mb-4" style="width: 300px;">
                        <div class="card h-100 shadow-sm">
                            <img src="<%:medico.Imagen.UrlImagen%>"
                                class="card-img-top object-fit-contain"
                                style="height: 250px;"
                                onerror="this.onerror=null; this.src='<%= ResolveUrl("~/Imagenes/Perfil_Placeholder.png") %>';">

                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title"><%:medico.Nombre + " " + medico.Apellido %></h5>

                                    <ul class="list-group list-group-flush">
                                        <% string especialidades = "";
                                            for (int i = 0; i < medico.Especialidades.Count(); i++)
                                            {%>
                                                <li style="list-style-type: none;">
                                                    <h6 class="mb-1"><%:medico.Especialidades[i].Descripcion%></h6>

                                                    <%string Dias = "";
                                                    for (int x = 0; x < medico.Horario[i].DiasSemana.Count(); x++)
                                                    {
                                                        Dias += medico.Horario[i].DiasSemana[x];
                                                        if (medico.Horario[i].DiasSemana.Count() != 1 && x != medico.Horario[i].DiasSemana.Count() - 1)
                                                            Dias += ", ";
                                                    } %>
                                                    <p class="card-text text-muted mb-1"><%:Dias%>
                                                    <br />
                                                    <%:medico.Horario[i].HoraEntrada%>hs a <%:medico.Horario[i].HoraSalida%>hs</p>


                                                    <%if (medico.Especialidades.Count() > 1)
                                                        {%>
                                                         <a href="SolicitarTurno.aspx?id=<%:medico.IdMedico%>&esp=<%:medico.Especialidades[i].Descripcion%>&i=<%:i%>" 
                                                           class="btn btn-primary w-100 mt-auto">
                                                            Solicitar Turno para <%:medico.Especialidades[i].Descripcion%>
                                                        </a>
                                                        <%if (i != medico.Especialidades.Count() - 1) {
                                                          %>
                                                            <hr />
                                                        <%}
                                                      }
                                                    else {%>
                                                         <a href="SolicitarTurno.aspx?id=<%:medico.IdMedico%>&esp=<%:medico.Especialidades[i].Descripcion%>&i=<%:i%>" 
                                                           class="btn btn-primary w-100 mt-auto">
                                                            Solicitar Turno
                                                        </a>
                                                    <%}%>
                                                </li>
                                            <%} %>
                                    </ul>
                            </div>
                        </div>
                    </div>
            <% } %>
        </div>
    </div>
</asp:Content>
