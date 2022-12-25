using PharmacyPoints.CW.Core;
using PharmacyPoints.CW.Model;
using PharmacyPoints.CW.View.Pages.ProviderPage;
using System.Linq;
using System.Windows;
using PharmacyPoints.CW.View;
using System.Windows.Controls;

namespace PharmacyPoints.CW.View.Pages.AdminPages
{

    public partial class MainAdminPage : Page
    {
        public MainAdminPage()
        {
            InitializeComponent();
            DataEmploerInfo.ItemsSource = MainCore.DB.Employees.OrderBy(g => g.FullNameEmployee).ToList();
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            int idEmp = (DataEmploerInfo.SelectedItem as Employee).EmployeeID;

            if (MessageBox.Show("Удалить данные?","Системное сообщение", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                Employee emp = (from z in MainCore.DB.Employees where z.EmployeeID == idEmp select z).SingleOrDefault();
                MainCore.DB.Employees.Remove(emp);
                MainCore.DB.SaveChanges();
                DataEmploerInfo.ItemsSource = MainCore.DB.Employees.OrderBy(g => g.FullNameEmployee).ToList();
            }
        }

        private void BtnCloseApp_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void BtnCloseApp_Click_1(object sender, RoutedEventArgs e)
        {

        }

        private void BtnProv_Click(object sender, RoutedEventArgs e)
        {
            MainCore.CoreFrame.Navigate(new ProviderPageList());
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MainCore.CoreFrame.Navigate(new PharmacyPage.PharmacyPageList());
        }
    }
}
