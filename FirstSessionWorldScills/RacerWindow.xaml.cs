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
    /// Interaction logic for RacerWindow.xaml
    /// </summary>
    public partial class RacerWindow : Window
    {

        UtilityClass utilityClass = new UtilityClass();

        public DispatcherTimer timer = new DispatcherTimer();

        public RacerWindow()
        {
            InitializeComponent();

            TimeToEvent.Text = TimeToEvent.Text = utilityClass.CountTimeToEvent();

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();
        }

        private void RegisterButton_Click(object sender, RoutedEventArgs e)
        {
            RaceRegistration raceRegistration = new RaceRegistration();
            raceRegistration.Show();
            this.Close();
        }

        private void timerTick(object sender, EventArgs e)
        {
            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            RacerEditWindow editWindow = new RacerEditWindow(); 
            editWindow.Show();
            this.Close();
        }

        private void ContactButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("+7(999)-99-99 kart_skills2022@gmail.com");
        }

        private void ResultButton_Click(object sender, RoutedEventArgs e)
        {
            ResultsView resultsView = new ResultsView();
            resultsView.Show();
            this.Close();
        }

        private void SponsorButton_Click(object sender, RoutedEventArgs e)
        {
            RacerSponsorsWindow racerSponsorsWindow = new RacerSponsorsWindow();
            racerSponsorsWindow.Show();
            this.Close();
        }
    }
}
