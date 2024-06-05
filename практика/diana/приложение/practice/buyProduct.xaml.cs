using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
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
    public class ProductForBuy
    {
        public int ProductID { get; set; }
        public string Name { get; set; }
        public string SportType { get; set; }
        public string Characteristics { get; set; }
        public decimal Price { get; set; }
        public int QuantityInStock { get; set; }
        public int Quantity { get; set; } = 1;
    }

    public partial class buyProduct : Window
    {
        public int customerID = -1;
        public List<int> productIDs;
        List<ProductForBuy> productForBuys = new List<ProductForBuy>();
        public buyProduct()
        {
            InitializeComponent();
        }
        public void init()
        {
            loadData();
        }
        private void loadData()
        {
            productForBuys.Clear();
            string sql =
                "SELECT productid,name,sporttype,characteristics,price,quantityinstock " +
                "FROM products " +
                $"WHERE quantityinstock != 0 AND productid IN ({String.Join(",", productIDs)});";
            var reader = db.query(sql);
            while (reader.Read())
            {
                productForBuys.Add(new ProductForBuy
                {
                    ProductID = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    SportType = reader.GetString(2),
                    Characteristics = reader.GetString(3),
                    Price = reader.GetDecimal(4),
                    QuantityInStock = reader.GetInt32(5)
                });
            }
            dataGrid.ItemsSource = null;
            dataGrid.ItemsSource = productForBuys;
            reader.Close();
        }

        private void TextBox_LostFocus(object sender, RoutedEventArgs e)
        {
            var textBox = sender as TextBox;
            if (textBox != null)
            {
                // Получение связанного объекта Product
                var product = textBox.DataContext as ProductForBuy;

                // Теперь вы можете работать с объектом product, например, проверить его свойства
                if (product != null)
                {
                    // Проверка введенного значения
                    if (!int.TryParse(textBox.Text, out int value) || value <= 0 || value > product.QuantityInStock)
                    {
                        MessageBox.Show($"Значение должно быть положительным числом и не больше {product.QuantityInStock}");
                        product.Quantity = 1;
                        textBox.Text = "1";
                        // Здесь можно восстановить предыдущее значение или выполнить другие действия
                    } else
                    {
                        product.Quantity = value;
                        textBox.Text = value.ToString();
                    }
                    
                }
            }
        }

        private void btn_buy_Click(object sender, RoutedEventArgs e)
        {
            string insertOrderSql =
            "INSERT INTO Orders (OrderDate, Status, CustomerID) " +
            $"VALUES (CURRENT_DATE, 'Processing', {customerID}) RETURNING OrderID;";

            var res = db.query(insertOrderSql);
            if (res.Read())
            {
                int ordersID = res.GetInt32(0);
                res.Close();
                foreach (var product in productForBuys)
                {
                    string insertOrderDetailsSql = 
                    "INSERT INTO OrderDetails (OrderID, ProductID, Quantity) " +
                    $"VALUES ({ordersID}, {product.ProductID}, {product.Quantity}); ";
                    db.query(insertOrderDetailsSql).Close();
                }
                MessageBox.Show("Заказ успешно создан!");
            }else
            {
                res.Close();
                MessageBox.Show("ошмбка");
                return;
            }
            Close();
        }
    }
}
