<%@ Page Title="Agenda Médico" Language="C#" MasterPageFile="~/MasterMedico.Master" AutoEventWireup="true" CodeBehind="AgendaMedico.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.AgendaMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid mt-4">
    <div class="row">
        <div class="col-md-12">
            <h4 class="fw-bold mb-3">Semana del 27 al 31 de Octubre</h4>

            <div class="table-responsive bg-white shadow-sm rounded-3 p-3">
                <table class="table table-bordered align-middle text-center">
                    <thead class="table-light">
                        <tr>
                            <th>Hora</th>
                            <th>Lunes 27</th>
                            <th>Martes 28</th>
                            <th>Miércoles 29</th>
                            <th>Jueves 30</th>
                            <th>Viernes 31</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>09:00</td>
                            <td class="turno bg-info text-white">
                                Paciente Ejemplo
                            </td>
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
    </div>
</div>
</asp:Content>
