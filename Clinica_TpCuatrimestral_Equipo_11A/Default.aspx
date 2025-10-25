<%@ Page Title="ClinicApp" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Clinica_TpCuatrimestral_Equipo_11A.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />

    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#13a4ec",
                        "background-light": "#f6f7f8",
                        "background-dark": "#101c22",
                    },
                    fontFamily: {
                        "display": ["Inter", "sans-serif"]
                    },
                    borderRadius: {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "full": "9999px"
                    },
                },
            },
        }
    </script>

    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            font-size: 24px;
        }

       
        input[type="password"]::-ms-reveal,
        input[type="password"]::-ms-clear {
            display: none !important;
        }

        input[type="password"]::-webkit-textfield-decoration-container {
            display: none !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="relative flex h-auto min-h-screen w-full flex-col bg-background-light dark:bg-background-dark overflow-x-hidden" style='font-family: Inter, "Noto Sans", sans-serif;'>
        <div class="layout-container flex h-full grow flex-col">
            <div class="flex flex-1 justify-center">
                <div class="layout-content-container flex flex-col w-full flex-1">
                    <main class="flex w-full grow flex-col">
                        <div class="grid flex-1 grid-cols-1 md:grid-cols-2">
                            <div class="relative hidden h-full w-full bg-slate-500 md:flex">
                                <div class="w-full bg-center bg-no-repeat bg-cover aspect-auto flex-1" 
                                     style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuCehpk-MnrM4surB7t9ttY6qKaXb7okZQCII3FAPAcRvAvTcOmGG33-6EnQUrx3A9-U_TS9Oqmiday3OOW0NsYPGhQ8pkMM7HwnfCTgcnVhfhcn6fZzo9K_UPsWq1ZtSvXF5gjryXzpidMo2vP6HhbI10y7jZ-TPQolICMuk9awLHu0_FU_iKK1SWIBJCUTruJU70By5pxWNJ9WM99eW2Eg6JC8_WVJS2o2PV8H_H82nJnDw8jdHizHUDKNafaX_XOBRIq5K-3kjudN");'>
                                </div>
                            </div>

                            <div class="flex w-full items-center justify-center bg-white dark:bg-background-dark py-12 px-4 sm:px-6 lg:px-8">
                                <div class="w-full max-w-md space-y-8">
                                    <div>
                                        <div class="flex items-center justify-start gap-3 pb-6">
                                            <span class="material-symbols-outlined text-primary text-4xl">health_and_safety</span>
                                            <span class="text-2xl font-bold text-[#111618] dark:text-white">ClinicApp</span>
                                        </div>
                                        <h1 class="text-[#111618] dark:text-gray-100 tracking-tight text-[32px] font-bold leading-tight text-left">Bienvenido</h1>
                                        <p class="text-gray-500 dark:text-gray-400 text-base font-normal leading-normal pt-1">
                                            Por favor inicia sesión con tus datos.
                                        </p>
                                    </div>

                                    <asp:Panel runat="server" DefaultButton="btnLogin">
                                        <div class="mt-8 space-y-6">
                                            <div class="space-y-4 rounded-md">
                                                <!-- EMAIL -->
                                                <div class="flex flex-col">
                                                    <label class="flex flex-col min-w-40 flex-1" for="txtEmail">
                                                        <p class="text-[#111618] dark:text-gray-200 text-sm font-medium leading-normal pb-2">Ingrese su correo electrónico</p>
                                                        <asp:TextBox ID="txtEmail" runat="server" 
                                                            CssClass="form-input flex w-full rounded-lg border border-[#dbe2e6] dark:border-gray-600 bg-white dark:bg-gray-800 focus:ring-2 focus:ring-primary/50 h-14 p-[15px] text-base" 
                                                            Placeholder="Correo Electrónico" />
                                                    </label>
                                                </div>

                                                <!-- PASSWORD -->
                                                <div class="flex flex-col">
                                                    <label class="flex flex-col min-w-40 flex-1" for="txtPassword">
                                                        <p class="text-[#111618] dark:text-gray-200 text-sm font-medium leading-normal pb-2">Ingrese su contraseña</p>
                                                        <div class="flex w-full items-stretch">
                                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
                                                                CssClass="form-input flex w-full rounded-l-lg border border-[#dbe2e6] dark:border-gray-600 bg-white dark:bg-gray-800 focus:ring-2 focus:ring-primary/50 h-14 p-[15px] border-r-0 pr-2 text-base" 
                                                                Placeholder="Contraseña" />
                                                            <button type="button" id="togglePassword" 
                                                                class="text-[#617c89] dark:text-gray-400 flex border border-[#dbe2e6] dark:border-gray-600 bg-white dark:bg-gray-800 items-center justify-center px-[15px] rounded-r-lg hover:bg-gray-50 dark:hover:bg-gray-700">
                                                                <span class="material-symbols-outlined">visibility</span>
                                                            </button>
                                                        </div>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="flex items-center justify-end">
                                                <div class="text-sm">
                                                    <a class="font-medium text-primary hover:text-primary/80" href="#">¿Olvidaste tu contraseña?</a>
                                                </div>
                                            </div>

                                            <div>
                                                <asp:Button ID="btnLogin" runat="server" Text="Ingresar"
                                                    CssClass="group relative flex w-full justify-center rounded-lg bg-primary px-4 py-4 text-sm font-bold text-white hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2" 
                                                    OnClick="btnLogin_Click" />
                                            </div>

                                            <div class="text-center">
                                                <a class="text-sm font-medium text-primary hover:text-primary/80" href="#">Registrarse</a>
                                            </div>
                                        </div>
                                    </asp:Panel>

                                    <footer class="pt-8 text-center text-sm text-gray-500 dark:text-gray-400">
                                        <p>© 2024 ClinicApp. Todos los derechos reservados.</p>
                                    </footer>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>
            </div>
        </div>
    </div>

    
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const passwordInput = document.getElementById("<%= txtPassword.ClientID %>");
            const toggleButton = document.getElementById("togglePassword");
            const icon = toggleButton.querySelector(".material-symbols-outlined");

            toggleButton.addEventListener("click", () => {
                const isHidden = passwordInput.type === "password";
                passwordInput.type = isHidden ? "text" : "password";
                icon.textContent = isHidden ? "visibility_off" : "visibility";
            });
        });
    </script>
</asp:Content>
