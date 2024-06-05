using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace practice
{
    public class SupplierProductDisplay
    {
        public int SupplierProductID { get; set; }
        public string ProductName { get; set; } // Наименование товара из таблицы Products
        public int QuantitySupplied { get; set; }
        public decimal SupplyPrice { get; set; }
        public DateTime SupplyDate { get; set; }
    }

    public partial class Suppliers : Page
    {
        public List<SupplierProductDisplay> supplierProductDisplays = new List<SupplierProductDisplay>();
        public int supplierID = -1;
        public Suppliers()
        {
            InitializeComponent();
        }

        private void loadData()
        {
            supplierProductDisplays.Clear();
            string sql =
                "SELECT sp.SupplierProductID, p.Name as ProductName, sp.QuantitySupplied, sp.SupplyPrice, sp.SupplyDate " +
                "FROM SupplierProducts sp " +
                "JOIN Products p ON sp.ProductID = p.ProductID " +
                $"WHERE sp.supplierid = {supplierID}; ";

            var reader = db.query(sql);
            while (reader.Read())
            {
                supplierProductDisplays.Add(new SupplierProductDisplay
                {
                    SupplierProductID = reader.GetInt32(0),
                    ProductName = reader.GetString(1),
                    QuantitySupplied = reader.GetInt32(2),
                    SupplyPrice = reader.GetDecimal(3),
                    SupplyDate = reader.GetDateTime(4)
                });
            }
            dataGrid.ItemsSource = null;
            dataGrid.ItemsSource = supplierProductDisplays;
            reader.Close();
        }
        public void init()
        {
            loadData();
        }

        private void btn_del_Click(object sender, RoutedEventArgs e)
        {
            int selected = dataGrid.SelectedIndex;
            if (selected == -1)
            {
                MessageBox.Show("Выберите товар для удаления");
                return;
            }

            // Получаем выбранный элемент как SupplierProductDisplay
            var selectedSupplierProduct = (SupplierProductDisplay)dataGrid.SelectedItem;

            // Удаляем выбранный товар по SupplierProductID
            var command = $"DELETE FROM SupplierProducts WHERE SupplierProductID = {selectedSupplierProduct.SupplierProductID};";
            var r = db.query(command);
            r.Close();

            // Перезагружаем данные для отображения
            loadData();
        }

        //public int QuantitySupplied { get; set; }
        //public decimal SupplyPrice { get; set; }
        //public DateTime SupplyDate { get; set; }
        private void btn_upd_Click(object sender, RoutedEventArgs e)
        {
            int selected = dataGrid.SelectedIndex;
            if (selected == -1)
            {
                MessageBox.Show("выберете проект");
                return;
            }
            var t = new UpdateSupplierProduct();
            t.SupplierProductID = supplierProductDisplays[selected].SupplierProductID;
            t.QuantitySupplied = supplierProductDisplays[selected].QuantitySupplied;
            t.SupplyPrice = supplierProductDisplays[selected].SupplyPrice;
            t.SupplyDate = supplierProductDisplays[selected].SupplyDate;
            t.init();
            t.ShowDialog();
            loadData();
        }
    }
}
