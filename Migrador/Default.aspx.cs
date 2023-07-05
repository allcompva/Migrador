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

        }

        protected void btnDescargaSitio_Click(object sender, EventArgs e)
        {
            WebClient mywebClient = new WebClient();
            mywebClient.DownloadFile(
                string.Format("{0}/js/{1}/Application.js",
                txtUrl.Text, txtNombreApp.Text), @"d:\Application.js");
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
            List<string> view = new List<string>();
            List<string> models = new List<string>();
            List<string> stores = new List<string>();

            foreach (var item in lstControllers)
            {
                if (item.package == string.Empty)
                {
                    string urlView = string.Format(
                        "{0}/js/{1}/controller/{2}.js",
                        txtUrl.Text, txtNombreApp.Text, item.nombre.Trim());

                    StreamReader reader = new StreamReader(
                        WebRequest.Create(urlView).GetResponse().GetResponseStream());
                    List<string> lines = new List<string>();
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
                            view.AddRange(views.ToList());
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
                            stores.AddRange(_stores.ToList());
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
                            models.AddRange(_models.ToList());
                        }
                        control++;
                        if (control > 10)
                            break;
                    }

                    reader.Dispose();
                }
            }

            gvControllers.DataSource = lstControllers.OrderByDescending(
                c => c.package, StringComparer.CurrentCultureIgnoreCase);
            gvControllers.DataBind();

            gvViews.DataSource = view.Distinct().ToList();
            gvViews.DataBind();

            gvModels.DataSource = models.Distinct().ToList();
            gvModels.DataBind();

            gvStores.DataSource = stores.Distinct().ToList();
            gvStores.DataBind();
        }
    }
}