<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPFinalNivel3_AguirreVillegas.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #tarjeta {
            border-color: #36DEF2; /* Cambiar el color del borde */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center">
        <div class="col-12 col-md-6 text-center mb-4">
            <div class="card" id="tarjeta">
                <h2>Registro</h2>
                <div class="mx-4 text-center">
                    <div class="mb-3 text-center">
                        <asp:TextBox CssClass="form-control d-inline-block" ID="txtNombre" placeholder="Nombre" runat="server" />
                    </div>
                    <div class="mb-3 text-center">
                        <asp:TextBox CssClass="form-control d-inline-block" ID="txtApellido" placeholder="Apellido" runat="server" />
                    </div>
                    <div class="mb-3 text-center">
                        <asp:TextBox CssClass="form-control d-inline-block" ID="txtEmail" TextMode="Email" placeholder="Correo electrónico" runat="server" />
                    </div>
                    <div class="mb-3 text-center">
                        <asp:TextBox CssClass="form-control d-inline-block" ID="txtContraseña" TextMode="Password" MaxLength="15" MinLength="4" placeholder="Contraseña" runat="server" />
                    </div>
                    <div class="mb-3 text-center">
                        <asp:Button Text="Registrarse" CssClass="btn btn-primary btn-block" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" runat="server" />
                    </div>
                </div>
                <p class="text-center">¿Ya tienes una cuenta? <a href="Default.aspx">Iniciar sesión</a></p>
            </div>
        </div>
    </div>
</asp:Content>