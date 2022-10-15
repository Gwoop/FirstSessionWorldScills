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
    /// Interaction logic for RacerControlWindow.xaml
    /// </summary>
    public partial class RacerControlWindow : Window
    {
        DataSet1 dataSet1;

        public DispatcherTimer timer = new DispatcherTimer();
        UtilityClass utilityClass = new UtilityClass();
        Registration_StatusTableAdapter registrationStatusTableAdapter;
        EventTableAdapter eventTableAdapter;
        Event_TypeTableAdapter event_TypeTableAdapter;
        RacerTableAdapter racerTableAdapter;
        UserTableAdapter userTableAdapter;
        RegistrationTableAdapter registrationTableAdapter;
        RaceTableAdapter raceTableAdapter;
        CountryTableAdapter countryTableAdapter;
        CharityTableAdapter charityTableAdapter;


        public RacerControlWindow()
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
            countryTableAdapter = new CountryTableAdapter();
            charityTableAdapter = new CharityTableAdapter();

            registrationStatusTableAdapter.Fill(dataSet1.Registration_Status);
            registrationTableAdapter.Fill(dataSet1.Registration);
            raceTableAdapter.Fill(dataSet1.Race);
            eventTableAdapter.Fill(dataSet1.Event);
            event_TypeTableAdapter.Fill(dataSet1.Event_Type);
            racerTableAdapter.Fill(dataSet1.Racer);
            userTableAdapter.Fill(dataSet1.User);
            countryTableAdapter.Fill(dataSet1.Country);
            charityTableAdapter.Fill(dataSet1.Charity);

            TimeToEvent.Text = utilityClass.CountTimeToEvent();

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();

            int racerID;
            string racerCountry;
            string racerCharity;

            for(int i = 0; i < dataSet1.Tables["User"].Rows.Count; i++)
            {
                if(DataHolder.racerSurname == dataSet1.Tables["User"].Rows[i]["Last_Name"])
                {
                    emailLB.Content = dataSet1.Tables["User"].Rows[i]["Email"].ToString();
                    nameLB.Content = dataSet1.Tables["User"].Rows[i]["First_Name"].ToString();
                    surnameLB.Content = dataSet1.Tables["User"].Rows[i]["Last_Name"].ToString();
                }
            }

            for (int i = 0; i < dataSet1.Tables["Racer"].Rows.Count; i++)
            {
                if (DataHolder.racerSurname == dataSet1.Tables["Racer"].Rows[i]["Last_Name"])
                {
                    racerID = int.Parse(dataSet1.Tables["Racer"].Rows[i]["ID_Racer"].ToString());
                    genderLB.Content = dataSet1.Tables["Racer"].Rows[i]["Gender"].ToString();
                    birthLB.Content = dataSet1.Tables["Racer"].Rows[i]["DateOfBirth"].ToString();
                    countryLB.Content = dataSet1.Tables["Racer"].Rows[i]["ID_Country"].ToString();

                    for (int j = 0; j < dataSet1.Tables["Country"].Rows.Count; j++)
                    {
                        if (dataSet1.Tables["Racer"].Rows[i]["ID_Country"] == dataSet1.Tables["Country"].Rows[j]["Country_Name"])
                        {
                            racerCountry = dataSet1.Tables["Country"].Rows[j]["Country_Name"].ToString();
                        }
                    }

                    for (int q = 0; q < dataSet1.Tables["Registration"].Rows.Count; q++)
                    {
                        if (racerID == int.Parse(dataSet1.Tables["Registration"].Rows[q]["ID_Racer"].ToString()))
                        {


                            for (int j = 0; j < dataSet1.Tables["Charity"].Rows.Count; j++)
                            {
                                if (dataSet1.Tables["Registration"].Rows[q]["ID_Charity"] == dataSet1.Tables["Charity"].Rows[j]["ID_Charity"])
                                {
                                    racerCharity = dataSet1.Tables["Charity"].Rows[j]["Charity_Name"].ToString();
                                    MessageBox.Show(racerCharity);
                                    MessageBox.Show(racerID.ToString());
                                }
                            }
                        }
                    }
                }
            }
        }

        private void timerTick(object sender, EventArgs e)
        {
            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }
    }
}
