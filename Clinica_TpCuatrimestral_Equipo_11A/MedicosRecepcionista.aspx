<%@ Page Title="Médicos" Language="C#" MasterPageFile="~/MasterRecepcionista.Master" AutoEventWireup="true" CodeBehind="MedicosRecepcionista.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.MedicosRecepcionista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card shadow-sm border-0">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-3">
                <h4 class="fw-bold">Médicos Registrados</h4>
                <a class="bi bi-plus-circle me-1 btn btn-primary" href="AgregarMedico.aspx"> Nuevo Médico</a>
            </div>

            <div class="d-flex mb-2 justify-content-between rounded-2" style="background-color: #d3d3d38f; width: 450px;">
                <img src="<%= ResolveUrl("~/Imagenes/Lupa.png") %>" class="m-2" style="height: 20px;" />
                <div class="align-content-around">
                    <label><b>Filtro rápido</b></label>
                </div>
                <asp:TextBox ID="txtFiltroMedico" runat="server" class="border-dark-subtle form-control ms-2" Style="width: 300px;" placeholder="Nombre / Apellido / Especialidad" />
            </div>

            <table class="table table-bordered align-middle text-center">
                <thead class="table-light">
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Especialidad</th>
                        <th>Matrícula</th>
                        <th>Teléfono</th>
                        <th>Franja horaria</th>
                        <th>Días disponibles</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Juan</td>
                        <td>Pérez</td>
                        <td>Cardiología</td>
                        <td>MN 12345</td>
                        <td>(555) 123-4567</td>
                        <td>08:00 - 16:00</td>
                        <td>Lun, Mié, Vie</td>
                        <td>
                            <a href="AgregarMedico.aspx" class="btn btn-outline-secondary btn-sm" title="Editar">
                                <i class="bi bi-pencil"></i>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>Laura</td>
                        <td>Gómez</td>
                        <td>Pediatría</td>
                        <td>MN 98765</td>
                        <td>(555) 987-6543</td>
                        <td>10:00 - 18:00</td>
                        <td>Mar, Jue</td>
                        <td>
                            <a href="AgregarMedico.aspx" class="btn btn-outline-secondary btn-sm" title="Editar">
                                <i class="bi bi-pencil"></i>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
