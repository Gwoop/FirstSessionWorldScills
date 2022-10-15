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

    public partial class SponsorList : Window
    {

        UtilityClass utilityClass = new UtilityClass();

        public DispatcherTimer timer = new DispatcherTimer();

        public decimal moneyCharity = 0;

        DataSet1 dataSet1;
        TotalCharityMoneyTableAdapter totalCharityMoneyTableAdapter;
        CharityTableAdapter charityTableAdapter;
        SponsorshipTableAdapter sponsorshipTableAdapter;

        public SponsorList()
        {
            InitializeComponent();

            dataSet1 = new DataSet1();
            totalCharityMoneyTableAdapter = new TotalCharityMoneyTableAdapter();
            charityTableAdapter = new CharityTableAdapter();
            sponsorshipTableAdapter = new SponsorshipTableAdapter();

            totalCharityMoneyTableAdapter.Fill(dataSet1.TotalCharityMoney);
            charityTableAdapter.Fill(dataSet1.Charity);
            sponsorshipTableAdapter.Fill(dataSet1.Sponsorship);

            listview.ItemsSource = dataSet1.TotalCharityMoney.DefaultView;

            sortirovkaCB.Items.Add("По сумме");
            sortirovkaCB.Items.Add("По наименованию");

            blagotTB.Text = dataSet1.Tables["Charity"].Rows.Count.ToString();
            for (int i = 0; i < dataSet1.Tables["Sponsorship"].Rows.Count; i++)
            {
                moneyCharity += Convert.ToDecimal(dataSet1.Tables["Sponsorship"].Rows[i]["Amount"]);
            }

            vznosTB.Text = moneyCharity.ToString();
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

        private void sortirovkaBTN_Click(object sender, RoutedEventArgs e)
        {
            switch ((int)sortirovkaCB.SelectedIndex)
            {
                case 0:
                    totalCharityMoneyTableAdapter.FillMoneyAsc(dataSet1.TotalCharityMoney);
                    listview.ItemsSource = dataSet1.TotalCharityMoney.DefaultView;
                    break;
                case 1:
                    totalCharityMoneyTableAdapter.FillNameAsc(dataSet1.TotalCharityMoney);
                    listview.ItemsSource = dataSet1.TotalCharityMoney.DefaultView;
                    break;
            }
        }

        private void cancelBTN_Click(object sender, RoutedEventArgs e)
        {
            CoachWindow coachWindow = new CoachWindow();
            coachWindow.Show();
            this.Show();
        }

        private void logoutBTN_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }
    }
}
