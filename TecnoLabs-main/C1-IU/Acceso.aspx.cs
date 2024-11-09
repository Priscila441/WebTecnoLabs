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
    public partial class Acceso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			if (!IsPostBack)
			{
				ClientScript.RegisterForEventValidation(ButtonAcceder.UniqueID);
			}
		}

		protected void ButtonAcceder_Click(object sender, EventArgs e)
		{
			string usuario = txtAdmin.Text;
			string contrasenia = txtContrasenia.Text;

			if (usuario == "admin@gmail.com" && contrasenia == "123")
			{
				Response.Redirect("Administrador.aspx", false);
			}
			else
			{
				txtAdmin.Text = "";
				txtContrasenia.Text = "";

				LiteralMessage.Text = "<div class='alert alert-danger'>Usuario o contraseña incorrectos.</div>";
			}
		}
	}
}