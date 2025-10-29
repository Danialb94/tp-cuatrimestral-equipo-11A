<%@ Page Title="" Language="C#" MasterPageFile="~/MasterRecepcionista.Master" AutoEventWireup="true" CodeBehind="InicioRecepcionista.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.InicioRecepcionista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card shadow-sm border-0">
        <div class="card-body">
            <h4 class="fw-bold mb-3">Turnos de la semana</h4>

            <div class="mb-4">
                <asp:DropDownList
                    ID="ddlEspecialidadesRecepcionista" runat="server" CssClass="border-dark-subtle h-100 rounded-2 form-select" Style="width: 240px;" AutoPostBack="true" OnSelectedIndexChanged="ddlEspecialidadesRecepcionista_SelectedIndexChanged">
                    <asp:ListItem Selected hidden>Seleccione la Especialidad</asp:ListItem>
                </asp:DropDownList>
            </div>

            <table class="table table-bordered align-middle text-center">
                <thead class="table-light">
                    <tr>
                        <th>Hora</th>
                        <th>Lunes 23</th>
                        <th>Martes 24</th>
                        <th>Miércoles 25</th>
                        <th>Jueves 26</th>
                        <th>Viernes 27</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>09:00</td>
                        <td class="turno bg-info text-white">Paciente Ejemplo</td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                    </tr>
                    <tr>
                        <td>10:00</td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                    </tr>
                    <tr class="table-secondary">
                        <td colspan="6" class="fw-bold">Almuerzo</td>
                    </tr>
                    <tr>
                        <td>13:00</td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                    </tr>
                    <tr>
                        <td>14:00</td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                        <td class="turno"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
