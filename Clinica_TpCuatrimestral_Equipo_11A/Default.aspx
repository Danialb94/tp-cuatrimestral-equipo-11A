<%@ Page Title="ClinicApp" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container-fluid vh-100">
    <div class="row h-100">

     
      <div class="col-md-6 p-0 d-none d-md-block">
        <img src="https://i.postimg.cc/02GDD9QV/clinicapp-medicos.png"
             alt="Imagen clínica"
             class="w-100 h-100"
             style="object-fit: cover; border-top-right-radius: 0; border-bottom-right-radius: 0;">
      </div>

     
      <div class="col-md-6 d-flex justify-content-center align-items-center bg-white">
        <div class="p-5" style="max-width: 400px; width: 100%;">
          
         
          <div class="text-center mb-4">
            <img src="https://i.postimg.cc/vT8ZftkZ/photo-2025-10-25-19-40-56.jpg"
                 alt="ClinicApp Logo"
                 class="img-fluid mb-2"
                 style="width: 80px; height: 80px; border-radius: 50%;">
            <h3 class="fw-bold mt-3">ClinicApp</h3>
          </div>

          
          <h4 class="fw-semibold mb-1">Bienvenido de nuevo</h4>
          <p class="text-muted mb-4">Iniciá sesión en tu portal clínico</p>

         
          <div class="mb-3">
            <label for="txtEmail" class="form-label fw-bold">Correo electrónico</label>
            <asp:TextBox ID="txtEmail" CssClass="form-control p-2" placeholder="Ingresá tu correo" TextMode="Email" runat="server"></asp:TextBox>
          </div>

          <div class="mb-3">
            <label for="txtPassword" class="form-label fw-bold">Contraseña</label>
            <div class="input-group">
              <asp:TextBox ID="txtPassword" CssClass="form-control p-2" placeholder="Ingresá tu contraseña" TextMode="Password" runat="server"></asp:TextBox>
              <span class="input-group-text bg-white border-start-0">
                <i class="bi bi-eye"></i>
              </span>
            </div>
          </div>

         
          <div class="d-flex justify-content-end mb-3">
            <a href="#" class="text-decoration-none">¿Olvidaste tu contraseña?</a>
          </div>

          <asp:Button ID="btnSubmit" Text="Ingresar" CssClass="btn btn-primary w-100 py-2" runat="server" />

          <div class="text-center mt-3">
            <span class="text-muted">¿No tenés una cuenta?</span>
            <a href="#" class="text-decoration-none fw-bold">Registrate</a>
          </div>

         
          <footer class="text-center text-muted mt-5" style="font-size: 0.85rem;">
            © 2025 ClinicApp. Todos los derechos reservados. <br />
            <a href="#" class="text-decoration-none">Centro de ayuda</a> ·
            <a href="#" class="text-decoration-none">Política de privacidad</a>
          </footer>
        </div>
      </div>

    </div>
  </div>
</asp:Content>
