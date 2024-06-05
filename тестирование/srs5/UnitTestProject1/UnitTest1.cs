using Microsoft.VisualStudio.TestTools.UnitTesting;
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
        public void TestCase1()
        {
            string result = _calcWindow.CalculateF(1, 1, -1, 0);
            Assert.AreEqual("0", result);
        }

        [TestMethod]
        public void TestCase2()
        {
            string result = _calcWindow.CalculateF(0, 0, 1, 1);
            Assert.AreEqual("-1", result);
        }

        [TestMethod]
        public void TestCase3()
        {
            string result = _calcWindow.CalculateF(1,1,0,1);
            Assert.AreEqual("1", result);
        }

        [TestMethod]
        public void TestCase4()
        {
            string result = _calcWindow.CalculateF(0, 1, 1, 0);
            Assert.AreEqual("Деление на ноль", result);
        }
        [TestMethod]
        public void TestCase5()
        {
            string result = _calcWindow.CalculateF(1,1,0,0);
            Assert.AreEqual("Деление на ноль", result);
        }

    }
}
