using SchoolManagementSystem.Models;
using SchoolManagementSystem.Services;
using System.Windows;
using System.Windows.Controls;

namespace SchoolManagementSystem
{
    public partial class LoginWindow : Window
    {
        private DataService dataService = new DataService();

        public LoginWindow()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            var user = dataService.AuthenticateUser(UsernameTextBox.Text, PasswordBox.Password);

            if (user != null)
            {
                var mainWindow = new MainWindow(user);
                mainWindow.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Invalid username or password");
            }
        }

        private void RegisterButton_Click(object sender, RoutedEventArgs e)
        {
            var registerWindow = new RegisterWindow(dataService);
            registerWindow.ShowDialog();
        }
    }

}
