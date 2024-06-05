using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
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
using Newtonsoft.Json;


namespace AmonicAirlines
{
    /// <summary>
    /// Логика взаимодействия для ses2_1.xaml
    /// </summary>
    public partial class ses2_1 : Page
    {
        List<Airports> AirportList = new List<Airports>();
        public ses2_1()
        {
            InitializeComponent();
            foo();
        }
        async public void foo()
        {
            await LoadAirportsAsync();
            
        }
        private async Task<int> LoadAirportsAsync()
        {
            AirportList = await Airports.GetAirports();

            FromBox.ItemsSource = AirportList;
            FromBox.DisplayMemberPath = "Iatacode";
            ToBox.ItemsSource = AirportList;
            ToBox.DisplayMemberPath = "Iatacode";

            FromBox.SelectedValuePath = "Id";
            ToBox.SelectedValuePath = "Id";

            List<string> otherItems = new List<string> { "Data-Time", "Flight Number" };
            SortByBox.ItemsSource = otherItems;

            return 1;
        }
        private void SortBox(object sender, SelectionChangedEventArgs e)
        {
            string selectedValue = SortByBox.SelectedValue as string;

            if (selectedValue == "Data-Time")
            {
            }
            else if (selectedValue == "Flight Number")
            {
            }
        }
        private void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            foreach (char c in e.Text)
            {
                if (!char.IsDigit(c))
                {
                    e.Handled = true; // отмена ввода символа
                    return;
                }
            }
        }
        private void OutboundTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string text = OutboundTextBox.Text;

            // Если вводимый символ не цифра и не '/', и длина текста уже максимальна, то игнорируем ввод
            if ((!char.IsDigit(e.Text[0]) && e.Text[0] != '/') || text.Length >= 10)
            {
                e.Handled = true;
                return;
            }

            // Если вводимый символ '/' и в тексте уже есть 2 '/' или длина текста больше 9, то игнорируем ввод
            if (e.Text[0] == '/' && (text.Count(c => c == '/') >= 2 || text.Length >= 10))
            {
                e.Handled = true;
                return;
            }

            // Если вводим '/' и находимся на 2 или 5 позиции, то игнорируем ввод
            if (e.Text[0] == '/' && (text.Length == 2 || text.Length == 5))
            {
                e.Handled = true;
                return;
            }
        }

        private void OutboundTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            string text = OutboundTextBox.Text;

            // Если текст короче 2 символов, то ничего не делаем
            if (text.Length < 2)
                return;

            // Если вставлен символ после 2 или 5 символа и он не '/', то добавляем '/'
            if (text.Length == 3 && text[2] != '/')
            {
                OutboundTextBox.Text = text.Insert(2, "/");
                OutboundTextBox.SelectionStart = 3;
            }
            else if (text.Length == 6 && text[5] != '/')
            {
                OutboundTextBox.Text = text.Insert(5, "/");
                OutboundTextBox.SelectionStart = 6;
            }

            // Если длина текста больше 2 и предыдущий введенный символ был '/', а текущий не '/', то перемещаем курсор в конец
            if (text.Length > 2 && text[text.Length - 2] == '/' && text[text.Length - 1] != '/')
            {
                OutboundTextBox.CaretIndex = text.Length;
            }
        }

        private void FromBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
