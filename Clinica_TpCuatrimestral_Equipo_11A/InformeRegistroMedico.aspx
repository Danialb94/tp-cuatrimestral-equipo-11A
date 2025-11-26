<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformeRegistroMedico.aspx.cs"
    Inherits="Clinica_TpCuatrimestral_Equipo_11A.InformeRegistroMedico" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Informe Médico</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: #f8f9fa;
            padding: 30px;
            font-family: Arial, sans-serif;
        }

        .informe-container {
            background: white;
            padding: 35px;
            border-radius: 8px;
            border: 1px solid #ddd;
        }

        h4.section-title {
            border-bottom: 2px solid #0d6efd;
            padding-bottom: 5px;
            margin-top: 25px;
            font-weight: bold;
        }

        .firma-box {
            margin-top: 60px;
            text-align: center;
        }

        .firma-linea {
            border-top: 1px solid #000;
            width: 260px;
            margin: 0 auto;
            margin-bottom: 5px;
        }

        .footer-text {
            margin-top: 35px;
            font-size: 0.85rem;
            text-align: center;
            color: #666;
        }

        @media print {
            body {
                padding: 0;
                background: white;
            }
            .no-print {
                display: none !important;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="informe-container mx-auto" style="max-width: 800px;">

            <!-- LOGO + NOMBRE -->
            <div class="text-center mb-4">
                <img src="https://i.postimg.cc/vT8ZftkZ/photo-2025-10-25-19-40-56.jpg"
                     alt="ClinicApp Logo"
                     class="img-fluid mb-2"
                     style="width: 80px; height: 80px; border-radius: 50%;">
                <h2 class="fw-bold mt-2">ClinicApp</h2>
                <p class="text-muted">Informe clínico del paciente</p>
            </div>

            <!-- DATOS DEL PACIENTE -->
            <h4 class="section-title">Datos del paciente</h4>
            <p><strong>Paciente:</strong> <asp:Label ID="lblPaciente" runat="server" /></p>
            <p><strong>Fecha de consulta:</strong> <asp:Label ID="lblFecha" runat="server" /></p>
            <p><strong>Motivo:</strong> <asp:Label ID="lblMotivo" runat="server" /></p>

            <!-- DIAGNÓSTICO -->
            <h4 class="section-title">Diagnóstico</h4>
            <p><asp:Label ID="lblDiagnostico" runat="server" /></p>

            <!-- OBSERVACIONES -->
            <h4 class="section-title">Observaciones</h4>
            <p><asp:Label ID="lblObservacion" runat="server" /></p>

            <!-- TRATAMIENTO -->
            <h4 class="section-title">Tratamiento</h4>
            <p><asp:Label ID="lblTratamiento" runat="server" /></p>

            <!-- FIRMA DEL MÉDICO -->
            <div class="firma-box">
                <div class="firma-linea"></div>
                <strong><asp:Label ID="lblMedicoNombre" runat="server" /></strong><br />
                <span>Médico responsable</span>
            </div>

            <!-- FOOTER -->
            <div class="footer-text">
                Este informe fue generado desde el sistema clínico ClinicApp.
            </div>
        </div>

        <!-- Botón solo visible fuera de impresión -->
        <div class="text-center mt-4 no-print">
            <button onclick="window.print()" class="btn btn-primary px-4">
                🖨️ Imprimir informe
            </button>
            <a href="RegistroConsultaMedico.aspx" class="btn btn-secondary px-4 ms-2">
                Volver
            </a>
        </div>

    </form>
</body>
</html>
