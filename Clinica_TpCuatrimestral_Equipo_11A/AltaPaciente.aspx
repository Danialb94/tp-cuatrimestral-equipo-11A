<%@ Page Title="" Language="C#" MasterPageFile="~/MasterRecepcionista.Master" AutoEventWireup="true" CodeBehind="AltaPaciente.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.AltaPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center">
        <div class="card shadow p-4" style="width: 60rem;">
            <div class="text-center mb-3">
                <h4 class="fw-bold">Registrar Paciente</h4>
            </div>

            <div class="row g-3">
                <div class="col-md-6">
                    <label for="txtNombre">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" placeholder="Nombre" CssClass="form-control border-dark-subtle" />
                </div>

                <div class="col-md-6">
                    <label for="txtApellido">Apellido</label>
                    <asp:TextBox runat="server" ID="txtApellido" placeholder="Apellido" CssClass="form-control border-dark-subtle" />
                </div>

                <div class="col-md-4">
                    <label for="ddlTipoDocumento">Tipo de Documento</label>
                    <asp:DropDownList ID="ddlTipoDocumento" runat="server"
                        CssClass="form-select border-dark-subtle">
                    </asp:DropDownList>
                </div>

                <div class="col-md-4">
                    <label for="txtDNI">Documento</label>
                    <asp:TextBox runat="server" ID="txtDNI" placeholder="12159753" CssClass="form-control border-dark-subtle" />
                </div>

                <div class="col-md-4">
                    <label for="txtNacimiento">Fecha de Nacimiento</label>
                    <asp:TextBox runat="server" ID="txtNacimiento" TextMode="Date" CssClass="form-control border-dark-subtle" />
                </div>

                <div class="col-md-6">
                    <label for="txtDireccion">Domicilio</label>
                    <asp:TextBox runat="server" ID="txtDireccion" placeholder="Calle Real 1234" CssClass="form-control border-dark-subtle" />
                </div>

                <div class="col-md-6">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Correo@email.com" CssClass="form-control border-dark-subtle" />
                </div>

                <div class="col-md-6">
                    <label for="txtTelefono">Teléfono</label>
                    <asp:TextBox runat="server" ID="txtTelefono" placeholder="11 1234-1234" CssClass="form-control border-dark-subtle" />
                </div>

                <div class="col-md-6">
                    <label for="ddlCobertura">Obra Social</label>
                    <asp:DropDownList ID="ddlCobertura" runat="server"
                        CssClass="form-select border-dark-subtle">
                        <asp:ListItem Selected hidden>Obra Social</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="d-flex justify-content-end mt-4">
                <a href="PacientesRecepcionista.aspx" class="btn btn-secondary border-black me-2" style="width: 120px;">Volver</a>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar"
                    CssClass="btn btn-primary" Style="width: 200px;"
                    OnClick="btnGuardar_Click" />
            </div>
        </div>
    </div>
</asp:Content>
