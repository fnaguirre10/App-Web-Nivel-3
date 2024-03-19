<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TPFinalNivel3_AguirreVillegas.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div style="display: flex; justify-content: center; margin-bottom: 10px;">
            <div class="card  mb-3" style="width: 18rem; text-align: center; justify-content: center">
                <img src="/images/Error.png" class="card-img-top" alt="Error">
                <div class="card-body">
                    <h5 class="card-title">Hola, ¡ups, hubo un error!</h5>
                    <asp:Label Text="" ID="lblError" runat="server" CssClass="card-text" />
                    <div style="padding: 20px;">
                        <a href="Default.aspx" class="btn btn-link">Pagina Principal</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
