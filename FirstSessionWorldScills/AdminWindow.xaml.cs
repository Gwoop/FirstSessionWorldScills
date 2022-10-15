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
using System.Windows.Threading;

namespace FirstSessionWorldScills
{
    /// <summary>
    /// Interaction logic for AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        public DispatcherTimer timer = new DispatcherTimer();

        UtilityClass utilityClass = new UtilityClass();
        public AdminWindow()
        {
            InitializeComponent();

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();
        }

        private void cooldudesBTN_Click(object sender, RoutedEventArgs e)
        {

        }

        private void inventoryBTN_Click(object sender, RoutedEventArgs e)
        {

        }

        private void donateBTN_Click(object sender, RoutedEventArgs e)
        {
            CharityManager charityManager = new CharityManager();
            charityManager.Show();
            this.Close();
        }

        private void usersBTN_Click(object sender, RoutedEventArgs e)
        {

        }

        private void logoutBTN_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }
        private void timerTick(object sender, EventArgs e)
        {
            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }
    }
}
