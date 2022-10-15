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
using FirstSessionWorldScills.DataSet1TableAdapters;

namespace FirstSessionWorldScills
{
    public partial class RacerSponsorsWindow : Window
    {
        DataSet1 dataSet1;
        CharityTableAdapter charityTableAdapter1;
        SponsorshipTableAdapter sponsorshipTableAdapter1;
        RegistrationTableAdapter registrationTableAdapter1;

        public decimal totalAmount = 0;
        public int charityID;
        public string charityName = "";
        public string charityDescrpition = "";
        public string charityLogo = "";

        public RacerSponsorsWindow()
        {
            InitializeComponent();

            dataSet1 = new DataSet1();
            charityTableAdapter1 = new CharityTableAdapter();
            sponsorshipTableAdapter1 = new SponsorshipTableAdapter();
            registrationTableAdapter1 = new RegistrationTableAdapter();

            charityTableAdapter1.Fill(dataSet1.Charity);
            sponsorshipTableAdapter1.FillBySponsor(dataSet1.Sponsorship, DataHolder.racerIDForRegistration);
            registrationTableAdapter1.Fill(dataSet1.Registration);

            int idRacer = DataHolder.racerIDForRegistration;


            try
            {
                for (int i = 0; i < dataSet1.Tables["Registration"].Rows.Count; i++)
                {
                    if (idRacer == (int)dataSet1.Tables["Registration"].Rows[i]["ID_Racer"])
                    {
                        charityID = (int)dataSet1.Tables["Registration"].Rows[i]["ID_Charity"];
                        for (int j = 0; j < dataSet1.Tables["Charity"].Rows.Count; j++)
                        {
                            if (charityID == (int)dataSet1.Tables["Charity"].Rows[j]["ID_Сharity"])
                            {
                                charityName = dataSet1.Tables["Charity"].Rows[j]["Charity_Name"].ToString();
                                charityDescrpition = dataSet1.Tables["Charity"].Rows[j]["Charity_Description"].ToString();
                                charityLogo = dataSet1.Tables["Charity"].Rows[j]["Charity_Logo"].ToString();

                                name.Text = charityName;
                                desc.Text = charityDescrpition;
                                try
                                {
                                    CharityLogo.Source = new BitmapImage(new Uri(charityLogo));
                                }
                                catch
                                {
                                    CharityLogo.Source = new BitmapImage(new Uri(@"/Icons/placeholder.png", UriKind.RelativeOrAbsolute));
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex) { }

            for (int i = 0; i < dataSet1.Tables["Sponsorship"].Rows.Count; i++)
            {
                if (idRacer == (int)dataSet1.Tables["Sponsorship"].Rows[i]["ID_Racer"]) totalAmount += (decimal)dataSet1.Tables["Sponsorship"].Rows[i]["Amount"];
            }

            listview.ItemsSource = dataSet1.Sponsorship;

            total.Text += totalAmount.ToString();
        }

        private void backBTN_Click(object sender, RoutedEventArgs e)
        {
            RacerWindow racerWindow = new RacerWindow();
            racerWindow.Show();
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
