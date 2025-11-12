<%@ Page Title="" Language="C#" MasterPageFile="~/MasterRecepcionista.Master" AutoEventWireup="true" CodeBehind="PacientesRecepcionista.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.PacientesRecepcionista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card shadow-sm border-0">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-3">
                <h4 class="fw-bold">Pacientes Registrados</h4>
                <a class="bi bi-plus-circle me-1 btn btn-primary" href="AltaPaciente.aspx">Nuevo Paciente</a>
            </div>
            <div>
                <div class="d-flex mb-2 justify-content-between rounded-2" style="background-color: #d3d3d38f; width: 450px;">
                    <img src="<%= ResolveUrl("~/Imagenes/Lupa.png") %>" class="m-2" style="height: 20px;" />
                    <div class="align-content-around">
                        <label><b>Filtro rápido</b></label>
                    </div>
                    <asp:TextBox ID="txtFiltroPaciente" runat="server"
                        class="border-dark-subtle form-control ms-2"
                        Style="width: 300px;"
                        placeholder="Nombre / Apellido /Documento"
                        AutoPostBack="true"
                        OnTextChanged="txtFiltroPaciente_TextChanged">
                    </asp:TextBox>
                </div>
                <asp:GridView ID="dgvPacientesRecepcionista" runat="server"
                    CssClass="table table-bordered text-center align-middle"
                    AutoGenerateColumns="false"
                    OnRowCommand="dgvPacientesRecepcionista_RowCommand">

                    <Columns>
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                        <asp:BoundField HeaderText="Documento" DataField="Documento" />
                        <asp:BoundField HeaderText="Cobertura" DataField="Cobertura.Descripcion" />

                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton
                                    ID="btnSolicitarTurno"
                                    runat="server"
                                    CssClass="btn btn-primary btn-sm"
                                    CommandName="SolicitarTurno"
                                    CommandArgument='<%# Eval("IdPaciente") %>'>
                                    Solicitar turno
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
