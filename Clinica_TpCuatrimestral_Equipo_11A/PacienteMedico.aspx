<%@ Page Title="Pacientes Médico" Language="C#" MasterPageFile="~/MasterMedico.Master"
    AutoEventWireup="true" CodeBehind="PacienteMedico.aspx.cs"
    Inherits="Clinica_TpCuatrimestral_Equipo_11A.PacienteMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h3 class="fw-bold mb-3">Listado de Pacientes</h3>
        <p class="text-muted mb-4">Seleccione un paciente para ver su historial clínico.</p>

        <!-- Tarjeta + filtro en la misma fila -->
        <div class="d-flex justify-content-between align-items-center mb-3 flex-wrap">
            <div class="card border-0 shadow-sm p-3 mb-3 mb-md-0" style="width: 18rem;">
                <div class="d-flex align-items-center">
                    <i class="bi bi-people-fill text-primary fs-3 me-3"></i>
                    <div>
                        <h6 class="mb-0">Pacientes activos</h6>
                        <p class="fw-bold text-primary mb-0">
                            <asp:Label ID="lblTotalPacientes" runat="server" Text="0"></asp:Label>
                        </p>
                    </div>
                </div>
            </div>

            <!-- Filtro rápido -->
            <div class="input-group w-auto">
                <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control"
                    placeholder="Buscar paciente..." AutoPostBack="true"
                    OnTextChanged="txtBuscar_TextChanged" />
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar"
                    CssClass="btn btn-outline-secondary" OnClick="btnLimpiar_Click" />
            </div>
        </div>

        <hr class="my-3" />

        <!-- Tabla de pacientes -->
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <asp:GridView ID="gvPacientes" runat="server" AutoGenerateColumns="False"
                    CssClass="table align-middle table-hover" GridLines="None"
                    EmptyDataText="No se encontraron pacientes.">

                    <Columns>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                        <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" />
                        <asp:TemplateField HeaderText="Obra Social">
                            <ItemTemplate>
                                <%# Eval("Cobertura.Descripcion") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnVerHistorial" runat="server"
                                    CommandArgument='<%# Eval("IdPaciente") %>'
                                    OnClick="btnVerHistorial_Click"
                                    CssClass="btn btn-outline-primary btn-sm">
                                    <i class="bi bi-card-text me-1"></i>Ver registro consultas
                                </asp:LinkButton>

                                


                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
