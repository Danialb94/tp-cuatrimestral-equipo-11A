<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPaciente.Master" AutoEventWireup="true" CodeBehind="EditarPerfilPaciente.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.EditarPerfilPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row d-flex">
        <div class="col-3 h-50 mt-5 p-4 rounded-4" style="background-color: lightgray;">
            <div class="d-flex justify-content-evenly">
                <div>
                    <img src=":imagen.urlImagen "
                        class="rounded-5 order-first order-lg-last me-2"
                        style="height: 100px"
                        onerror="this.onerror=null; this.src='<%= ResolveUrl("~/Imagenes/Perfil_Placeholder.png") %>';">
                </div>
                <div>
                    <h4>Nombre Apellido</h4>
                    <h5>Correo@email.com</h5>
                </div>
            </div>
        </div>
        <div class="col mt-5">
            <h3>Información Personal</h3>
            <p>Visualizá y actualizá tus datos personales. Si no puede editar algún dato, comuniquesé con nosotros</p>
            <div class="g-4 p-3 row row-cols-1 row-cols-md-2">
                <div>
                    <label for="txtNombreCompleto">Nombre Completo</label>
                    <asp:TextBox runat="server" ID="txtNombreCompleto" placeholder="Nombre Apellido" class="bg-dark-subtle border-dark-subtle form-control" ReadOnly="true" />
                </div>
                <div class="d-flex justify-content-between">
                    <div>
                        <label for="txtTipoDocu">Tipo de Documento</label>
                        <asp:TextBox runat="server" ID="txtTipoDocu" placeholder="Pasaporte/DNI/Otro" class="bg-dark-subtle border-dark-subtle form-control" ReadOnly="true" />
                    </div>
                    <div class="ms-2 w-75">
                        <label for="txtDNI">Documento</label>
                        <asp:TextBox runat="server" ID="txtDNI" placeholder="12159753" class="bg-dark-subtle border-dark-subtle form-control" ReadOnly="true" />
                    </div>
                </div>
                <div>
                    <label for="txtNacimiento">Fecha de Nacimiento</label>
                    <asp:TextBox runat="server" ID="txtNacimiento" placeholder="01/01/1990" class="bg-dark-subtle border-dark-subtle form-control" ReadOnly="true" />
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
                    <asp:DropDownList ID="ddlCobertura" runat="server" class="border-dark-subtle d-block p-2 rounded-2" Style="width: 395px; height: 40px;">
                        <asp:ListItem Selected hidden>Obra Social</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <label for="txtFoto">Foto de Perfil</label>
                    <asp:TextBox runat="server" ID="txtFoto" placeholder="https://foto.com" class="border-dark-subtle form-control" />
                </div>
            </div>
            <div class="d-flex justify-content-end">
                <button class="btn me-2 btn-primary rounded-4" >Modificar datos</button>
                <button class="btn btn-outline-dark me-3 rounded-4">Cancelar</button>
            </div>
        </div>
    </div>

</asp:Content>
