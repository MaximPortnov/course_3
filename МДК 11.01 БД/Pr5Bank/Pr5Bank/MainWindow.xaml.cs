using Npgsql;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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

namespace Pr5Bank
{
    /// <summary> 
    /// Логика взаимодействия для MainWindow.xaml 
    /// </summary> 
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            string connectionString = "Server=localhost; User Id=postgres; Database=Pr5Bank; Port=5432; Password=sql@max;SSLMode=Prefer";
            //string connectionString = "Data Source=DESKTOP-OACDNKU\\SQLEXPRESS;Initial Catalog=Pr5Bank;Integrated Security=True;";

            using (var connection = new NpgsqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = $"SELECT * FROM \"User\" WHERE \"Login\"='{UsernameTextBox.Text}' AND \"Password\"='{PasswordBox.Password}'";
                    var command = new NpgsqlCommand(query, connection);
                    //command.Parameters.AddWithValue("@Login", UsernameTextBox.Text);
                    //command.Parameters.AddWithValue("@Password", PasswordBox.Password);

                    var reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        MessageBox.Show("Авторизация успешна!");
                    }
                    else
                    {
                        MessageBox.Show("Ошибка авторизации. Неправильный логин или пароль.");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка: {ex.Message}");
                }
            }
        }

        private void UsernameTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}