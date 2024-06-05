using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Calc;
namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        private MainWindow _calcWindow;

        [TestInitialize]
        public void Setup()
        {
            _calcWindow = new MainWindow();
        }

        [TestMethod]
        public void TestAddition()
        {
            string result = _calcWindow.CalculateExpression("13 + 10");
            Assert.AreEqual("23", result);
        }

        [TestMethod]
        public void TestMultiplication()
        {
            string result = _calcWindow.CalculateExpression("5 * 3");
            Assert.AreEqual("15", result);
        }

        [TestMethod]
        public void TestDivision()
        {
            string result = _calcWindow.CalculateExpression("14 / 2");
            Assert.AreEqual("7", result);
        }

        [TestMethod]
        public void TestSubtraction()
        {
            string result = _calcWindow.CalculateExpression("5 - 3");
            Assert.AreEqual("2", result);
        }

        [TestMethod]
        public void TestDivisionByZero_ReturnsProperErrorMessage()
        {
            string result = _calcWindow.CalculateExpression("10 / 0");
            string expectedMessage = "0";
            Assert.AreEqual(expectedMessage, result);
        }

        [TestMethod]
        public void PustayaStroka()
        {
            string result = _calcWindow.CalculateExpression("");
            Assert.AreEqual("Строка не должна быть пустой.", result);
        }

    }
}
