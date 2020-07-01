using System;
using System.Globalization;
using System.Threading;

namespace ProyectoSmartRentals.MasterPage
{

  
    public partial class MasterSmartRentals : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            string str ;
            str = DateTime.Now.ToString("dddd, dd MMMM' de 'yyyy", CultureInfo.GetCultureInfo("es-ES"));
            str= Char.ToUpper(str[0]) +str.Substring(1).ToString();
            DateDisplay.Text = str;
        }


    }
}