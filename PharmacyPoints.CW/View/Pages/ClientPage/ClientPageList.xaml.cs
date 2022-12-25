using System;
using System.Collections.Generic;
using PharmacyPoints.CW.Core;
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

namespace PharmacyPoints.CW.View.Pages.ClientPage
{
    /// <summary>
    /// Логика взаимодействия для ClientPageList.xaml
    /// </summary>
    public partial class ClientPageList : Page
    {
        public ClientPageList()
        {
            InitializeComponent();
            DataEmploerInfo.ItemsSource = MainCore.DB.Clients.OrderBy(g => g.NameClient).ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
