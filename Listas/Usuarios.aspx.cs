using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Listas
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Usuario> lvUsuarios_GetData([Control("chkSoloActivos")]bool soloActivos)
        {
            var usuarios = Usuario.ObtenerTodos(soloActivos);

            litCantidadDeUsuarios.Text = usuarios.Count.ToString();

            return usuarios
                .AsQueryable();
        }

        protected void lvUsuarios_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                var id = Convert.ToInt32(e.CommandArgument);

                var usuario = Usuario.Obtener(id);
                if (usuario != null)
                    Usuario.Eliminar(usuario);

                lvUsuarios.DataBind();
            }
        }
    }
}