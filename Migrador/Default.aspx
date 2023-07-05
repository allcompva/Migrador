<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Migrador._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="">
        <div class="col-md-6">
            <h2 style="margin-bottom: 25px; margin-top: 55px;">Ubicacion Packages</h2>
            <label>Path Packages Common</label>
            <div class="form-group">
                <asp:TextBox ID="txtCommon" runat="server" class="form-control"
                    Style="max-width: 100%">
                </asp:TextBox>
            </div>
            <label>Path Packages Cuentas</label>
            <div class="form-group">
                <asp:TextBox ID="txtCuentas" runat="server" class="form-control"
                    Style="max-width: 100%">
                </asp:TextBox>
            </div>
            <label>Path Packages Tablas</label>
            <div class="form-group">
                <asp:TextBox ID="txtTablas" runat="server" class="form-control"
                    Style="max-width: 100%">
                </asp:TextBox>
            </div>
        </div>
        <div class="col-md-6">
            <h2 style="margin-bottom: 25px; margin-top: 55px;">Aplicación a migrar</h2>
            <label>
                Url Base de la app a migrar <small>(Previamente se debe abrir en GCS con ?version=)</small></label>
            <div class="form-group">
                <asp:TextBox ID="txtUrl" runat="server" class="form-control"
                    Style="max-width: 100%" Text="https://gcs.softguard.com">
                </asp:TextBox>
            </div>
            <label>Nombre de la App a migrar <small>(Tal como figura en /a/uiapplication2)</small></label>
            <div class="form-group">
                <asp:TextBox ID="txtNombreApp" runat="server" class="form-control"
                    Style="max-width: 100%">
                </asp:TextBox>
            </div>
        </div>
        <asp:Button ID="btnDescargaSitio" OnClick="btnDescargaSitio_Click" runat="server" Text="Button" />
    </div>
    <div>

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home"
                aria-controls="home" role="tab" data-toggle="tab">Controllers</a></li>
            <li role="presentation"><a href="#profile"
                aria-controls="profile" role="tab" data-toggle="tab">Views</a></li>
            <li role="presentation"><a href="#messages"
                aria-controls="messages" role="tab" data-toggle="tab">Models</a></li>
            <li role="presentation"><a href="#settings"
                aria-controls="settings" role="tab" data-toggle="tab">Stores</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="home">
                <div class="col-md-6">
                    <label>Controllers Locales</label>
                    <asp:GridView
                        ID="gvControllers"
                        CssClass="table"
                        AutoGenerateColumns="false"
                        runat="server">
                        <Columns>
                            <asp:BoundField HeaderText="Controlador" DataField="nombre" />
                            <asp:BoundField HeaderText="Package" DataField="package" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="col-md-6">
                    <label>Controllers Package</label>
                    <asp:GridView
                        ID="gvControllersPackage"
                        CssClass="table"
                        AutoGenerateColumns="false"
                        runat="server">
                        <Columns>
                            <asp:BoundField HeaderText="Controlador" DataField="nombre" />
                            <asp:BoundField HeaderText="Package" DataField="package" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="profile">
                <div class="col-md-6">
                    <label>Views Locales</label>
                    <asp:GridView
                        ID="gvViews"
                        ShowHeader="false"
                        CssClass="table"
                        runat="server">
                    </asp:GridView>
                </div>
                <div class="col-md-6">
                    <label>Views Package</label>
                    <asp:GridView
                        ID="gvViewsPackage"
                        ShowHeader="false"
                        CssClass="table"
                        runat="server">
                    </asp:GridView>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="messages">
                <div class="col-md-6">
                    <label>Models Locales</label>
                    <asp:GridView
                        ID="gvModels"
                        ShowHeader="false"
                        CssClass="table"
                        runat="server">
                    </asp:GridView>
                </div>
                <div class="col-md-6">
                    <label>Models Package</label>
                    <asp:GridView
                        ID="GridView1"
                        ShowHeader="false"
                        CssClass="table"
                        runat="server">
                    </asp:GridView>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="settings">
                <div class="col-md-6">
                    <label>Stores Locales</label>
                    <asp:GridView
                        ID="gvStores"
                        ShowHeader="false"
                        CssClass="table"
                        runat="server">
                    </asp:GridView>
                </div>
                <div class="col-md-6">
                    <label>Stores Package</label>
                    <asp:GridView
                        ID="GridView2"
                        ShowHeader="false"
                        CssClass="table"
                        runat="server">
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
