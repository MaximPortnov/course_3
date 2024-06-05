using Microsoft.VisualStudio.TestTools.UnitTesting;
using SchoolManagementSystem.Models;
using SchoolManagementSystem.Services;
using System.Linq;

namespace SchoolManagementSystem.Tests
{
    [TestClass]
    public class DataServiceTests
    {
        private DataService dataService;

        [TestInitialize]
        public void Setup()
        {
            dataService = new DataService();
        }

        [TestMethod]
        public void AuthenticateUser_ValidCredentials_ReturnsUser()
        {
            // Arrange
            var username = "admin";
            var password = "admin";

            // Act
            var user = dataService.AuthenticateUser(username, password);

            // Assert
            Assert.IsNotNull(user);
            Assert.AreEqual(username, user.Username);
        }

        [TestMethod]
        public void AuthenticateUser_InvalidCredentials_ReturnsNull()
        {
            // Arrange
            var username = "invalid";
            var password = "invalid";

            // Act
            var user = dataService.AuthenticateUser(username, password);

            // Assert
            Assert.IsNull(user);
        }

        [TestMethod]
        public void RegisterUser_NewUser_ReturnsTrue()
        {
            // Arrange
            var username = "kiri";
            var password = "kiri";
            var role = "Teacher";

            // Act
            var result = dataService.RegisterUser(username, password, role);

            // Assert
            Assert.IsTrue(result);
        }

        [TestMethod]
        public void RegisterUser_DuplicateUser_ReturnsFalse()
        {
            // Arrange
            var username = "admin";
            var password = "admin";
            var role = "Admin";

            // Act
            var result = dataService.RegisterUser(username, password, role);

            // Assert
            Assert.IsFalse(result);
        }

        [TestMethod]
        public void AddEmployee_ValidEmployee_EmployeeAdded()
        {
            // Arrange
            var employee = new Employee { Name = "John Doe", Position = "Teacher", Email = "john.doe@example.com" };

            // Act
            dataService.AddEmployee(employee);
            var employees = dataService.GetEmployees();

            // Assert
            Assert.AreEqual(1, employees.Count);
            Assert.AreEqual("John Doe", employees.First().Name);
        }

        [TestMethod]
        public void SearchEmployees_ByName_ReturnsMatchingEmployees()
        {
            // Arrange
            var employee1 = new Employee { Name = "John Doe", Position = "Teacher", Email = "john.doe@example.com" };
            var employee2 = new Employee { Name = "Jane Smith", Position = "Admin", Email = "jane.smith@example.com" };
            dataService.AddEmployee(employee1);
            dataService.AddEmployee(employee2);

            // Act
            var searchQuery = "John";
            var filteredEmployees = dataService.GetEmployees()
                .Where(emp => emp.Name.ToLower().Contains(searchQuery.ToLower()))
                .ToList();

            // Assert
            Assert.AreEqual(1, filteredEmployees.Count);
            Assert.AreEqual("John Doe", filteredEmployees.First().Name);
        }
    }
}
