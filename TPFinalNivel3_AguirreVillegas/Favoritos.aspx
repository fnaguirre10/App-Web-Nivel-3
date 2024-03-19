<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="TPFinalNivel3_AguirreVillegas.Favoritos" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #tarjeta {
            border-color: #36DEF2; /* Cambiar el color del borde */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="text-center" style="margin-top: 20px;">⭐Mis articulos favoritos⭐</h1>
    <div class="container">
        <% if (repRepetidor.Items.Count == 0)
            { %>
        <div class="Nofavorito text-center" style="margin-bottom: 370px;">
            <br />
            <h4>No tienes ningún artículo favorito en este momento.</h4>
            <p>Puedes agregar algunos artículos a tus favoritos para verlos aquí.</p>
        </div>
        <% }
            else
            { %>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <%-- Repetir esta sección con los datos de tu lista de productos --%>
            <asp:Repeater runat="server" ID="repRepetidor">
                <ItemTemplate>
                    <div class="col">
                        <div class="card" id="tarjeta">
                            <img src="<%#Eval("ImagenUrl") %>" class="card-img-top img-500x500" onerror="this.onerror=null; this.src='https://t3.ftcdn.net/jpg/02/48/42/64/360_F_248426448_NVKLywWqArG2ADUxDq6QprtIzsF82dMF.jpg';" id="imgItem" alt="<%#Eval("Nombre")%>">
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("Nombre")%></h5>
                                <p class="card-text">Precio: <%#Eval("Precio") %></p>
                                <div class="text-left">
                                    <div class="mb-3" style="display: inline-block;">
                                        <a href="DetalleItem.aspx?id=<%# Eval("Id") %>" class="btn btn-primary">Detalles</a>
                                    </div>
                                    <div class="mb-3" style="display: inline-block; margin-left: 5px;">
                                        <asp:Button Text="❌" runat="server" ID="btnEliminarFavorito" CssClass="btn" OnClick="btnEliminarFavorito_Click" CommandName="Cross" CommandArgument='<%#Eval("Id")%>' />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
            <%} %>
        </div>
    </div>
</asp:Content>
