<%@ Page Title="" Language="C#" MasterPageFile="~/Recepcionista.Master" AutoEventWireup="true" CodeBehind="PacientesRecepcionista.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.PacientesRecepcionista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card shadow-sm border-0">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-3">
                <h4 class="fw-bold">Pacientes Registrados</h4>
                <a class="btn btn-primary" href="AltaPaciente.aspx">Nuevo Paciente</a>
            </div>
            <div>
                <div class="d-flex mb-2 justify-content-between rounded-2" style="background-color: #d3d3d38f; width: 450px;">
                    <img src="<%= ResolveUrl("~/Imagenes/Lupa.png") %>" class="m-2" style="height: 20px;" />
                    <div class="align-content-around">
                        <label><b>Filtro rápido</b></label>
                    </div>
                    <asp:TextBox ID="txtFiltro" runat="server" class="border-dark-subtle form-control ms-2" Style="width: 300px;" placeholder="Nombre / Apellido / Documento" />
                </div>
                <table class="table table-bordered align-middle text-center">
                    <thead class="table-light">
                        <tr>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Documento</th>
                            <th>Cobertura</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Nombre1</td>
                            <td>Apellido1</td>
                            <td>Documento1</td>
                            <td>Cobertura1</td>
                            <td>
                                <a href="SolicitarTurnoRecepcionista.aspx" class="btn btn-outline-primary btn-sm" title="Solicitar Turno">
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>Nombre2</td>
                            <td>Apellido2</td>
                            <td>Documento2</td>
                            <td>Cobertura2</td>
                            <td>
                                <a href="SolicitarTurnoRecepcionista.aspx" class="btn btn-outline-primary btn-sm" title="Solicitar Turno">
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>Nombre3</td>
                            <td>Apellido3</td>
                            <td>Documento3</td>
                            <td>Cobertura3</td>
                            <td>
                                <a href="SolicitarTurnoRecepcionista.aspx" class="btn btn-outline-primary btn-sm" title="Solicitar Turno">
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
