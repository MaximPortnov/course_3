using SchoolManagementSystem.Models;
using SchoolManagementSystem.Services;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;

namespace SchoolManagementSystem
{
    public partial class MainWindow : Window
    {
        private User currentUser;
        private DataService dataService;
        private ObservableCollection<Employee> allEmployees;

        public MainWindow()
        {
            InitializeComponent();
            dataService = new DataService();
            allEmployees = dataService.GetEmployees();
            EmployeeListView.ItemsSource = allEmployees;
        }

        public MainWindow(User user) : this()
        {
            currentUser = user;
        }

        private void AddEmployeeButton_Click(object sender, RoutedEventArgs e)
        {
            var addEmployeeWindow = new AddEmployeeWindow(dataService);
            addEmployeeWindow.ShowDialog();
            // Обновляем список всех сотрудников после добавления нового
            allEmployees = dataService.GetEmployees();
            EmployeeListView.ItemsSource = allEmployees;
        }

        private void SearchButton_Click(object sender, RoutedEventArgs e)
        {
            string searchQuery = SearchTextBox.Text.ToLower();
            var filteredEmployees = allEmployees
                .Where(emp => emp.Name.ToLower().Contains(searchQuery) ||
                              emp.Position.ToLower().Contains(searchQuery) ||
                              emp.Email.ToLower().Contains(searchQuery))
                .ToList();

            EmployeeListView.ItemsSource = new ObservableCollection<Employee>(filteredEmployees);
        }
    }
}
