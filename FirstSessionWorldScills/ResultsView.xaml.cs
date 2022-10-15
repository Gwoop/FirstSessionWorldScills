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
    /// Interaction logic for ResultsView.xaml
    /// </summary>
    public partial class ResultsView : Window
    {

        UtilityClass utilityClass = new UtilityClass();

        public DispatcherTimer timer = new DispatcherTimer();

        public int racerID = DataHolder.racerIDForRegistration;
        public string genderUser = "";
        public int ageUser;

        DataSet1 dataSet1;
        ResultsVIewTableAdapter resultsViewTableAdapter;
        RegistrationTableAdapter registrationTableAdapter;
        RacerTableAdapter racerTableAdapter;

        public void FindRacer()
        {
            try
            {
                for (int i = 0; i < dataSet1.Tables["Registration"].Rows.Count; i++)
                {
                    if (racerID == (int)dataSet1.Tables["Registration"].Rows[i]["ID_Racer"])
                    {
                        racerID = (int)dataSet1.Tables["Registration"].Rows[i]["ID_Registration"];
                    }
                }
            }
            catch
            {
            }
        }

        public void FindInfo()
        {
            //try
            //{
            for (int i = 0; i < dataSet1.Tables["Racer"].Rows.Count; i++)
            {
                if (racerID == (int)dataSet1.Tables["Racer"].Rows[i]["ID_Racer"])
                {
                    DateOnly.TryParse(dataSet1.Tables["Racer"].Rows[i]["DateOfBirth"].ToString(), out DateOnly gg);

                    DateTime actualDate = DateTime.Parse(dataSet1.Tables["Racer"].Rows[i]["DateOfBirth"].ToString());

                    ageUser = (int)(DateTime.Now.Year - actualDate.Year);
                    genderUser = dataSet1.Tables["Racer"].Rows[i]["Gender"].ToString();

                    if(ageUser < 18) datebirthTB.Text = "до 18";
                    else if(ageUser >= 18 && ageUser <= 29) datebirthTB.Text = "от 18 до 29";
                    else if(ageUser >= 30 && ageUser <= 39) datebirthTB.Text = "от 30 до 39";
                    else if(ageUser >= 40 && ageUser <= 55) datebirthTB.Text = "от 40 до 55";
                    else if(ageUser >= 56 && ageUser <= 70) datebirthTB.Text = "от 56 до 70";
                    else if(ageUser < 70) datebirthTB.Text = "от 70";

                    genderTB.Text = genderUser;
                    datebirthTB.Text = ageUser.ToString();
                }
            }
            //}
            //catch { }
        }

        public ResultsView()
        {
            InitializeComponent();

            dataSet1 = new DataSet1();
            resultsViewTableAdapter = new ResultsVIewTableAdapter();
            registrationTableAdapter = new RegistrationTableAdapter();
            racerTableAdapter = new RacerTableAdapter();

            racerTableAdapter.Fill(dataSet1.Racer);
            FindInfo();

            registrationTableAdapter.Fill(dataSet1.Registration);
            FindRacer();
            //MessageBox.Show(racerID.ToString());
            resultsViewTableAdapter.Fill(dataSet1.ResultsVIew, racerID);
            racerTableAdapter.Fill(dataSet1.Racer);

            TimeToEvent.Text = TimeToEvent.Text = utilityClass.CountTimeToEvent();

            listview.ItemsSource = dataSet1.ResultsVIew.DefaultView;

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();
        }

        private void timerTick(object sender, EventArgs e)
        {
            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }

        private void logoutBTN_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void backBTN_Click(object sender, RoutedEventArgs e)
        {
            RacerWindow racerWindow = new RacerWindow();
            racerWindow.Show();
            this.Close();
        }
    }
}
