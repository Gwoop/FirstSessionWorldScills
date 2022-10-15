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
    /// Interaction logic for AcceptRacerWindow.xaml
    /// </summary>
    public partial class AcceptRacerWindow : Window
    {
        public DispatcherTimer timer = new DispatcherTimer();

        UtilityClass utilityClass = new UtilityClass();
        public AcceptRacerWindow()
        {
            InitializeComponent();

            TimeToEvent.Text = TimeToEvent.Text = utilityClass.CountTimeToEvent();

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            RacerWindow racerWindow = new RacerWindow();
            racerWindow.Show();
            this.Close();
        }

        private void timerTick(object sender, EventArgs e)
        {

            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }
    }
}
