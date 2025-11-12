<%@ Page Title="" Language="C#" MasterPageFile="~/MasterRecepcionista.Master" AutoEventWireup="true" CodeBehind="InicioRecepcionista.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.InicioRecepcionista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card shadow-sm border-0">
        <div class="card-body">
            <h4 class="fw-bold mb-3">Historial de turnos</h4>

            <div class="mb-4">
                <asp:DropDownList
                    ID="ddlEspecialidadesRecepcionista" runat="server" CssClass="border-dark-subtle h-100 rounded-2 form-select" Style="width: 240px;" AutoPostBack="true" OnSelectedIndexChanged="ddlEspecialidadesRecepcionista_SelectedIndexChanged">
                    <asp:ListItem Selected hidden>Seleccione la Especialidad</asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:GridView ID="gvTurnosRecepcionista" runat="server"
                CssClass="table table-bordered text-center align-middle"
                AutoGenerateColumns="false">
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
                </Columns>
            </asp:GridView>

        </div>
    </div>
</asp:Content>
