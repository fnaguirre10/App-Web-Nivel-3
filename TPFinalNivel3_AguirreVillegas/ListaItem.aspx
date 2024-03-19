<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListaItem.aspx.cs" Inherits="TPFinalNivel3_AguirreVillegas.ListaItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #<%= dgvItems.ClientID %> {
            border-color: #36DEF2;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center" style="margin-top: 20px;">Lista de Artículos</h1>
    <div class="row" style="margin-left: 10px; margin-right: 10px;">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label Text="Filtrar" runat="server" />
                <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="filtro_TextChanged" />
            </div>
        </div>
        <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
            <div class="mb-3">
                <asp:CheckBox 
                    CssClass="" ID="chkAvanzado" runat="server" 
                    AutoPostBack="true"
                    OnCheckedChanged="chkAvanzado_CheckedChanged"/>
                <asp:Label Text="Filtro Avanzado" runat="server" style="margin-left: 5px;"/>
            </div>
        </div>

        <%if (chkAvanzado.Checked)
            { %>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                    <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" id="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                        <asp:ListItem Text="Nombre" />
                        <asp:ListItem Text="Marca" />
                        <asp:ListItem Text="Categoria" />
                        <asp:ListItem Text="Precio" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Criterio" runat="server" />
                    <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Filtro" runat="server" />
                    <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                    <%if (ddlCampo.SelectedItem.ToString() == "Precio")
                    { %>
                        <asp:RequiredFieldValidator ErrorMessage="El precio es requerido" CssClass="validacion" ControlToValidate="txtFiltroAvanzado" runat="server" />
                        <asp:RegularExpressionValidator ErrorMessage="Ingresar solo números" CssClass="validacion" ValidationExpression="^[0-9]+$" ControlToValidate="txtFiltroAvanzado" runat="server" />
                    <%} %>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Estado" runat="server" />
                    <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control">
                        <asp:ListItem Text="Todos" />
                        <asp:ListItem Text="Activo" />
                        <asp:ListItem Text="Inactivo" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" id="btnBuscar" OnClick="btnBuscar_Click"/>
                </div>
            </div>
        </div>
        <%} %>
    </div>
    <div style="margin-left: 10px; margin-right: 10px;">
        <asp:GridView ID="dgvItems" runat="server" DataKeyNames="Id"
                CssClass="table" AutoGenerateColumns="false"
                OnSelectedIndexChanged="dgvItems_SelectedIndexChanged"
                OnPageIndexChanging="dgvItems_PageIndexChanging"
                AllowPaging="True" PageSize="10">
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
            <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
            <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" />
            <asp:CommandField HeaderText="Modificar" ShowSelectButton="true" SelectText="✍" />
        </Columns>
        </asp:GridView>
    </div>
    <a href="FormularioItem.aspx" class="btn btn-primary" style="margin-left: 20px; margin-bottom: 50px;">Agregar</a>
</asp:Content>