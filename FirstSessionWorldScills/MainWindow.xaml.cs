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
using System.Windows.Threading;
using FirstSessionWorldScills.DataSet1TableAdapters;

namespace FirstSessionWorldScills
{
    public partial class MainWindow : Window
    {
        public DispatcherTimer timer = new DispatcherTimer();
        UtilityClass utilityClass = new UtilityClass();
        DataSet1 dataSet1 = new DataSet1();
        CountryTableAdapter countryTableAdapter = new CountryTableAdapter();    

        public MainWindow()
        {
            InitializeComponent();

            dataSet1 = new DataSet1();
            countryTableAdapter = new CountryTableAdapter();

            countryTableAdapter.Fill(dataSet1.Country);


            TimeToEvent.Text = utilityClass.CountTimeToEvent();

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();
        }

        private void HelmetImage_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            FirstRacer firstRacer = new FirstRacer();
            firstRacer.Show();
            this.Close();
        }

        private void MoneyImage_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            SponsorWindow sponsorWindow = new SponsorWindow();
            sponsorWindow.Show();
            this.Close();
        }

        private void InfoImage_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            InfoWindow infoWindow = new InfoWindow();
            infoWindow.Show();
            this.Close();
        }

        private void KeyImage_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            AuthorizationWindow authorizationWindow = new AuthorizationWindow();
            authorizationWindow.Show();
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
        }

        private void timerTick(object sender, EventArgs e)
        {
            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }
    }
}
