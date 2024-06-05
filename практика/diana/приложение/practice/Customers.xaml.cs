using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;


namespace practice
{
    public class Product
    {
        public int ProductID { get; set; }
        public string Name { get; set; }
        public string SportType { get; set; }
        public string Characteristics { get; set; }
        public decimal Price { get; set; }
    }
    public partial class Customers : Page
    {
        public int customerID = -1;
        public List<Product> products = new List<Product>();
        public Customers()
        {
            InitializeComponent();
            loadData();
        }
        private void loadData()
        {
            products.Clear();
            string sql = "SELECT productid,name,sporttype,characteristics,price FROM products WHERE quantityinstock != 0;";
            var reader = db.query(sql);
            while (reader.Read())
            {
                products.Add(new Product
                {
                    ProductID = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    SportType = reader.GetString(2),
                    Characteristics = reader.GetString(3),
                    Price = reader.GetDecimal(4)
                });
            }
            dataGrid.ItemsSource = null;
            dataGrid.ItemsSource = products;
            reader.Close();
        }
        private void btn_add_Click_1(object sender, RoutedEventArgs e)
        {
            List<int> productIDs = new List <int>();
            var selected = dataGrid.SelectedItems.Cast<Product>().ToList();
            foreach (var item in selected)
            {
                productIDs.Add(item.ProductID);
            }
            var window = new buyProduct();
            window.productIDs = productIDs;
            window.customerID = customerID;
            window.init();
            window.ShowDialog();

        }
    }
}
