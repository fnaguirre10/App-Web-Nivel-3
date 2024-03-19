<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPFinalNivel3_AguirreVillegas.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #tarjeta {
            border-color: #36DEF2; /* Cambiar el color del borde */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12 text-center mb-4">
            <asp:Image ID="teknoLogo" runat="server" style="width: 200px; height: 200px;" />
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-6">
            <h2 class="text-center">Iniciar Sesión</h2>
            <div class="card" id="tarjeta">
                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <asp:TextBox runat="server" CssClass="form-control" Required="required" ID="txtEmail" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtPassword" TextMode="Password" />
                    </div>
                    <div class="text-left">
                        <div class="mb-3" style="display: inline-block;">
                            <asp:Button Text="Ingresar" CssClass="btn btn-primary" ID="btnIngresar" OnClick="btnIngresar_Click" runat="server" />
                        </div>
                        <div class="mb-3" style="display: inline-block; margin-left: 5px;">
                            <a href="/">Cancelar</a>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">¿No tienes cuenta?</label>
                            <a href="Registro.aspx">Registrarse</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

