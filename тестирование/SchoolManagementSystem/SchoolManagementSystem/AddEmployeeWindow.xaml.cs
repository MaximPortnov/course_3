using SchoolManagementSystem.Models;
using SchoolManagementSystem.Services;
using System.Windows;

namespace SchoolManagementSystem
{
    public partial class AddEmployeeWindow : Window
    {
        private DataService dataService;

        public AddEmployeeWindow(DataService dataService)
        {
            InitializeComponent();
            this.dataService = dataService;
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            if (ValidateInputs())
            {
                var employee = new Employee
                {
                    Name = NameTextBox.Text,
                    Position = PositionTextBox.Text,
                    Email = EmailTextBox.Text
                };

                dataService.AddEmployee(employee);
                this.Close();
            }
            else
            {
                MessageBox.Show("Please fill all fields correctly.");
            }
        }

        private bool ValidateInputs()
        {
            // Простая валидация данных
            return !string.IsNullOrEmpty(NameTextBox.Text) &&
                   !string.IsNullOrEmpty(PositionTextBox.Text) &&
                   !string.IsNullOrEmpty(EmailTextBox.Text) &&
                   EmailTextBox.Text.Contains("@");
        }
    }
}
