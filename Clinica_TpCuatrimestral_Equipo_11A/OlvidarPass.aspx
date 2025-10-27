<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OlvidarPass.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.OlvidarPass" %>
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

      <h4 class="text-center mb-4">¿Olvidaste tu contraseña?</h4>

      <div class="mb-3">
        <div class="form-text">Ingresa tu correo electrónico y te enviaremos un código para reestablecer tu contraseña.</div>
        <label for="txtEmail" class="form-label">Correo Electrónico</label>
        <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Ingresa tu correo electrónico"  TextMode="Email" runat="server"></asp:TextBox>
       
      </div>

      
   

<asp:Button ID="btnSubmit" Text="Enviar código" CssClass="btn btn-primary w-100" runat="server" />

<div class="text-center mt-3">
  <a href="Default.aspx" class="text-decoration-none">Volver al inicio</a>
</div>

</asp:Content>
