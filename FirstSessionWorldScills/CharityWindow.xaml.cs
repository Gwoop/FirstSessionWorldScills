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
using FirstSessionWorldScills.DataSet1TableAdapters;

namespace FirstSessionWorldScills
{
    public partial class CharityWindow : Window
    {

        public DispatcherTimer timer = new DispatcherTimer();

        UtilityClass utilityClass = new UtilityClass();

        DataSet1 dataSet;
        CharityTableAdapter charityTableAdapter;

        public CharityWindow()
        {
            InitializeComponent();

            dataSet = new DataSet1();
            charityTableAdapter = new CharityTableAdapter();

            TimeToEvent.Text = TimeToEvent.Text = utilityClass.CountTimeToEvent();

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();

            charityTableAdapter.Fill(dataSet.Charity);

            listview.ItemsSource = dataSet.Charity.DefaultView;

        } 

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            InfoWindow infoWindow = new InfoWindow();
            infoWindow.Show();
            this.Close();
        }

        private void timerTick(object sender, EventArgs e)
        {
            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }
    }
}
