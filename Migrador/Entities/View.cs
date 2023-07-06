using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Migrador.Entities
{
    public class View
    {
        public int Id { get; set; }
        public string nombre { get; set; }
        public string package { get; set; }

        public View(string _nombre)
        {
            Id = 0;
            nombre = _nombre;
            package = string.Empty;
        }
        public View(string _nombre, string _package, int _Id)
        {
            nombre = _nombre;
            package = _package;
            Id = _Id;
        }
    }
}