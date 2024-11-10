using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C2_BLL;
using C4_ENTIDADES;

namespace C1_IU
{
    public partial class Administrador : System.Web.UI.Page
    {
        CN_Productos conexion = new CN_Productos();
        protected void Page_Load(object sender, EventArgs e)
        {
            Cargar();
        }
        protected void Cargar()
        {
            gvProductos.DataSource = conexion.CargarProductos();
            gvProductos.DataBind();
        }

		protected void gvProductos_SelectedIndexChanged(object sender, EventArgs e)
		{
			GridViewRow row = gvProductos.SelectedRow;

			TxtMarca.Text = row.Cells[2].Text;
			TxtModelo.Text = row.Cells[3].Text;
			TxtPrecio.Text = row.Cells[4].Text;
            TxtCategoria.Text = row.Cells[5].Text;
            TxtStock.Text = row.Cells[6].Text;
		}
	}
}