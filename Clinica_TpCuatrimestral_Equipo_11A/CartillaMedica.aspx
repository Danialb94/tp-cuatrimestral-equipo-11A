<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPaciente.Master" AutoEventWireup="true" CodeBehind="CartillaMedica.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.CartillaMedica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <h1>Encontrá a tu especialista</h1>
            <p style="color: gray; font-weight: 100;">¡Conoce a nuestro equipo! Navega la cartilla médica o usa los filtros de nombre o especialidad para encontrar a tu profesional ideal.</p>
        </div>
        <div class="d-flex">
            <div class="d-flex me-3 rounded-3" style="background-color: #d3d3d38f;">
                <img src="<%= ResolveUrl("~/Imagenes/Lupa.png") %>" class="m-2" style="height: 20px;" />
                <asp:TextBox ID="txtMedico" runat="server" class="border-dark-subtle form-control" Style="width: 300px;" placeholder="Dr. App" />
            </div>
            <div>
                <asp:DropDownList ID="ddlEspecialidades" runat="server" class="border-dark-subtle h-100 rounded-2" Style="width: 210px;">
                    <asp:ListItem Selected hidden>Seleccione la Especialidad</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <br />
        <div class="g-4 p-3 row row-cols-1 row-cols-md-3" >
                <%--<%foreach (dominio.Medico medico in ListaMedico)
                    {
                
                    } %>--%>
                <%for (int i = 0; i < 6; i++)
                    {%>
                <div class="col m-3 p-3 rounded" style="width: 280px;background-color: lightgrey;">
                    <div class="card">
                        <img src="<%-- Foto del profesional tomada de BBDD --%>" class="img-fluid rounded-2" style="width: 250px; height: 250px" onerror="this.onerror=null; this.src='<%= ResolveUrl("~/Imagenes/Perfil_Placeholder.png") %>';">
                    </div>

                    <div class="card-body pt-2">
                        <h5 class="card-title">Dr. Nombre Apellido</h5>
                        <p class="card-text overflow-auto">Especialidades</p>
                        <p class="card-text overflow-auto">Horarios</p>
                        <a class="btn btn-primary w-100" href="<%--Pantalla para sacar el turno--%>">Solicitar Turno</a>
                    </div>
                </div>

                <% }%>
        </div>
    </div>
</asp:Content>
