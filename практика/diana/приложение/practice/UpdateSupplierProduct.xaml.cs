using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace practice
{
    /// <summary>
    /// Логика взаимодействия для UpdateSupplierProduct.xaml
    /// </summary>
    public partial class UpdateSupplierProduct : Window
    {
        public int SupplierProductID { get; set; }
        public int QuantitySupplied { get; set; }
        public decimal SupplyPrice { get; set; }
        public DateTime SupplyDate { get; set; }

        public UpdateSupplierProduct()
        {
            InitializeComponent();
        }
        public void init()
        {
            TextBoxQuantitySupplied.Text = QuantitySupplied.ToString();
            TextBoxSupplyPrice.Text = SupplyPrice.ToString();
            DatePickerSupplyDate.Text = SupplyDate.ToString();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (!int.TryParse(TextBoxQuantitySupplied.Text, out int quantitySupplied))
            {
                MessageBox.Show("Некорректное количество.");
                return;
            }
            if (!decimal.TryParse(TextBoxSupplyPrice.Text, out decimal supplyPrice))
            {
                MessageBox.Show("Некорректная цена поставки.");
                return;
            }
            if (!DatePickerSupplyDate.SelectedDate.HasValue)
            {
                MessageBox.Show("Выберите дату поставки.");
                return;
            }

            string sql = $"UPDATE SupplierProducts SET QuantitySupplied = {quantitySupplied}, SupplyPrice = {supplyPrice.ToString(System.Globalization.CultureInfo.InvariantCulture)}, SupplyDate = '{DatePickerSupplyDate.SelectedDate.Value.ToString("yyyy-MM-dd")}' WHERE SupplierProductID = {SupplierProductID};";
            db.query(sql).Close();
            Close();
        }


    }
}
