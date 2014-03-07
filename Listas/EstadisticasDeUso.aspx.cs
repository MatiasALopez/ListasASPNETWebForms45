using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Listas
{
    public partial class EstadisticasDeUso : System.Web.UI.Page
    {
        protected int CantidadIngresosTotal { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<UsuarioEstadisticasDeUso> gvEstadisticas_GetData()
        {
            var usuarios = Usuario.ObtenerEstadisticasDeUso();

            CantidadIngresosTotal = usuarios.Sum(u => u.CantidadDeIngresos);

            return usuarios.AsQueryable();
        }
    }
}