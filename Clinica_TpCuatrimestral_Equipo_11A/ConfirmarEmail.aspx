<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ConfirmarEmail.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.ConfirmarEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center align-items-center vh-100 bg-light">
        <div class="card shadow p-4" style="width: 22rem;">
            <div class="mb-3 text-center">
                <img src="https://i.postimg.cc/vT8ZftkZ/photo-2025-10-25-19-40-56.jpg"
                    alt="ClinicApp Logo"
                    class="img-fluid rounded-circle border shadow-sm"
                    style="width: 100px; height: 100px; object-fit: cover;">
            </div>

            <h4 class="text-center mb-4">Confirmar correo electrónico</h4>

            <div class="form-text">Un código de 6 dígitos fue enviado a tu casilla de correo. Por favor ingresalo debajo para verificar tu cuenta.</div>


            <div class="d-flex justify-content-center gap-2 my-4">
                <asp:TextBox ID="txtCodigo1" runat="server" MaxLength="1"
                    CssClass="form-control text-center shadow-sm"
                    Style="width: 45px; height: 50px; border-radius: 8px; border: 1px solid #dee2e6; font-size: 1.25rem;">
                </asp:TextBox>
                <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtCodigo1" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="Debe ingresar un número del 0 al 9" ControlToValidate="txtCodigo1" ValidationExpression="^\d$" Display="Dynamic" CssClass="text-danger" runat="server" />


                <asp:TextBox ID="txtCodigo2" runat="server" MaxLength="1"
                    CssClass="form-control text-center shadow-sm"
                    Style="width: 45px; height: 50px; border-radius: 8px; border: 1px solid #dee2e6; font-size: 1.25rem;">
                </asp:TextBox>
                <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtCodigo2" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="Debe ingresar un número del 0 al 9" ControlToValidate="txtCodigo2" ValidationExpression="^\d$" Display="Dynamic" CssClass="text-danger" runat="server" />

                <asp:TextBox ID="txtCodigo3" runat="server" MaxLength="1"
                    CssClass="form-control text-center shadow-sm"
                    Style="width: 45px; height: 50px; border-radius: 8px; border: 1px solid #dee2e6; font-size: 1.25rem;">
                </asp:TextBox>
                <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtCodigo3" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="Debe ingresar un número del 0 al 9" ControlToValidate="txtCodigo3" ValidationExpression="^\d$" Display="Dynamic" CssClass="text-danger" runat="server" />

                <asp:TextBox ID="txtCodigo4" runat="server" MaxLength="1"
                    CssClass="form-control text-center shadow-sm"
                    Style="width: 45px; height: 50px; border-radius: 8px; border: 1px solid #dee2e6; font-size: 1.25rem;">
                </asp:TextBox>
                <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtCodigo4" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="Debe ingresar un número del 0 al 9" ControlToValidate="txtCodigo4" ValidationExpression="^\d$" Display="Dynamic" CssClass="text-danger" runat="server" />

                <asp:TextBox ID="txtCodigo5" runat="server" MaxLength="1"
                    CssClass="form-control text-center shadow-sm"
                    Style="width: 45px; height: 50px; border-radius: 8px; border: 1px solid #dee2e6; font-size: 1.25rem;">
                </asp:TextBox>
                <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtCodigo5" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="Debe ingresar un número del 0 al 9" ControlToValidate="txtCodigo5" ValidationExpression="^\d$" Display="Dynamic" CssClass="text-danger" runat="server" />

                <asp:TextBox ID="txtCodigo6" runat="server" MaxLength="1"
                    CssClass="form-control text-center shadow-sm"
                    Style="width: 45px; height: 50px; border-radius: 8px; border: 1px solid #dee2e6; font-size: 1.25rem;">
                </asp:TextBox>
                <asp:RegularExpressionValidator ErrorMessage="No se permiten espacios vacíos" ControlToValidate="txtCodigo6" ValidationExpression="^\S(.*\S)?$" Display="Dynamic" CssClass="text-danger" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="Debe ingresar un número del 0 al 9" ControlToValidate="txtCodigo6" ValidationExpression="^\d$" Display="Dynamic" CssClass="text-danger" runat="server" />
            </div>
            <asp:Label ID="lblError" runat="server"
                CssClass="text-danger text-center d-block mb-2"
                Visible="false">
            </asp:Label>

            <asp:Button ID="btnSubmit" Text="Confirmar correo electrónico" CssClass="btn btn-primary w-100" runat="server" OnClick="btnSubmit_Click" />
            <asp:Label ID="LabelError2" runat="server"
                Text=""
                CssClass="text-danger text-center d-block mt-2"
                Visible="false"></asp:Label>

            <div class="text-center mt-3">
                <span class="text-muted">¿No recibiste el código?</span>
                <asp:LinkButton ID="lnkReenviar" runat="server"
                    CssClass="text-decoration-none fw-bold"
                    OnClick="lnkReenviar_Click">
                    Reenviar
                </asp:LinkButton>
            </div>
            <div class="text-center mt-3">
                <a href="Default.aspx" class="text-decoration-none">Volver al inicio</a>
            </div>
           <script>
               document.addEventListener("DOMContentLoaded", function () {
                  
                   var ids = [
            '<%= txtCodigo1.ClientID %>',
            '<%= txtCodigo2.ClientID %>',
            '<%= txtCodigo3.ClientID %>',
            '<%= txtCodigo4.ClientID %>',
            '<%= txtCodigo5.ClientID %>',
            '<%= txtCodigo6.ClientID %>'
        ];

        var inputs = ids.map(function(id) { return document.getElementById(id); });

        inputs.forEach(function(input, index) {
            if (!input) return;

            
            input.setAttribute('maxlength', '1');
           
            input.setAttribute('inputmode', 'numeric');
            input.setAttribute('autocomplete', 'off');

            input.addEventListener('input', function (e) {
               
                this.value = this.value.replace(/[^0-9]/g, '');

               
                if (this.value.length > 1) {
                    var chars = this.value.split('');
                    this.value = chars[0];
                    var k = 1;
                    for (var j = index + 1; j < inputs.length && k < chars.length; j++, k++) {
                        inputs[j].value = chars[k].replace(/[^0-9]/g, '');
                    }
                }

                
                if (this.value.length === 1 && index < inputs.length - 1) {
                    inputs[index + 1].focus();
                    inputs[index + 1].select();
                }

              
                // var allFilled = inputs.every(i => i && i.value.length === 1);
                // if (allFilled) document.getElementById('<%= btnSubmit.ClientID %>').removeAttribute('disabled');
            });

            
            input.addEventListener('keydown', function (e) {
                if (e.key === 'Backspace' && this.value === '' && index > 0) {
                    inputs[index - 1].focus();
                    inputs[index - 1].select();
                }
                
                if (['ArrowLeft', 'ArrowRight', 'Tab', 'Delete'].indexOf(e.key) !== -1) {
                    return;
                }
              
                if (!/^\d$/.test(e.key) && e.key.length === 1) {
                    e.preventDefault();
                }
            });

            
            input.addEventListener('paste', function (e) {
                e.preventDefault();
                var paste = (e.clipboardData || window.clipboardData).getData('text');
                paste = paste.replace(/[^0-9]/g, '');
                if (!paste) return;
                var chars = paste.split('');
               
                this.value = chars[0];
                var k = 1;
                for (var j = index + 1; j < inputs.length && k < chars.length; j++, k++) {
                    inputs[j].value = chars[k];
                }
                
                for (var n = index; n < inputs.length; n++) {
                    if (inputs[n] && inputs[n].value.length === 0) {
                        inputs[n].focus();
                        break;
                    }
                }
            });
        });
    });
           </script>


</asp:Content>
