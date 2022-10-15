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
    /// Interaction logic for RaceInfoWindow.xaml
    /// </summary>
    public partial class RaceInfoWindow : Window
    {
        public DispatcherTimer timer = new DispatcherTimer();
        UtilityClass utilityClass = new UtilityClass();

        public RaceInfoWindow()
        {
            InitializeComponent();

            TimeToEvent.Text = utilityClass.CountTimeToEvent();

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();
        }

        private void mapBTN_Click(object sender, RoutedEventArgs e)
        {
            MapImage.Visibility = Visibility.Visible;
        }

        private void backBTN_Click(object sender, RoutedEventArgs e)
        {
            if (MapImage.IsVisible)
            {
                MapImage.Visibility = Visibility.Hidden;
            }
            else
            {
                InfoWindow infoWindow = new InfoWindow();
                infoWindow.Show();
                this.Close();
            }
        }

        private void timerTick(object sender, EventArgs e)
        {
            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }
    }
}
