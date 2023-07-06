using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Migrador.Entities
{
    public class Model
    {
        public string nombre { get; set; }
        public string package { get; set; }

        public Model(string _nombre)
        {
            nombre = _nombre;
            package = string.Empty;
        }
        public Model(string _nombre, string _package)
        {
            nombre = _nombre;
            package = _package;
        }
    }
}