<%@ Page Title="" Language="C#" MasterPageFile="~/MasterRecepcionista.Master" AutoEventWireup="true" CodeBehind="AltaPaciente.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.AltaPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center">
        <div class="card shadow p-4" style="width: 60rem;">
            <div class="text-center">
                <h4 class="fw-bold">Registrar Paciente</h4>
            </div>

            <div class="g-2 p-3 row row-cols-1 row-cols-md-2">
                <div>
                    <label for="txtNombreCompleto">Nombre Completo</label>
                    <asp:TextBox runat="server" ID="txtNombreCompleto" placeholder="Nombre Apellido" class="border-dark-subtle form-control" />
                </div>
                <div class="d-flex justify-content-between">
                    <div>
                        <label for="txtTipoDocu">Tipo de Documento</label>
                        <asp:TextBox runat="server" ID="txtTipoDocu" placeholder="Pasaporte/DNI/..." class="border-dark-subtle form-control" />
                    </div>
                    <div class="ms-2 w-75">
                        <label for="txtDNI">Documento</label>
                        <asp:TextBox runat="server" ID="txtDNI" placeholder="12159753" class="border-dark-subtle form-control" />
                    </div>
                </div>
                <div>
                    <label for="txtNacimiento">Fecha de Nacimiento</label>
                    <asp:TextBox runat="server" ID="txtNacimiento" placeholder="01/01/1990" class="border-dark-subtle form-control" />
                </div>
                <div>
                    <label for="txtDireccion">Domicilio</label>
                    <asp:TextBox runat="server" ID="txtDireccion" placeholder="Calle Real 1234" class="border-dark-subtle form-control" />
                </div>
                <div>
                    <label for="txtEmail">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Correo@email.com" class="border-dark-subtle form-control" />
                </div>
                <div>
                    <label for="txtTelefono">Teléfono</label>
                    <asp:TextBox runat="server" ID="txtTelefono" placeholder="11 1234-1234" class="border-dark-subtle form-control" />
                </div>
                <div>
                    <label for="ddlCobertura">Obra Social</label>
                    <asp:DropDownList ID="ddlCobertura" runat="server" class="border-dark-subtle d-block p-2 rounded-2" Style="width: 430px; height: 39px;">
                        <asp:ListItem Selected hidden>Obra Social</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div>
                <div class="d-flex justify-content-end mt-3">
                    <a href="PacientesRecepcionista.aspx" class="btn btn-secondery border-black me-2" style="width: 100px;">Volver</a>
                    <button type="button" class="btn btn-primary" style="width: 200px;" data-bs-toggle="modal" data-bs-target="#ModalAlta">Guardar Datos</button>
                </div>

                <div class="modal fade" id="ModalAlta" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Registrado!</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                El paciente fue registrado con éxito!
                            </div>
                            <div class="modal-footer">
                                <a type="button" class="btn btn-primary" href="PacientesRecepcionista.aspx">OK</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
