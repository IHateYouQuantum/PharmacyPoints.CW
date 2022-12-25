using PharmacyPoints.CW.Core;
using PharmacyPoints.CW.View.Pages.AdminPages;
using PharmacyPoints.CW.View.Pages.PharmacyPage;
using System;
using PharmacyPoints.CW.View.Pages.ClientPage;
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

namespace PharmacyPoints.CW.View.Pages.ProviderPage
{
    /// <summary>
    /// Логика взаимодействия для ProviderPageList.xaml
    /// </summary>
    public partial class ProviderPageList : Page
    {
        public ProviderPageList()
        {
            InitializeComponent();
            DataEmploerInfo.ItemsSource = MainCore.DB.Providers.OrderBy(g => g.NameProvider).ToList();
        }

        private void BtnEmp_Click(object sender, RoutedEventArgs e)
        {
            MainCore.CoreFrame.Navigate(new MainAdminPage());
        }

        private void BtnCloseApp_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown(); 
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MainCore.CoreFrame.Navigate(new PharmacyPageList());
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            MainCore.CoreFrame.Navigate(new ClientPageList());
        }
    }
}
