using System;
using NUnit.Framework;
using Moq;
using SchoolManagementSystem;
using SchoolManagementSystem.Models;
using SchoolManagementSystem.Services;
using System.Windows.Controls;

namespace TestProject1
{
    [TestFixture]
    public class AddEmployeeWindowTests
    {
        private Mock<DataService> mockDataService;
        private AddEmployeeWindow addEmployeeWindow;

        [SetUp]
        public void Setup()
        {
            mockDataService = new Mock<DataService>();
            addEmployeeWindow = new AddEmployeeWindow(mockDataService.Object)
            {
                NameTextBox = new TextBox(),
                PositionTextBox = new TextBox(),
                EmailTextBox = new TextBox()
            };
        }

        [Test]
        public void AddEmployee_ShouldCallDataServiceAddEmployee_WhenInputsAreValid()
        {
            // Arrange
            addEmployeeWindow.NameTextBox.Text = "John Doe";
            addEmployeeWindow.PositionTextBox.Text = "Teacher";
            addEmployeeWindow.EmailTextBox.Text = "john.doe@example.com";

            // Act
            addEmployeeWindow.AddButton_Click(null, null);

            // Assert
            mockDataService.Verify(ds => ds.AddEmployee(It.IsAny<Employee>()), Times.Once);
        }

        [Test]
        public void AddEmployee_ShouldNotCallDataServiceAddEmployee_WhenInputsAreInvalid()
        {
            // Arrange
            addEmployeeWindow.NameTextBox.Text = "John Doe";
            addEmployeeWindow.PositionTextBox.Text = "";
            addEmployeeWindow.EmailTextBox.Text = "john.doe@example.com";

            // Act
            addEmployeeWindow.AddButton_Click(null, null);

            // Assert
            mockDataService.Verify(ds => ds.AddEmployee(It.IsAny<Employee>()), Times.Never);
        }

        [Test]
        public void ValidateInputs_ShouldReturnTrue_WhenAllInputsAreValid()
        {
            // Arrange
            addEmployeeWindow.NameTextBox.Text = "John Doe";
            addEmployeeWindow.PositionTextBox.Text = "Teacher";
            addEmployeeWindow.EmailTextBox.Text = "john.doe@example.com";

            // Act
            var result = addEmployeeWindow.ValidateInputs();

            // Assert
            Assert.IsTrue(result);
        }

        [Test]
        public void ValidateInputs_ShouldReturnFalse_WhenAnyInputIsInvalid()
        {
            // Arrange
            addEmployeeWindow.NameTextBox.Text = "John Doe";
            addEmployeeWindow.PositionTextBox.Text = "";
            addEmployeeWindow.EmailTextBox.Text = "john.doe@example.com";

            // Act
            var result = addEmployeeWindow.ValidateInputs();

            // Assert
            Assert.IsFalse(result);
        }

        [Test]
        public void ValidateInputs_ShouldReturnFalse_WhenEmailDoesNotContainAtSymbol()
        {
            // Arrange
            addEmployeeWindow.NameTextBox.Text = "John Doe";
            addEmployeeWindow.PositionTextBox.Text = "Teacher";
            addEmployeeWindow.EmailTextBox.Text = "johndoeexample.com";

            // Act
            var result = addEmployeeWindow.ValidateInputs();

            // Assert
            Assert.IsFalse(result);
        }

        [Test]
        public void AddEmployee_ShouldShowErrorMessage_WhenInputsAreInvalid()
        {
            // Arrange
            addEmployeeWindow.NameTextBox.Text = "John Doe";
            addEmployeeWindow.PositionTextBox.Text = "";
            addEmployeeWindow.EmailTextBox.Text = "john.doe@example.com";

            // Act
            addEmployeeWindow.AddButton_Click(null, null);

            // Assert
            Assert.AreEqual("Please fill all fields correctly.", MessageBox.LastShownMessage);
        }
    }
}