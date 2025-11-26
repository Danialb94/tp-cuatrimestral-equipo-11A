<%@ Page Title="" Language="C#" MasterPageFile="~/MasterRecepcionista.Master" AutoEventWireup="true" CodeBehind="InicioRecepcionista.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.InicioRecepcionista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card shadow-sm border-0">
        <div class="card-body">
            <h4 class="fw-bold mb-3">Historial de turnos</h4>

            <div class="mb-4 d-flex">
                <div class="me-3">
                    <label class="form-label fw-bold">Especialidades</label>
                    <asp:DropDownList
                        ID="ddlEspecialidadesRecepcionista" runat="server" CssClass="border-dark-subtle rounded-2 form-select" Style="width: 240px;" AutoPostBack="true" OnSelectedIndexChanged="AplicarFiltros">
                    </asp:DropDownList>
                </div>
                <div class="me-3">
                    <label class="form-label fw-bold">Estado</label>
                    <asp:DropDownList
                        ID="ddlEstado"
                        runat="server"
                        CssClass="form-select border-dark-subtle"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="AplicarFiltros">
                    </asp:DropDownList>
                </div>
                <div class="me-3"> 
                    <label class="form-label fw-bold">Desde</label>
                    <asp:TextBox
                        ID="txtFechaDesde"
                        runat="server"
                        TextMode="Date"
                        CssClass="form-control border-dark-subtle"
                        AutoPostBack="true"
                        OnTextChanged="AplicarFiltros">
                    </asp:TextBox>
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <asp:Button 
                        ID="btnLimpiarFiltros" 
                        runat="server" 
                        Text="Limpiar Filtros" 
                        CssClass="btn btn-primary" 
                        OnClick="btnLimpiarFiltros_Click" />
                </div>
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
