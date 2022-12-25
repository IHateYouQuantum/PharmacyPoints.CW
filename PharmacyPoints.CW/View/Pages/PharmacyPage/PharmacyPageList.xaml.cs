using PharmacyPoints.CW.Core;
using PharmacyPoints.CW.View.Pages.AdminPages;
using PharmacyPoints.CW.View.Pages.ProviderPage;
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

namespace PharmacyPoints.CW.View.Pages.PharmacyPage
{
    /// <summary>
    /// Логика взаимодействия для PharmacyPageList.xaml
    /// </summary>
    public partial class PharmacyPageList : Page
    {
        public PharmacyPageList()
        {
            InitializeComponent();
            DataEmploerInfo.ItemsSource = MainCore.DB.Pharmacies.OrderBy(g => g.NamePharmacy).ToList();
        }

        private void BtnCloseApp_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MainCore.CoreFrame.Navigate(new ProviderPageList());
        }

        private void BtnEmp_Click(object sender, RoutedEventArgs e)
        {
            MainCore.CoreFrame.Navigate(new MainAdminPage());
        }
    }
}
