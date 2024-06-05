using SchoolManagementSystem.Models;
using System.Collections.ObjectModel;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Newtonsoft.Json;

namespace SchoolManagementSystem.Services
{
    public class DataService
    {
        private ObservableCollection<Employee> employees = new ObservableCollection<Employee>();
        private List<User> users;

        private const string UsersFilePath = "users.json";

        public DataService()
        {
            LoadUsers();
        }

        private void LoadUsers()
        {
            if (File.Exists(UsersFilePath))
            {
                var json = File.ReadAllText(UsersFilePath);
                users = JsonConvert.DeserializeObject<List<User>>(json);
            }
            else
            {
                users = new List<User>
                {
                    new User { Id = 1, Username = "admin", Password = "admin", Role = "Admin" }
                };
                SaveUsers();
            }
        }

        private void SaveUsers()
        {
            var json = JsonConvert.SerializeObject(users);
            File.WriteAllText(UsersFilePath, json);
        }

        public User AuthenticateUser(string username, string password)
        {
            return users.FirstOrDefault(u => u.Username == username && u.Password == password);
        }

        public bool RegisterUser(string username, string password, string role)
        {
            if (users.Any(u => u.Username == username))
                return false;

            var newUser = new User
            {
                Id = users.Count + 1,
                Username = username,
                Password = password,
                Role = role
            };

            users.Add(newUser);
            SaveUsers();
            return true;
        }

        public ObservableCollection<Employee> GetEmployees()
        {
            return employees;
        }

        public void AddEmployee(Employee employee)
        {
            employees.Add(employee);
        }
    }
}
