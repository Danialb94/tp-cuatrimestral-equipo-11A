<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPaciente.Master" AutoEventWireup="true" CodeBehind="InicioPaciente.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.InicioPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2 class="fw-bold">Bienvenido,</h2>
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <div class="d-flex justify-content-between mb-3">
                    <h5 class="fw-bold mb-0">Turnos Próximos</h5>
                </div>

                <table class="table align-middle table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>Hora</th>
                            <th>Médico</th>
                            <th>Especialidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>09:00</td>
                            <td class="bg-info text-white">Dr. Juan Perez</td>
                            <td>Clínica Médica</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
