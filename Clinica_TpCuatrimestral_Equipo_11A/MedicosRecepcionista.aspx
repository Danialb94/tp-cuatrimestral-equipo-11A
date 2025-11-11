<%@ Page Title="Médicos" Language="C#" MasterPageFile="~/MasterRecepcionista.Master" AutoEventWireup="true" CodeBehind="MedicosRecepcionista.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.MedicosRecepcionista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card shadow-sm border-0">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-3">
                <h4 class="fw-bold">Médicos Registrados</h4>
                <a class="bi bi-plus-circle me-1 btn btn-primary" href="AgregarMedico.aspx">Nuevo Médico</a>
            </div>

            <div class="d-flex mb-2 justify-content-between rounded-2 align-items-center"
                style="background-color: #d3d3d38f; width: 700px;">
                <img src="<%= ResolveUrl("~/Imagenes/Lupa.png") %>" class="m-2" style="height: 20px;" />
                <div class="align-content-around">
                    <asp:Label><b>Filtro rápido</b></asp:Label>
                </div>
                <asp:TextBox ID="txtFiltroMedico" runat="server"
                    class="border-dark-subtle form-control ms-2" Style="width: 300px;" placeholder="Nombre / Apellido" AutoPostBack="true" OnTextChanged="txtFiltroMedico_TextChanged">
                </asp:TextBox>

                <asp:DropDownList
                    ID="ddlEspecialidadesRecepcionistaMedicos"
                    runat="server"
                    CssClass="border-dark-subtle h-100 rounded-2 form-select ms-2"
                    Style="width: 240px;"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlEspecialidadesRecepcionistaMedicos_SelectedIndexChanged">
                    <asp:ListItem Selected hidden>Seleccione la Especialidad</asp:ListItem>
                </asp:DropDownList>

            </div>


            <asp:GridView ID="dgvMedicos" runat="server"
                CssClass="table table-bordered align-middle text-center"
                AutoGenerateColumns="false"
                OnRowDataBound="dgvMedicos_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="Matricula" HeaderText="Matrícula" />
                    <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />

                    <asp:TemplateField HeaderText="Especialidad">
                        <ItemTemplate>
                            <asp:Literal ID="litEspecialidad" runat="server"></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Franja horaria">
                        <ItemTemplate>
                            <asp:Literal ID="litHorario" runat="server"></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Días disponibles">
                        <ItemTemplate>
                            <asp:Literal ID="litDias" runat="server"></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <a href='AgregarMedico.aspx?id=<%# Eval("IdMedico") %>'
                                class="btn btn-outline-secondary btn-sm" title="Editar">
                                <i class="bi bi-pencil"></i>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


        </div>
    </div>
</asp:Content>
