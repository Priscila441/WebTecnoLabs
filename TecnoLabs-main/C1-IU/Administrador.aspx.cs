using System;
using System.Collections;
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
        string msg;
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
            DeshabilitarCampos();
            BtnAgregar.Enabled = false;
            BtnEditar.Enabled = true;
            BtnEliminar.Enabled = true;

            GridViewRow row = gvProductos.SelectedRow;
            string categoria = ObtenerCategoria(int.Parse(row.Cells[5].Text));

            TxtMarca.Text = HttpUtility.HtmlDecode(row.Cells[2].Text);
            TxtModelo.Text = HttpUtility.HtmlDecode(row.Cells[3].Text);
            TxtPrecio.Text = row.Cells[4].Text;
            dropCategoria.Text = categoria;
            TxtStock.Text = row.Cells[6].Text;
        }
        protected int ObtenerIdCategoria(string categoria)
        {
            int idCategoria = 0;

            if (categoria == "Celulares") idCategoria = 1;

            if (categoria == "Tablets") idCategoria = 2;

            if (categoria == "Notebooks") idCategoria = 3;

            return idCategoria;
        }
        protected string ObtenerCategoria(int idCategoria)
        {
            string categoria = "";

            if (idCategoria == 1) categoria = "Celulares";

            if (idCategoria == 2) categoria = "Tablets";

            if (idCategoria == 3) categoria = "Notebooks";

            return categoria;
        }
        protected void LimpiarControles()
        {
            TxtMarca.Text = "";
            TxtModelo.Text = "";
            TxtPrecio.Text = "";
            TxtStock.Text = "";
            dropCategoria.Text = "Seleccionar";
			TxtBuscar.Text = "";
		}
        protected void DeshabilitarCampos()
        {
            TxtMarca.Enabled = false;
            TxtModelo.Enabled = false;
            TxtPrecio.Enabled = false;
            TxtStock.Enabled = false;
            dropCategoria.Enabled = false;
        }
        protected void HabilitarCampos()
        {
            TxtMarca.Enabled = true;
            TxtModelo.Enabled = true;
            TxtPrecio.Enabled = true;
            TxtStock.Enabled = true;
            dropCategoria.Enabled = true;
        }
        protected void DeshabilitarBotones()
        {
            BtnAgregar.Enabled = false;
            BtnEditar.Enabled = false;
        }
        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            Productos producto = new Productos();
            int stock, idCategoria;
            decimal precio;
            if (TxtMarca.Text != "" && TxtModelo.Text != "" && decimal.TryParse(TxtPrecio.Text, out precio) != false && dropCategoria.Text != "Seleccionar" && int.TryParse(TxtStock.Text, out stock) != false)
            {
                try
                {
                    idCategoria = ObtenerIdCategoria(dropCategoria.Text);

                    producto.Marca = TxtMarca.Text;
                    producto.Modelo = TxtModelo.Text;
                    producto.Precio = decimal.Parse(TxtPrecio.Text);
                    producto.IdCategoria = idCategoria;
                    producto.Stock = int.Parse(TxtStock.Text);

                    conexion.AgregarNuevoProducto(producto);
                    Cargar();
                    LimpiarControles();

                    msg = "Producto agregado correctamente.";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
                }
                catch (Exception ex)
                {
                    msg = "Error al agregar el producto: " + ex.Message;
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
                }
            }
            else
            {
                msg = "Por favor, complete todos los campos correctamente.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
            }
        }

        protected void BtnEditar_Click(object sender, EventArgs e)
        {
            int stock;
            decimal precio;
            if (TxtMarca.Text != "" && TxtModelo.Text != "" && decimal.TryParse(TxtPrecio.Text, out precio) != false && dropCategoria.Text != "Seleccionar" && int.TryParse(TxtStock.Text, out stock) != false)
            {
				BtnGuardar.Enabled = true;
				BtnCancelar.Enabled = true;
				BtnEliminar.Enabled = false;
				BtnAgregar.Enabled = false;
				BtnEditar.Enabled = false;
				HabilitarCampos();

            }
            else
            {
                msg = "Por favor, completa todos los campos de texto para poder editar.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
            }
        }
        protected Productos ObjetoAuxiliar()
        {
            Productos producto = new Productos();
			int stock;
			decimal precio;

			if (TxtMarca.Text != "" && TxtModelo.Text != "" && decimal.TryParse(TxtPrecio.Text, out precio) != false && dropCategoria.Text != "Seleccionar" && int.TryParse(TxtStock.Text, out stock) != false)
			{
				int idCategoria = ObtenerIdCategoria(dropCategoria.Text);

				GridViewRow row = gvProductos.SelectedRow;
				producto.IdProducto = int.Parse(row.Cells[1].Text);

				producto.Marca = TxtMarca.Text;
				producto.Modelo = TxtModelo.Text;
				producto.Precio = decimal.Parse(TxtPrecio.Text);
				producto.IdCategoria = idCategoria;
				producto.Stock = int.Parse(TxtStock.Text);

                return producto;
			}
			else
			{
				return null;
			}
		}
		protected void BntGuardar_Click(object sender, EventArgs e)
		{
            Productos producto = ObjetoAuxiliar();
            if (producto != null)
            {
                try
                {
                    conexion.Editar(producto);
                    msg = "Producto editado correctamente";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
                    Cargar();
                    LimpiarControles();
                }
                catch (Exception ex)
                {

                    msg = ex.ToString();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
                }
            }
            else
            {
                msg = "Verifique que todos los campos esten completos correctamente";
				ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
			}
            BtnGuardar.Enabled = false;
            BtnAgregar.Enabled = true;
		}

		protected void BntEliminar_Click(object sender, EventArgs e)
		{
			string script = @"
            if (confirm('Confirmar eliminación de usuario')) {
                __doPostBack('" + btnAceptar.UniqueID + @"', '');
            } ";

			ClientScript.RegisterStartupScript(this.GetType(), "popup", script, true);
		}

		protected void btnAceptar_Click(object sender, EventArgs e)
		{
			Productos producto = ObjetoAuxiliar();
			if (producto != null)
			{
				try
				{
					conexion.Eliminar(producto);
					msg = "Producto eliminado correctamente";
					ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
					Cargar();
					LimpiarControles();
				}
				catch (Exception ex)
				{

					msg = ex.ToString();
					ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
				}
			}
			else
			{
				msg = "Verifique que todos los campos esten completos correctamente";
				ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
			}
		}

		protected void BtnCancelar_Click(object sender, EventArgs e)
		{
            LimpiarControles();
            HabilitarCampos();
            BtnAgregar.Enabled = true;
            BtnEditar.Enabled = false;
            BtnEliminar.Enabled = false;
            BtnGuardar.Enabled = false;
		}

		protected void BtnBuscar_Click(object sender, EventArgs e)
		{
            try
            {
				if (TxtBuscar.Text != "")
                {
					List<Productos> listProductos = conexion.Buscar(TxtBuscar.Text);
					if (listProductos == null || listProductos.Count == 0)
                    {
						msg = "No se encontraron resultados para la búsqueda";
						ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
                        TxtBuscar.Text = "";
					}
                    else
                    {
						gvProductos.DataSource = listProductos;
                        gvProductos.DataBind();
                    }
                }
                else
                {
					msg = "Ingrese una marca en el campo de búsqueda";
					ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
				}
            }
            catch (Exception ex)
            {
				msg = ex.ToString();
				ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
			}
		}
	}
}