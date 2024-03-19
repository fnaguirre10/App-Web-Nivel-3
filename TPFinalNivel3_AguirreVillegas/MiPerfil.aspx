<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="TPFinalNivel3_AguirreVillegas.MiPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .validacion{
            color: red;
            font-size: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <div class="fondo" style="margin-top: 45px; margin-bottom: 45px;">
            <div class="row">
                <!-- Columna izquierda -->
                <div class="col-md-6">
                    <div class="d-flex justify-content-center align-items-center">
                        <asp:Image ID="imgPerfil" ImageUrl="/images/no_usuario.png"
                            runat="server" CssClass="img-fluid mb-3" Style="height: 250px; width: 250px; border-radius: 50%;" />
                    </div>
                    <div class="text-center">
                        <asp:Label runat="server" Text="Usuario" ID="lblNombreUsuario" class="profile-name" />
                        <br />
                        <asp:Label runat="server" Text="Email" ID="lblEmail" class="profile-email" />
                    </div>
                </div>
                <!-- Columna derecha -->
                <div class="col-md-6">
                    <div class="profile-details">
                        <h5>Datos de perfil:</h5>
                        <div class="form-group">
                            <label for="name">Nombre:</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />
                            <asp:RequiredFieldValidator ErrorMessage="El nombre es requerido" CssClass="validacion" ControlToValidate="txtNombre" runat="server" />
                        </div>
                        <div class="form-group">
                            <label for="surname">Apellido:</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtApellido" />
                            <asp:RequiredFieldValidator ErrorMessage="El apellido es requerido" CssClass="validacion" ControlToValidate="txtApellido" runat="server" />
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="form-group" style="margin-bottom: 20px;">
                                    <label for="city">Ciudad:</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" AutoPostBack="true" ID="ddlCiudad" OnSelectedIndexChanged="ddlCiudad_SelectedIndexChanged">
                                        <asp:ListItem Text="Buenos Aires" />
                                        <asp:ListItem Text="Catamarca" />
                                        <asp:ListItem Text="Chaco" />
                                        <asp:ListItem Text="Chubut" />
                                        <asp:ListItem Text="Córdoba" />
                                        <asp:ListItem Text="Corrientes" />
                                        <asp:ListItem Text="Entre Ríos" />
                                        <asp:ListItem Text="Formosa" />
                                        <asp:ListItem Text="Jujuy" />
                                        <asp:ListItem Text="La Pampa" />
                                        <asp:ListItem Text="La Rioja" />
                                        <asp:ListItem Text="Mendoza" />
                                        <asp:ListItem Text="Misiones" />
                                        <asp:ListItem Text="Neuquén" />
                                        <asp:ListItem Text="Río Negro" />
                                        <asp:ListItem Text="Salta" />
                                        <asp:ListItem Text="San Juan" />
                                        <asp:ListItem Text="San Luis" />
                                        <asp:ListItem Text="Santa Cruz" />
                                        <asp:ListItem Text="Santa Fe" />
                                        <asp:ListItem Text="Santiago del Estero" />
                                        <asp:ListItem Text="Tierra del Fuego" />
                                        <asp:ListItem Text="Tucumán" />
                                    </asp:DropDownList>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 20px;"> <!-- Añadir margen de 20px entre el DropDownList y el campo de imagen -->
                                        <label for="image">Cambiar imagen:</label>
                                        <input type="file" id="txtImagen" runat="server" class="form-control" />
                                        <small class="form-text text-muted">Formatos admitidos: JPG, PNG. Tamaño máximo de archivo: 5 MB.</small>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="text-left"> <!-- Alinear el botón Guardar a la izquierda -->
                                <asp:Button Text="Guardar" ID="btnGuardar" OnClick="btnGuardar_Click" CssClass="btn btn-primary" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
