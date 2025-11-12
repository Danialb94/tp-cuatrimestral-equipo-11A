<%@ Page Title="Cancelar Turnos" Language="C#" MasterPageFile="~/MasterRecepcionista.Master" AutoEventWireup="true"
    CodeBehind="CancelarTurnosRecepcionista.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.CancelarTurnosRecepcionista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <h4 class="fw-bold mb-4">Cancelar turnos</h4>

                <div class="row g-3 align-items-end mb-4">
                    <div class="col-md-3">
                        <label class="form-label fw-semibold">Especialidad</label>
                        <asp:DropDownList ID="ddlCancelarRecepcionista" runat="server"
                            CssClass="form-select form-select-sm border-dark-subtle rounded-2"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCancelarRecepcionista_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>

                <asp:GridView ID="dgvCancelarTurnosRecepcionista" runat="server"
                    CssClass="table table-bordered text-center align-middle"
                    AutoGenerateColumns="false" OnRowCommand="dgvCancelarTurnosRecepcionista_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="FechaHora" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                        <asp:TemplateField HeaderText="Paciente">
                            <ItemTemplate><%# Eval("Paciente.Nombre") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Médico">
                            <ItemTemplate><%# Eval("Medico.Nombre") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Especialidad">
                            <ItemTemplate><%# Eval("Especialidad.Descripcion") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                        <asp:TemplateField HeaderText="Acción">
                            <ItemTemplate>
                                <asp:Button runat="server" Text="Cancelar" CommandName="CancelarTurno"
                                    CommandArgument='<%# Eval("IdTurno") %>'
                                     CssClass="btn btn-primary" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:Label ID="lblMensaje" runat="server" CssClass="text-success fw-semibold mt-3 d-block"></asp:Label>

            </div>
        </div>
    </div>
</asp:Content>
