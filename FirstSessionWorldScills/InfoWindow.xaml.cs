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
    /// Interaction logic for InfoWindow.xaml
    /// </summary>
    public partial class InfoWindow : Window
    {
        public DispatcherTimer timer = new DispatcherTimer();

        UtilityClass utilityClass = new UtilityClass();
        public InfoWindow()
        {
            InitializeComponent();

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();
        }

        private void KartSkills_Click(object sender, RoutedEventArgs e)
        {
            RaceInfoWindow raceInfoWindow = new RaceInfoWindow();
            raceInfoWindow.Show();
            this.Close();
        }

        private void PastResults_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Предыдущие рузельтаты ещё в разработке, окно недоступно.");
        }

        private void CharityList_Click(object sender, RoutedEventArgs e)
        {
            CharityWindow charityWindow = new CharityWindow();
            charityWindow.Show();
            this.Close();
            //MessageBox.Show("Charity organisations list");
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
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
