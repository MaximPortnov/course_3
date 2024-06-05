﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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
using Danil_AutoServiceRul.Entities;
using Danil_AutoServiceRul.Windows;

namespace Danil_AutoServiceRul.pages
{
    /// <summary>
    /// Логика взаимодействия для Client.xaml
    /// </summary>
    public partial class Client : Page
    {
        User user = new User();
        public Client(User currentUser)
        {
            InitializeComponent();
            var products = Danil_AutoServiceRulEntities1.GetContext().Product.ToList(); // Получаем список продуктов
            LViewProduct.ItemsSource = products;
            DataContext = this;
            txtAllAmount.Text = products.Count.ToString();
            user = currentUser;
            UpdateData();
            User();
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

            txtResaultAmount.Text = result.Count().ToString(); // передаем количество записей после поиска, сортировки или фильтрации

        }
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
    }
}
