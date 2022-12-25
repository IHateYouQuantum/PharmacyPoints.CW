using PharmacyPoints.CW.Core;
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

namespace PharmacyPoints.CW.View.Pages.ProductPage
{
    /// <summary>
    /// Логика взаимодействия для ProductPageList.xaml
    /// </summary>
    public partial class ProductPageList : Page
    {
        public ProductPageList()
        {
            InitializeComponent();
            DataEmploerInfo.ItemsSource = MainCore.DB.Products.OrderBy(g => g.NameProduct).ToList();
        }
        

        private void Page_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ClickCount == 2)
            {
                MainCore.CoreFrame.Navigate(new LoginPage());
            }
        }
    }
}
