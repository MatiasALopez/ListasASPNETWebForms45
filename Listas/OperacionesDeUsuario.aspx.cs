using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Listas
{
    public partial class OperacionesDeUsuario : System.Web.UI.Page
    {
        protected Usuario Usuario { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ObtenerUsuario();

                MostrarDatos();
            }
        }

        private void ObtenerUsuario()
        {
            var uid = Request.QueryString["uid"];
            
            int id;
            if (!int.TryParse(uid, out id))
                Response.Redirect("/Usuarios");

            Usuario = Usuario.Obtener(id);
        }

        private void MostrarDatos()
        {
            lblNombreCompleto.Text = Usuario.NombreCompleto;

            lvOperaciones.DataBind();
        }

        public IQueryable<Operacion> lvOperaciones_GetData()
        {
            IEnumerable<Operacion> operaciones = new List<Operacion>();

            if (Usuario != null)
                operaciones = Usuario.Operaciones;

            return operaciones
                .AsQueryable();
        }
    }
}