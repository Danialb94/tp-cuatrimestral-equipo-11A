<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #F7F4EF !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="d-flex justify-content-center align-items-center" style="min-height: 85vh;">
        <div class="row w-100 d-flex justify-content-center align-items-center">

            <div class="col-md-6 d-flex justify-content-center align-items-center">
                <img src="Imagenes/gatito_error.png"
                    alt="Imagen error"
                    class="img-fluid"
                    style="width: 100%; max-width: 500px;">
            </div>

            <div class="col-md-6 d-flex flex-column justify-content-center align-items-center text-center">
                <h3 class="mb-3">Lo sentimos, ocurrió un error inesperado.</h3>
                <asp:Label Text="text" ID="lblMensajeError" runat="server" />

                <asp:Button ID="btnError" runat="server" Text="Volver" CssClass="btn btn-primary py-2 px-4 w-auto" OnClick="btnError_Click" />
            </div>


        </div>
    </div>

</asp:Content>
