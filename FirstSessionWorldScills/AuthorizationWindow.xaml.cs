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
    /// Interaction logic for AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        public DispatcherTimer timer = new DispatcherTimer();

        UtilityClass utilityClass = new UtilityClass();

        DataSet1 dataSet1;
        RoleTableAdapter roleTableAdapter;
        UserTableAdapter userTableAdapter;
        RacerTableAdapter racerTableAdapter;
        public AuthorizationWindow()
        {
            InitializeComponent();

            dataSet1 = new DataSet1();
            roleTableAdapter = new RoleTableAdapter();
            userTableAdapter = new UserTableAdapter();
            racerTableAdapter = new RacerTableAdapter();

            roleTableAdapter.Fill(dataSet1.Role);
            userTableAdapter.Fill(dataSet1.User);
            racerTableAdapter.Fill(dataSet1.Racer);

            TimeToEvent.Text = TimeToEvent.Text = utilityClass.CountTimeToEvent();
             
            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();
        }

        private void timerTick(object sender, EventArgs e)
        {

            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            string importEmail = EmailForm.Text;
            string importPassword = PasswordForm.Password;

            for(int i=0; i<dataSet1.Tables["User"].Rows.Count; i++)
            {
                if(importEmail == dataSet1.Tables["User"].Rows[i]["Email"].ToString() && importPassword == dataSet1.Tables["User"].Rows[i]["Password"].ToString())
                {
                    string roleID = dataSet1.Tables["User"].Rows[i]["ID_Role"].ToString();

                    string name = dataSet1.Tables["User"].Rows[i]["First_Name"].ToString();
                    string surname = dataSet1.Tables["User"].Rows[i]["Last_Name"].ToString();

                    for(int j = 0; j < dataSet1.Tables["Racer"].Rows.Count; j++)
                    {
                        if (dataSet1.Tables["Racer"].Rows[j]["First_Name"].ToString() == name && dataSet1.Tables["Racer"].Rows[j]["Last_Name"].ToString() == surname && roleID == "R")
                        {
                            DataHolder.racerIDForRegistration = (int)dataSet1.Tables["Racer"].Rows[j]["ID_Racer"];
                        }
                    }

                    switch (roleID)
                    {
                        case "R":
                            {
                                RacerWindow racerWindow = new RacerWindow();
                                racerWindow.Show();
                                this.Close();
                                break;
                            }
                        case "A":
                            {
                                AdminWindow adminWindow = new AdminWindow();
                                adminWindow.Show();
                                this.Close();
                                break;
                            }
                        case "C":
                            {
                                CoachWindow coachWindow = new CoachWindow();
                                coachWindow.Show();
                                this.Close();
                                break;
                            }
                        default: break;
                    }

                }
            }
        }

        private void CancelButtob_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }
    }
}
