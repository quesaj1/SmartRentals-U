using System;
using System.Globalization;

namespace ProyectoSmartRentals.MasterPage
{
    public partial class MasterSmartRentals : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateDisplay.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy", CultureInfo.GetCultureInfo("es-ES"));
        }
    }
}