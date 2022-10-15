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
    /// <summary>
    /// Interaction logic for RacerManage.xaml
    /// </summary>
    public partial class RacerManage : Window
    {
        public string racerSurname = "";

        public DispatcherTimer timer = new DispatcherTimer();
        UtilityClass utilityClass = new UtilityClass();
        DataSet1 dataSet1;
        Registration_StatusTableAdapter registrationStatusTableAdapter;
        EventTableAdapter eventTableAdapter;
        Event_TypeTableAdapter event_TypeTableAdapter;
        RacerTableAdapter racerTableAdapter;
        UserTableAdapter userTableAdapter;
        RegistrationTableAdapter registrationTableAdapter;
        RaceTableAdapter raceTableAdapter;
        AllRacersTableAdapter allRacersTableAdapter;

        public RacerManage()
        {
            InitializeComponent();

            dataSet1 = new DataSet1();
            

            registrationStatusTableAdapter = new Registration_StatusTableAdapter();
            eventTableAdapter = new EventTableAdapter();
            event_TypeTableAdapter = new Event_TypeTableAdapter();
            racerTableAdapter = new RacerTableAdapter();
            userTableAdapter = new UserTableAdapter();
            registrationTableAdapter = new RegistrationTableAdapter();
            raceTableAdapter = new RaceTableAdapter();

            allRacersTableAdapter = new AllRacersTableAdapter();

            registrationStatusTableAdapter.Fill(dataSet1.Registration_Status);
            registrationTableAdapter.Fill(dataSet1.Registration);
            raceTableAdapter.Fill(dataSet1.Race);
            eventTableAdapter.Fill(dataSet1.Event);
            event_TypeTableAdapter.Fill(dataSet1.Event_Type);
            racerTableAdapter.Fill(dataSet1.Racer);
            userTableAdapter.Fill(dataSet1.User);  

            statusCB.ItemsSource = dataSet1.Registration_Status.DefaultView;
            statusCB.SelectedValuePath = "ID_Registration_Status";
            statusCB.DisplayMemberPath = "Statu_Name";
            statusCB.SelectedIndex = 0;

            vidraceCB.ItemsSource = dataSet1.Event_Type.DefaultView;
            vidraceCB.SelectedValuePath = "ID_Event_type";
            vidraceCB.DisplayMemberPath = "Event_Type_Name";
            vidraceCB.SelectedIndex = 0;

            try
            {
                allRacersTableAdapter.Fill(dataSet1.AllRacers);

            }
            catch (Exception ex) 
            { 
                MessageBox.Show(ex.ToString()); 
            }
            listview.ItemsSource = dataSet1.AllRacers.DefaultView;
            listview.SelectedValuePath = "Last_Name";

            sortirovkaCB.ItemsSource = dataSet1.Racer.DefaultView;
            sortirovkaCB.SelectedValuePath = "ID_Racer";
            sortirovkaCB.DisplayMemberPath = "First_Name";
            sortirovkaCB.SelectedIndex = 0;

            listview.ItemsSource = dataSet1.AllRacers.DefaultView;

            TimeToEvent.Text = utilityClass.CountTimeToEvent();

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();
        }

        private void sortirovkaCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void updateBTN_Click(object sender, RoutedEventArgs e)
        {
            allRacersTableAdapter.FillBy(dataSet1.AllRacers, vidraceCB.Text, sortirovkaCB.Text, statusCB.Text);
            listview.ItemsSource = dataSet1.AllRacers.DefaultView;
        }
        private void timerTick(object sender, EventArgs e)
        {
            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                DataHolder.racerSurname = listview.SelectedValue.ToString();
                RacerControlWindow racerControlWindow = new RacerControlWindow();
                racerControlWindow.Show();
                this.Close();
            }
            catch (Exception ex) { }
        }

        private void cancelBTN_Click(object sender, RoutedEventArgs e)
        {
            CoachWindow coachWindow = new CoachWindow();
            coachWindow.Show();
            this.Close();
        }

        private void logoutBTN_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }
    }
}
