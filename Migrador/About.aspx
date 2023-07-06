<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Migrador.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-bottom: 45px;">
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
    </div>
    <div class="row" style="margin-bottom: 45px;">
        <div class="col-md-12" style="padding-top: 30px;">
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
                <div role="tabpanel" class="tab-pane active" id="home" style="padding-top: 25px;">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Controllers Locales</label></div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton1" runat="server">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <asp:GridView
                            ID="gvControllers"
                            CssClass="table"
                            GridLines="Horizontal"
                            ShowHeader="false"
                            AutoGenerateColumns="false"
                            runat="server">
                            <Columns>
                                <asp:BoundField DataField="nombre" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnActualizar" runat="server">
                                            <span style="font-size:28px;" class="glyphicon glyphicon-transfer"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Controllers en Package</label></div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton2" runat="server">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <asp:GridView
                            ID="gvControllersPackage"
                            CssClass="table"
                            GridLines="Horizontal"
                            AutoGenerateColumns="false"
                            ShowHeader="false"
                            runat="server">
                            <Columns>
                                <asp:BoundField DataField="nombre" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnActualizar" runat="server">
                                            <span style="font-size:28px;" class="glyphicon glyphicon-refresh"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="profile" style="padding-top: 25px;">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Views Locales</label></div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton3" runat="server">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <asp:GridView
                            ID="gvViews"
                            ShowHeader="false"
                            GridLines="Horizontal"
                            AutoGenerateColumns="false"
                            CssClass="table"
                            runat="server">
                            <Columns>
                                <asp:BoundField DataField="nombre" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnActualizar" runat="server">
                                            <span style="font-size:28px;" class="glyphicon glyphicon-transfer"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Views en Package</label></div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton4" runat="server">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <asp:GridView
                            ID="gvViewsPackage"
                            AutoGenerateColumns="false"
                            ShowHeader="false"
                            GridLines="Horizontal"
                            CssClass="table"
                            runat="server">
                            <Columns>
                                <asp:BoundField DataField="nombre" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnActualizar" runat="server">
                                            <span style="font-size:28px;" class="glyphicon glyphicon-refresh"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="messages" style="padding-top: 25px;">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Models Locales</label></div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton5" runat="server">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <asp:GridView
                            ID="gvModels"
                            ShowHeader="false"
                            GridLines="Horizontal"
                            AutoGenerateColumns="false"
                            CssClass="table"
                            runat="server">
                            <Columns>
                                <asp:BoundField DataField="nombre" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnActualizar" runat="server">
                                            <span style="font-size:28px;" class="glyphicon glyphicon-transfer"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Models en Packages</label></div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton6" runat="server">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <asp:GridView
                            ID="gvModelsPackage"
                            ShowHeader="false"
                            AutoGenerateColumns="false"
                            GridLines="Horizontal"
                            CssClass="table"
                            runat="server">
                            <Columns>
                                <asp:BoundField DataField="nombre" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnActualizar" runat="server">
                                            <span style="font-size:28px;" class="glyphicon glyphicon-refresh"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="settings" style="padding-top: 25px;">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Stores Locales</label></div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton7" runat="server">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <asp:GridView
                            ID="gvStores"
                            ShowHeader="false"
                            GridLines="Horizontal"
                            CssClass="table"
                            AutoGenerateColumns="false"
                            runat="server">
                            <Columns>
                                <asp:BoundField DataField="nombre" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnActualizar" runat="server">
                                            <span style="font-size:28px;" class="glyphicon glyphicon-transfer"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Stores en Packages</label></div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton8" runat="server">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <asp:GridView
                            ID="gvStoresPackage"
                            ShowHeader="false"
                            GridLines="Horizontal"
                            AutoGenerateColumns="false"
                            CssClass="table"
                            runat="server">
                            <Columns>
                                <asp:BoundField DataField="nombre" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnActualizar" runat="server">
                                            <span style="font-size:28px;" class="glyphicon glyphicon-refresh"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
