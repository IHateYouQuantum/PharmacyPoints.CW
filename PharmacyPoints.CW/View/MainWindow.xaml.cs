using PharmacyPoints.CW.Core;
using PharmacyPoints.CW.Model;
using PharmacyPoints.CW.View.Pages;
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

namespace PharmacyPoints.CW
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainCore.CoreFrame = MainFrame;
            MainFrame.Navigate(new LoginPage());

            MainCore.DB = new PharmacyPointsDBEntities();
        }
    }
}
