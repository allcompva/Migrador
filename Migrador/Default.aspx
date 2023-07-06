<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Migrador._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-bottom: 45px;" runat="server" id="divAppMigrar">
        <div class="col-md-6">
            <h2 style="margin-bottom: 25px; margin-top: 55px;">Ubicacion Packages</h2>
            <label>Path Packages Common</label>
            <div class="form-group">
                <asp:TextBox ID="txtCommon" runat="server" class="form-control"
                    Style="max-width: 100%">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="rv1" runat="server" ForeColor="Red"
                    ErrorMessage="Ingrese la ubicacion del package common"
                    ControlToValidate="txtCommon" ValidationGroup="buscaTablas">
                </asp:RequiredFieldValidator>
            </div>
            <label>Path Packages Cuentas</label>
            <div class="form-group">
                <asp:TextBox ID="txtCuentas" runat="server" class="form-control"
                    Style="max-width: 100%">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="rv2" runat="server" ForeColor="Red"
                    ErrorMessage="Ingrese la ubicacion del package cuentas"
                    ControlToValidate="txtCuentas" ValidationGroup="buscaTablas">
                </asp:RequiredFieldValidator>
            </div>
            <label>Path Packages Tablas</label>
            <div class="form-group">
                <asp:TextBox ID="txtTablas" runat="server" class="form-control"
                    Style="max-width: 100%">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="rv3" runat="server" ForeColor="Red"
                    ErrorMessage="Ingrese la ubicacion del package tablas"
                    ControlToValidate="txtTablas" ValidationGroup="buscaTablas">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="col-md-6">
            <h2 style="margin-bottom: 25px; margin-top: 55px;">Aplicación a migrar</h2>
            <label>
                Url Base de la app a migrar</label>
            <div class="form-group">
                <asp:TextBox ID="txtUrl" runat="server" class="form-control"
                    Style="max-width: 100%" Text="https://gcs.softguard.com">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="rv4" runat="server" ForeColor="Red"
                    ErrorMessage="Ingrese la URL base"
                    ControlToValidate="txtUrl" ValidationGroup="buscaTablas">
                </asp:RequiredFieldValidator>
            </div>
            <label>Seleccione la App que desea migrar</label>
            <div class="form-group">
                <asp:DropDownList ID="DDLNombreApp" CssClass="form-control"
                    Style="max-width: 100%;" runat="server">
                </asp:DropDownList>
                <!--<asp:TextBox ID="txtNombreApp" runat="server" class="form-control"
                    Style="max-width: 100%">
                </asp:TextBox>-->
            </div>
            <label>
                Seleccione el directorio de Salida</label>
            <div class="form-group">
                <asp:TextBox ID="txtSalida" runat="server" class="form-control"
                    Style="max-width: 100%">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="rv5" runat="server" ForeColor="Red"
                    ErrorMessage="Ingrese el directorio de salida"
                    ControlToValidate="txtSalida" ValidationGroup="buscaTablas">
                </asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="btnDescargaSitio" OnClick="btnDescargaSitio_Click" runat="server" Text="Iniciar"
                CssClass="btn btn-primary" ValidationGroup="buscaTablas" Style="float: right;" />
        </div>
    </div>
    <div class="row" style="margin-bottom: 45px;" runat="server" id="divContenidoApp" visible="false">
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
                                <label>Controllers Propios de la App</label>
                            </div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="btnProcesarControllersPropios" 
                                    runat="server" CssClass="btn btn-primary"
                                    OnClick="btnProcesarControllersPropios_Click">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-12">
                                <asp:GridView
                                    ID="gvControllers"
                                    CssClass="table"
                                    GridLines="Horizontal"
                                    ShowHeader="false"
                                    AutoGenerateColumns="false"
                                    DataKeyNames="nombre"
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
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Controllers en Package</label>
                            </div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-primary">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-12">
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
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="profile" style="padding-top: 25px;">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Views Propios de la App</label>
                            </div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-primary">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-12">
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
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Views en Package</label>
                            </div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-primary">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-12">
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
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="messages" style="padding-top: 25px;">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Models Propios de la App</label>
                            </div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="btn btn-primary">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-12">
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
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Models en Packages</label>
                            </div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton6" runat="server" CssClass="btn btn-primary">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-12">
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
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="settings" style="padding-top: 25px;">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Stores Propios de la App</label>
                            </div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton7" runat="server" CssClass="btn btn-primary">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-12">
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
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Stores en Packages</label>
                            </div>
                            <div class="col-md-6" style="text-align: right;">
                                <asp:LinkButton ID="LinkButton8" runat="server" CssClass="btn btn-primary">
                                    Procesar &nbsp;
                                    <span class="glyphicon glyphicon-cog"></span>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-12">
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
        </div>
    </div>
</asp:Content>
