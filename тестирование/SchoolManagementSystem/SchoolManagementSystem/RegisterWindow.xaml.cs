using SchoolManagementSystem.Services;
using System.Windows;
using System.Windows.Controls;

namespace SchoolManagementSystem
{
    public partial class RegisterWindow : Window
    {
        private DataService dataService;

        public RegisterWindow(DataService dataService)
        {
            InitializeComponent();
            this.dataService = dataService;
        }

        private void BackToLoginButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void RegisterButton_Click(object sender, RoutedEventArgs e)
        {
            var username = UsernameTextBox.Text;
            var password = PasswordBox.Password;
            var role = (RoleComboBox.SelectedItem as ComboBoxItem)?.Content.ToString();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(role))
            {
                MessageBox.Show("Please fill all fields.");
                return;
            }

            var success = dataService.RegisterUser(username, password, role);
            if (success)
            {
                MessageBox.Show("User registered successfully.");
                this.Close();
            }
            else
            {
                MessageBox.Show("Username already exists.");
            }
        }
    }
}
