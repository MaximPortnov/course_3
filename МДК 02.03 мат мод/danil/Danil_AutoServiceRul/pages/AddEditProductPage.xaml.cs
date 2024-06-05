using Danil_AutoServiceRul.Entities;
using Microsoft.Win32;
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

namespace Danil_AutoServiceRul.pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditProductPage.xaml
    /// </summary>
    public partial class AddEditProductPage : Page
    {
        Product product = new Product();

        public AddEditProductPage(Product currentProduct)
        {
            InitializeComponent();
            if (currentProduct != null)
            {
                product = currentProduct;
                btnDeleteProduct.Visibility = Visibility.Visible;
                txtArticle.IsEnabled = false;//Показываем кнопку удаления

            }
            DataContext = product;
            cmbCategory.ItemsSource = CategoryList; //Передаем список в ресурсы ComboBox'a


        }
        public string[] CategoryList =
        {
            "Аксессуары",
            "Автозапчасти",
            "Автосервис",
            "Съемники подшипников",
            "Ручные инструменты",
            "Зарядные устройства"
        };
        private void btnEnterImage_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog GetImageDialog = new OpenFileDialog(); //Открываем диалоговое окно
            GetImageDialog.Filter = "Файлы изображений: (*.png, *.jpg, *.jpeg)| *.png; *.jpg; *.jpeg"; //Ставим фильтр видимости файлов
            //Прописываем путь к папке ресурсов проекта
            GetImageDialog.InitialDirectory = "C:\\Users\\portm\\Desktop\\danil\\Danil_AutoServiceRul\\Resources";

            if (GetImageDialog.ShowDialog() == true)
            {
                product.ProductPhoto = GetImageDialog.SafeFileName; //Добавляем имя выбранного фото в БД
            }
        }
        private void btnDeleteProduct_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show($"Вы действительно хотите удалить {product.ProductName}?", "внимание", MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {
                try
                {
                    Danil_AutoServiceRulEntities1.GetContext().Product.Remove(product);
                    Danil_AutoServiceRulEntities1.GetContext().SaveChanges();
                    MessageBox.Show("Запись удалена", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                    NavigationService.GoBack();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
        private void btnSaveProduct_Click(object sender, RoutedEventArgs e)
        {

            StringBuilder errors = new StringBuilder();
            if (product.ProductCost < 0)
                errors.AppendLine("Стоимость не может быть отрицательной!");

            if (int.Parse(product.MinCount) < 0)
                errors.AppendLine("Минимальное количество не может быть отрицательным!");

            if (product.ProductDiscountAmount > int.Parse(product.MaxDiscountAmount))
                errors.AppendLine("Действующая скидка на товар не может быть больше максимальной скидки!");
            
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString()); //Выводим ошибки
                return;
            }
            if (product.ProductArticleNumber != null)
            {
                //product.ProductManufacturer = "asd";
                //product.ProductStatus = "asd";
                Danil_AutoServiceRulEntities1.GetContext().Product.Add(product); //Добавляем объект в БД
                MessageBox.Show("asdasdasd", "Информация", MessageBoxButton.OK, MessageBoxImage.Information); //Coхраняем данные в БД

            }
            try
            {
                //Console.WriteLine(product.ToString());
                Danil_AutoServiceRulEntities1.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена!", "Информация", MessageBoxButton.OK, MessageBoxImage.Information); //Coхраняем данные в БД
                NavigationService.GoBack(); //Переходим на предыдущую страницу

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
