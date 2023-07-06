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
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDescargaSitio_Click(object sender, EventArgs e)
        {
            WebClient mywebClient = new WebClient();
            mywebClient.DownloadFile(
                string.Format("{0}/js/{1}/Application.js",
                txtUrl.Text, txtNombreApp.Text), @"d:\Application.js");
            /*
            string resultado =
                File.ReadAllLines(@"d:\Application.js").Where(
                    X => X.Contains("\tcontrollers : [")).First();
            resultado = resultado.Replace("\tcontrollers : [", "");
            resultado = resultado.Replace("],", "");
            resultado = resultado.Replace("'", "").Trim();
            string[] controllers = resultado.Split(',');
            List<Controllers> lstControllers = new List<Controllers>();
            foreach (var item in controllers)
            {
                lstControllers.Add(new Controllers(item));
            }
            DirectoryInfo di = new DirectoryInfo(
                string.Format(@"{0}", txtCommon.Text));
            foreach (var fi in di.GetFiles())
            {
                string nameSe = Path.GetFileNameWithoutExtension(fi.Name);
                int i = lstControllers.FindIndex(
                    c => c.nombre.Contains(nameSe));
                if (i > 0)
                    lstControllers[i].package = "common";
            }
            di = new DirectoryInfo(
                string.Format(@"{0}", txtCuentas.Text));
            foreach (var fi in di.GetFiles())
            {
                string nameSe = Path.GetFileNameWithoutExtension(fi.Name);
                int i = lstControllers.FindIndex(
                    c => c.nombre.Contains(nameSe));
                if (i > 0)
                    lstControllers[i].package = "cuenta";
            }
            di = new DirectoryInfo(
                string.Format(@"{0}", txtTablas.Text));
            foreach (var fi in di.GetFiles())
            {
                string nameSe = Path.GetFileNameWithoutExtension(fi.Name);
                int i = lstControllers.FindIndex(
                    c => c.nombre.Contains(nameSe));
                if (i > 0)
                    lstControllers[i].package = "tablas";
            }
            List<Entities.View> lstView = new List<Entities.View>();
            List<Model> lstModels = new List<Model>();
            List<Stores> lstStores = new List<Stores>();

            foreach (var item in lstControllers)
            {
                string urlView = string.Format(
                    "{0}/js/{1}/controller/{2}.js",
                    txtUrl.Text, txtNombreApp.Text, item.nombre.Trim());

                StreamReader reader = new StreamReader(
                    WebRequest.Create(urlView).GetResponse().GetResponseStream());
                List<string> lines = new List<string>();
                string package = item.package;
                int control = 0;
                while (reader.Peek() >= 0)
                {
                    string linea = reader.ReadLine();
                    if (linea.Trim().Contains("views: [") ||
                    linea.Trim().Contains("views : [") ||
                    linea.Trim().Contains("views:["))
                    {
                        string resultadoViews = linea;
                        resultadoViews = resultadoViews.Replace("views: [", "");
                        resultadoViews = resultadoViews.Replace("views:[", "");
                        resultadoViews = resultadoViews.Replace("views : [", "");
                        resultadoViews = resultadoViews.Replace("],", "");
                        resultadoViews = resultadoViews.Replace("'", "").Trim();
                        string[] views = resultadoViews.Split(',').Select(
                            p => p.Trim()).ToArray();
                        foreach (var itemV in views)
                        {
                            lstView.Add(new Entities.View(itemV, package));
                        }
                    }
                    if (linea.Trim().Contains("stores: [") ||
                    linea.Trim().Contains("stores : [") ||
                    linea.Trim().Contains("stores:["))
                    {
                        string resultadoStores = linea;
                        resultadoStores = resultadoStores.Replace("stores: [", "");
                        resultadoStores = resultadoStores.Replace("stores:[", "");
                        resultadoStores = resultadoStores.Replace("stores : [", "");
                        resultadoStores = resultadoStores.Replace("],", "");
                        resultadoStores = resultadoStores.Replace("'", "").Trim();
                        string[] _stores = resultadoStores.Split(',').Select(
                            p => p.Trim()).ToArray();
                        foreach (var itemS in _stores)
                        {
                            lstStores.Add(new Stores(itemS, package));
                        }
                    }
                    if (linea.Trim().Contains("models: [") ||
                    linea.Trim().Contains("models : [") ||
                    linea.Trim().Contains("models:["))
                    {
                        string resultadoModels = linea;
                        resultadoModels = resultadoModels.Replace("models: [", "");
                        resultadoModels = resultadoModels.Replace("models:[", "");
                        resultadoModels = resultadoModels.Replace("models : [", "");
                        resultadoModels = resultadoModels.Replace("],", "");
                        resultadoModels = resultadoModels.Replace("'", "").Trim();
                        string[] _models = resultadoModels.Split(',').Select(
                            p => p.Trim()).ToArray();
                        foreach (var itemM in _models)
                        {
                            lstModels.Add(new Model(itemM, package));
                        }
                    }
                    control++;
                    if (control > 10)
                        break;
                }

                reader.Dispose();

            }
            //CONTROLLERS PROPIOS DE LA APP
            gvControllers.DataSource = lstControllers.FindAll(c => c.package.Trim().Length == 0).
                OrderByDescending(
                c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
            gvControllers.DataBind();
            //CONTROLLERS EN PACKAGE
            gvControllersPackage.DataSource = lstControllers.FindAll(c => c.package.Trim().Length > 0).
    OrderByDescending(
    c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
            gvControllersPackage.DataBind();
            //VIEWS PROPIOS DE LA APP
            gvViews.DataSource = lstView.Distinct().ToList().FindAll(c => c.package.Trim().Length == 0).
                OrderByDescending(
                c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
            gvViews.DataBind();
            //VIEWS EN PACKAGE
            gvViewsPackage.DataSource = lstView.Distinct().ToList().FindAll(c => c.package.Trim().Length > 0).
    OrderByDescending(
    c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
            gvViewsPackage.DataBind();
            //MODELS PROPIOS DE LA APP
            gvModels.DataSource = lstModels.Distinct().ToList().FindAll(c => c.package.Trim().Length == 0).
    OrderByDescending(
    c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
            gvModels.DataBind();
            //MODELS EN PACKAGE
            gvModelsPackage.DataSource = lstModels.Distinct().ToList().FindAll(c => c.package.Trim().Length > 0).
OrderByDescending(
c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
            gvModelsPackage.DataBind();
            //STORES PROPIOS DE LA APP
            gvStores.DataSource = lstStores.Distinct().ToList().FindAll(c => c.package.Trim().Length == 0).
    OrderByDescending(
    c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
            gvStores.DataBind();
            //STORES EN PACKAGE
            gvStores.DataSource = lstStores.Distinct().ToList().FindAll(c => c.package.Trim().Length > 0).
OrderByDescending(
c => c.nombre, StringComparer.CurrentCultureIgnoreCase);
            gvStores.DataBind();*/
        }

        protected void btnDescargaSitio_Click1(object sender, EventArgs e)
        {

        }
    }
}