using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Migrador
{
    public class Controllers
    {
        public string nombre { get; set; }
        public string package { get; set; }

        public Controllers(string _nombre)
        {
            nombre = _nombre;
            package = string.Empty;
        }
    }
}