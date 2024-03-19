<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DetalleItem.aspx.cs" Inherits="TPFinalNivel3_AguirreVillegas.DetalleItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Detalles</h2>
        <br />
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="txtId" class="form-label">Id :</label>
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtCodigo" class="form-label">Código :</label>
                    <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />

                </div>

                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre :</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />

                </div>


                <div class="mb-3">
                    <label for="ddlMarca" class="form-label">Marca :</label>
                    <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-select" />
                </div>

                <div class="mb-3">
                    <label for="ddlCategoria" class="form-label">Categoría :</label>
                    <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-select" />
                </div>

                <div class="mb-3">
                    <label for="txtPrecio" class="form-label">Precio : </label>
                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <a href="Catalogo.aspx" class="btn btn-link">Atras</a>
                </div>

            </div>


            <div class="col-6">
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label">Descripción :</label>
                    <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtImagenUrl" class="form-label">Imagen :</label>
                    <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                </div>
                <asp:Image runat="server" ID="imgItem" Width="400px" Height="400px" CssClass="img-500x500" onerror="this.onerror=null; this.src='https://t3.ftcdn.net/jpg/02/48/42/64/360_F_248426448_NVKLywWqArG2ADUxDq6QprtIzsF82dMF.jpg';" />
            </div>
        </div>
    </div>
</asp:Content>
