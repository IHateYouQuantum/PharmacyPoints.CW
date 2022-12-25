using PharmacyPoints.CW.Core;
using PharmacyPoints.CW.Model;
using PharmacyPoints.CW.View.Pages.AdminPages;
using PharmacyPoints.CW.View.Pages.PharmacyPages;
using PharmacyPoints.CW.View.Pages.ProductPage;
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
using System.Xml;

namespace PharmacyPoints.CW.View.Pages
{
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            GridContentInfo.Visibility = Visibility.Visible;
            SpButton.VerticalAlignment = VerticalAlignment.Bottom;
        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(Tblogin.Text)||
                string.IsNullOrEmpty(PbPassword.Password))
            {
                MessageBox.Show("Ошбика ввода данных","Системное сообщение", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else 
            {
                try
                {
                    Employee employeeModel = MainCore.DB.Employees.FirstOrDefault(emp => emp.FullNameEmployee == Tblogin.Text && emp.TelephoneEmployee == PbPassword.Password);

                    if (employeeModel != null)
                    {
                        switch (employeeModel.RoleID)
                        {
                            case 1:
                                MainCore.CoreFrame.Navigate(new MainAdminPage());
                                break;
                            case 2:
                                MainCore.CoreFrame.Navigate(new MainPharmacy());
                                break;
                            case 3:
                                MessageBox.Show("Кассир ", "Системное сообщение", MessageBoxButton.OK, MessageBoxImage.Error);
                                break;
                        }
                    }
                    else
                    {
                        MessageBox.Show("Ошбика ввода данных", "Системное сообщение", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
                catch (Exception ex)
                {

                    MessageBox.Show(ex.Message.ToString(), "Системное сообщение", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void BtnlistProduct_Click(object sender, RoutedEventArgs e)
        {
            MainCore.CoreFrame.Navigate(new ProductPageList());
        }
    }
}
