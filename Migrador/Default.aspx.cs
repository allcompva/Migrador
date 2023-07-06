using Migrador.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Migrador
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    List<UiAplication> lstAplications = UiAplication.read();
                    DDLNombreApp.DataSource = lstAplications;
                    DDLNombreApp.DataTextField = "name";
                    DDLNombreApp.DataValueField = "id";
                    DDLNombreApp.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnDescargaSitio_Click(object sender, EventArgs e)
        {
            try
            {

                if (Convert.ToInt32(DDLNombreApp.SelectedItem.Value) != 0)
                {
                    divAppMigrar.Visible = false;
                    divContenidoApp.Visible = true;
                    List<RazorObjects> lstView = new List<RazorObjects>();
                    List<RazorObjects> lstModel = new List<RazorObjects>();
                    List<RazorObjects> lstStore = new List<RazorObjects>();

                    DirectoryInfo diCommon = new DirectoryInfo(
                        string.Format(@"{0}", txtCommon.Text));

                    DirectoryInfo diCuenta = new DirectoryInfo(
                        string.Format(@"{0}", txtCuentas.Text));

                    DirectoryInfo diTablas = new DirectoryInfo(
                        string.Format(@"{0}", txtTablas.Text));

                    List<Controllers> lstControllers = Entities.Controllers.read(
                        Convert.ToInt32(DDLNombreApp.SelectedItem.Value),
                        diCommon, diCuenta, diTablas);

                    //CONTROLLERS PROPIOS DE LA APP
                    gvControllers.DataSource = lstControllers.FindAll(
                        c => c.package.Trim().Length == 0).
                        OrderByDescending(
                        c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
                    gvControllers.DataBind();
                    //CONTROLLERS EN PACKAGE
                    gvControllersPackage.DataSource = lstControllers.FindAll(c => c.package.Trim().Length > 0).
                        OrderByDescending(
                        c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
                    gvControllersPackage.DataBind();

                    //VIEWS PROPIOS DE LA APP
                    foreach (var item in lstControllers)
                    {
                        lstView.AddRange(item.lstViews);
                        lstModel.AddRange(item.lstModels);
                        lstStore.AddRange(item.lstStores);
                    }
                    gvViews.DataSource = lstView.Distinct().ToList().FindAll(
                        c => c.package.Trim().Length == 0).
                        OrderByDescending(
                        c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
                    gvViews.DataBind();
                    //VIEWS EN PACKAGE
                    gvViewsPackage.DataSource = lstView.Distinct().ToList().FindAll(c => c.package.Trim().Length > 0).
                        OrderByDescending(
                        c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
                    gvViewsPackage.DataBind();
                    //MODELS PROPIOS DE LA APP
                    gvModels.DataSource = lstModel.Distinct().ToList().FindAll(c => c.package.Trim().Length == 0).
                        OrderByDescending(
                        c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
                    gvModels.DataBind();
                    //MODELS EN PACKAGE
                    gvModelsPackage.DataSource = lstModel.Distinct().ToList().FindAll(c => c.package.Trim().Length > 0).
                        OrderByDescending(
                        c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
                    gvModelsPackage.DataBind();
                    //STORES PROPIOS DE LA APP
                    gvStores.DataSource = lstStore.Distinct().ToList().FindAll(c => c.package.Trim().Length == 0).
                        OrderByDescending(
                        c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
                    gvStores.DataBind();
                    //STORES EN PACKAGE
                    gvStores.DataSource = lstStore.Distinct().ToList().FindAll(c => c.package.Trim().Length > 0).
                        OrderByDescending(
                        c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
                    gvStores.DataBind();

                }
                else
                {
                    gvControllers.DataSource = null;
                    gvControllers.DataBind();

                    gvModels.DataSource = null;
                    gvModelsPackage.DataBind();

                    gvViews.DataSource = null;
                    gvViewsPackage.DataBind();

                    gvStores.DataSource = null;
                    gvStoresPackage.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void DDLNombreApp_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void fillTablas()
        {

        }

        protected void btnProcesarControllersPropios_Click(object sender, EventArgs e)
        {
            try
            {
                List<Controllers> lst = leerGrilla();
                foreach (Controllers controller in lst)
                {
                    WebClient mywebClient = new WebClient();
                    string url = string.Format("{0}/js/{1}/{2}.js",
                        txtUrl.Text, DDLNombreApp.SelectedItem.Text,
                        controller.nombre);
                    string rutaArchivo = "@" + txtSalida.Text + "\\" + controller.nombre + ".js";


                    mywebClient.DownloadFile(url, rutaArchivo);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private List<Controllers> leerGrilla()
        {
            List<Controllers> lst = new List<Controllers>();
            for (int i = 0; i < gvControllers.Rows.Count; i++)
            {
                GridViewRow row = gvControllers.Rows[i];
                Controllers obj = new Controllers();

                obj.nombre = gvControllers.DataKeys[i].Values["nombre"].ToString();
                lst.Add(obj);

            }
            //txtTot.Text = tot.ToString();
            return lst;
        }
    }
}