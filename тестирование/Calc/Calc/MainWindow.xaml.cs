using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Calc
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        public string CalculateExpression(string expression)
        {
            try
            {
                if (expression.Contains("/ 0"))
                {
                    return "Деление на ноль невозможно"; 
                }
                var result = new DataTable().Compute(expression, null);
                return result.ToString();
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message; 
            }
        }


        private void NumberButton_Click(object sender, RoutedEventArgs e)
        {
            var button = (Button)sender;
            inputTextBox.Text += button.Content.ToString();
        }

        private void OperationButton_Click(object sender, RoutedEventArgs e)
        {
            var button = (Button)sender;
            inputTextBox.Text += " " + button.Content.ToString() + " ";
        }

        private void EqualsButton_Click(object sender, RoutedEventArgs e)
        {
            inputTextBox.Text = CalculateExpression(inputTextBox.Text);
        }



        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            inputTextBox.Text = string.Empty;
        }
    }
}
