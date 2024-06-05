using System;
using System.Collections.Generic;
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
using Xceed.Wpf.Toolkit.Zoombox;

namespace AmonicAirlines
{
    /// <summary>
    /// Логика взаимодействия для ses3_1.xaml
    /// </summary>
    public partial class ses3_1 : Page
    {
        List<Airports> AirportList = new List<Airports>();
        List<CabinTypes> CabinList = new List<CabinTypes>();
        public ses3_1()
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
            CabinList = await CabinTypes.GetCabinTypes();

            FromBox.ItemsSource = AirportList;
            FromBox.DisplayMemberPath = "Iatacode";
            ToBox.ItemsSource = AirportList;
            ToBox.DisplayMemberPath = "Iatacode";
            CabinBox.ItemsSource = CabinList;
            CabinBox.DisplayMemberPath = "Name";

            FromBox.SelectedValuePath = "Id";
            ToBox.SelectedValuePath = "Id";
            CabinBox.SelectedValuePath = "Id";

            return 1;
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
