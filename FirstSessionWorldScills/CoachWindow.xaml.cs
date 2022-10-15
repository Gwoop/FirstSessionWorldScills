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
using System.Windows.Shapes;

namespace FirstSessionWorldScills
{
    /// <summary>
    /// Interaction logic for CoachWindow.xaml
    /// </summary>
    public partial class CoachWindow : Window
    {
        public CoachWindow()
        {
            InitializeComponent();
        }

        private void logoutBTN_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void sponsorsBTN_Click(object sender, RoutedEventArgs e)
        {
            SponsorList sponsorList = new SponsorList();
            sponsorList.Show();
            this.Close();
        }

        private void racistBTN_Click(object sender, RoutedEventArgs e)
        {
            RacerManage racerManage = new RacerManage();
            racerManage.Show();
            this.Close();
        }
    }
}
