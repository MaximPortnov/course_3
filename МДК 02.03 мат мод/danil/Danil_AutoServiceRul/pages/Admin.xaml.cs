﻿using Danil_AutoServiceRul.Entities;
using Danil_AutoServiceRul.Windows;
using Danil_AutoServiceRul.pages;
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
    /// Логика взаимодействия для Admin.xaml
    /// </summary>
    public partial class Admin : Page
    {
        User user = new User();
        public Admin(User currentUser)
        {
            InitializeComponent(); 

            DataContext = this; // привязываем контекс данных к коду, чтобы обратиться к массивам

            var products = Danil_AutoServiceRulEntities1.GetContext().Product.ToList(); // Получаем список продуктов
            LViewProduct.ItemsSource = products;

            txtAllAmount.Text = products.Count.ToString(); // передаем количество всех записей таблицы

            user = currentUser;
            
            User();
            UpdateData();
        }
        private void UpdateData()
        {
            var result = Danil_AutoServiceRulEntities1.GetContext().Product.ToList(); //Вводим переменную, которая принимает данные из таблицы товаров
            if (cmbSorting.SelectedIndex == 1)
                result = result.OrderBy(p => p.ProductCost).ToList();
            //Реализация сортировки с помощью запросов на сортировку по возрастанию
            if (cmbSorting.SelectedIndex == 2)//И убыванию цены
                result = result.OrderByDescending(p => p.ProductCost).ToList();
            if (cmbFilter.SelectedIndex == 1)
                result = result.Where(p => p.ProductDiscountAmount >= 0 && p.ProductDiscountAmount < 10).ToList();
            if (cmbFilter.SelectedIndex == 2)
                result = result.Where(p => p.ProductDiscountAmount >= 10 & p.ProductDiscountAmount < 15).ToList();
            if (cmbFilter.SelectedIndex == 3)

                //Реализация фильтрации С помощью запросов на выборку По условиям задания
                result = result.Where(p => p.ProductDiscountAmount >= 15).ToList();
            result = result.Where(p => p.ProductName.ToLower().Contains(txtSearch.Text.ToLower())).ToList();
            LViewProduct.ItemsSource = result; //Передаем результат в ListView
            foreach (var i in result)
            {
                Console.WriteLine(i.ImgPath.ToString());
            }
            txtResultAmount.Text = result.Count().ToString(); // передаем количество записей после поиска, сортировки или фильтрации

        }
        private void User()
        {
            if (user != null)
                txtFullname.Text = user.UserSurname.ToString() + user.UserName.ToString() + " " + user.UserPatronymic.ToString();
            else
                txtFullname.Text = "Гость";
        }
        public string[] SortingList { get; set; } =
        {
            "Без сортировки",
            "Стоимость по возрастанию",
            "Стоимость по убыванию"
        };

        public string[] FilterList { get; set; } =
        {
            "Все диапазоны",
            "0%-9,99%",
            "10%-14,99%",
            "15% и более"
        };
        private void txtSearch_SelectionChanged(object sender, System.Windows.RoutedEventArgs e)
        {
            UpdateData(); //Вызываем метод
        }

        private void cmbSorting_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData(); //Вызываем метод
        }

        private void cmbFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData(); //Вызываем метод
        }
        List<Product> orderProducts = new List<Product>();

        private void btnAddProduct_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            orderProducts.Add(LViewProduct.SelectedItem as Product);
            if (orderProducts.Count > 0)
            {
                btnOrder.Visibility = Visibility.Visible;
            }

        }
        private void btnOrder_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            OrderWindow orderWindow = new OrderWindow(orderProducts, user);
            orderWindow.Show();
        }
        private void LViewProduct_MouseDoubleClick(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            NavigationService.Navigate(new AddEditProductPage(LViewProduct.SelectedItem as Product)); //Если хотим перейти к редактированию товара, то передаем на страницу данные об этом товаре
        }
        private void btnAddNewProduct_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddEditProductPage(null)); //Если хотим добавить новый товар, то передаем пустое значение на следующую страницу

        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                Danil_AutoServiceRulEntities1.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                LViewProduct.ItemsSource = Danil_AutoServiceRulEntities1.GetContext().Product.ToList();
            }
        }
    }
}
