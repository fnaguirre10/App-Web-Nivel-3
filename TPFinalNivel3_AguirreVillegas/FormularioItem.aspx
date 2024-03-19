<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioItem.aspx.cs" Inherits="TPFinalNivel3_AguirreVillegas.FormularioItem" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            max-width: 600px;
            margin: 0px auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .validacion {
            color: red;
            font-size: 12px;
        }

        #tarjeta {
            border-color: #36DEF2; /* Cambiar el color del borde */
        }
    </style>
    <script type="text/javascript">
        function cargarImagenPredeterminada() {
            var imagen = document.getElementById('<%= imgItem.ClientID %>');
            imagen.setAttribute('src', '/Imagenes/imagenNoCarga.jpg');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <h1 style="text-align: center">Formulario de Productos</h1>
        <br />
        <div class="row">
            <div class="col-6">
                <div class="card" id="tarjeta">
                <div class="mb-3 text-left">
                    <label for="txtId" class="form-label">Id</label>
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                </div>
                <div class="mb-3 text-left">
                    <label for="txtCodigo" class="form-label">Código :</label>
                    <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="El código es requerido" CssClass="validacion" ControlToValidate="txtCodigo" runat="server" />
                </div>
                <div class="mb-3 text-left">
                    <label for="txtNombre" class="form-label">Nombre :</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="El nombre es requerido" CssClass="validacion" ControlToValidate="txtNombre" runat="server" />
                </div>
                <div class="mb-3 text-left">
                    <label for="ddlMarca" class="form-label">Marca :</label>
                    <asp:DropDownList ID="ddlMarca" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3 text-left">
                    <label for="ddlCategoria" class="form-label">Categoria :</label>
                    <asp:DropDownList ID="ddlCategoria" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3 text-left">
                    <label for="txtPrecio" class="form-label">Precio :</label>
                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="El precio es requerido" CssClass="validacion" ControlToValidate="txtPrecio" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Ingresar solo números" CssClass="validacion" ValidationExpression="^[0-9,.]+$" ControlToValidate="txtPrecio" runat="server" />
                </div>
             </div>
            <div class="text-left">
             <div class="mb-3" style="display: inline-block;">
                    <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                </div>
                <div class="mb-3" style="display: inline-block; margin-left: 5px;">
                    <a href="ListaItem.aspx">Cancelar</a>
                </div>
            </div>
            </div>
            <div class="col-6">
                <div class="card" id="tarjeta">
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label">Descripción :</label>
                    <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control" />
                </div>
                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                        <div class="mb-3">
                            <label for="txtImagenUrl" class="form-label">Imagen Url :</label>
                            <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                        </div>
                        <div style="text-align: center;">
                            <asp:Image runat="server" ID="imgItem" Width="400px" Height="400px" CssClass="img-500x500" onerror="this.onerror=null; this.src='https://t3.ftcdn.net/jpg/02/48/42/64/360_F_248426448_NVKLywWqArG2ADUxDq6QprtIzsF82dMF.jpg';" />
                        </div>
                        
                    <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
            </div>
           </div>
        </div>
        <div class="row">
            <div class="col-6">
                <asp:UpdatePanel ID="Updatepanel2" runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger" runat="server" />
                        </div>
                        <%if (ConfirmaEliminacion)
                            {%>
                        <div class="mb-3">
                            <asp:CheckBox ID="chkConfirmaEliminacion" runat="server" />
                            <label for="chkConfirmaEliminacion" class="form-label" style="margin-left: 5px; margin-right: 20px">Confirmar Eliminación</label>
                            <asp:Button Text="Eliminar" ID="btnConfirmaEliminar" OnClick="btnConfirmaEliminar_Click" CssClass="btn btn-outline-danger" runat="server" />
                        </div>
                        <%} %>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
