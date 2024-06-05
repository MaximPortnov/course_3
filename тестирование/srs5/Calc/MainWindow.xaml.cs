using System;
using System.Windows;
using System.Windows.Controls;

namespace Calc
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        public void OnCalculateButtonClick(object sender, RoutedEventArgs e)
        {
            try
            {
                double a = double.Parse(tb_A.Text);
                double b = double.Parse(tb_B.Text);
                double c = double.Parse(tb_C.Text);
                double x = double.Parse(tb_X.Text);
                string result = CalculateF(a, b, c, x);
                resultTextBlock.Text = $"F = {result}";
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error: {ex.Message}");
            }
        }

        public string CalculateF(double a, double b, double c, double x)
        {
            if (c < 0 && a != 0)
                return (-a * x * x).ToString();
            else if (c > 0 && a == 0)
                return c * x == 0 ? "Деление на ноль" : ((a-x)/(c*x)).ToString();
            else 
                return (c - a * x) == 0 ? "Деление на ноль" : ((-x)/(c-a*x)).ToString();
        }
    }
}
