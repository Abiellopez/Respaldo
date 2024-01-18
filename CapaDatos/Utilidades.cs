using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace CapaDatos
{
    public class Utilidades
    {
        public static string convertirBase64(string ruta)
        {
            byte[] bytes = File.ReadAllBytes(ruta);
            string file = Convert.ToBase64String(bytes);
            return file;
        }
    }
}
