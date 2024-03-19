<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="TPFinalNivel3_AguirreVillegas.Catalogo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #tarjeta {
            border-color: #36DEF2; /* Cambiar el color del borde */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center mt-3">
            <div class="col-6 text-center">
                <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" placeholder="Buscar por nombre o marca..." AutoPostBack="True" OnTextChanged="txtBuscar_TextChanged"></asp:TextBox>
            </div>
     </div>
    <div class="row row-cols-1 row-cols-md-3 g-4">
       <asp:Repeater runat="server" id="repRepetidor">
        <ItemTemplate>
            <div class="col">
                <div class="card" id="tarjeta">
                    <img src='<%# string.IsNullOrEmpty(Eval("ImagenUrl").ToString()) ? "https://t3.ftcdn.net/jpg/02/48/42/64/360_F_248426448_NVKLywWqArG2ADUxDq6QprtIzsF82dMF.jpg" : Eval("ImagenUrl") %>' 
                         class="card-img-top img-500x500" alt="..." 
                         onerror="this.onerror=null; this.src='https://t3.ftcdn.net/jpg/02/48/42/64/360_F_248426448_NVKLywWqArG2ADUxDq6QprtIzsF82dMF.jpg';" />
                    <div class="card-body">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <h5 class="card-title">
                                <%#Eval("Nombre") %>
                            </h5>
                            <asp:Button ID="btnFavorito" runat="server" class="btn btn-warning" Text="★" CommandArgument='<%# Eval("Id") %>' OnClick="btnFavorito_Click" />
                            
                        </div>
                        <p class="card-text">
                            <p class="card-text">Precio: $<%# Eval("Precio") %></p>
                            <%#Eval("Descripcion") %>
                        </p>
                        <div class="col-6 justify-content-start align-items-lg-start">
                              <a href="DetalleItem.aspx?id=<%# Eval("Id") %>" class="btn btn-primary">Ver más</a>
                        </div>
                    </div>
                </div>
            </div>
         </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
