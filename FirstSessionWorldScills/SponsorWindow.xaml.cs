using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    public partial class SponsorWindow : Window
    {
        UtilityClass utilityClass = new UtilityClass();

        public DispatcherTimer timer = new DispatcherTimer();

        //public decimal minimalPayment = 0;
        public string charityID = "";

        DataSet1 dataSet1;
        RacerTableAdapter racerTableAdapter;
        CharityTableAdapter charityTableAdapter;
        SponsorshipTableAdapter sponsorshipTableAdapter;
        RegistrationTableAdapter registrationTableAdapter;
        RacerViewTableAdapter racerViewTableAdapter;

        public SponsorWindow()
        {
            InitializeComponent();

            this.CarNumberTB.PreviewTextInput += new TextCompositionEventHandler(textBox_PreviewTextInput);
            this.CVCTB.PreviewTextInput += new TextCompositionEventHandler(textBox_PreviewTextInput1);
            this.CardMonthtTB.PreviewTextInput += new TextCompositionEventHandler(textBox_PreviewTextInput2);
            this.CardYearTB.PreviewTextInput += new TextCompositionEventHandler(textBox_PreviewTextInput3);

            dataSet1 = new DataSet1();
            racerTableAdapter = new RacerTableAdapter();
            charityTableAdapter = new CharityTableAdapter();
            sponsorshipTableAdapter = new SponsorshipTableAdapter();
            registrationTableAdapter = new RegistrationTableAdapter();
            racerViewTableAdapter = new RacerViewTableAdapter();

            racerTableAdapter.Fill(dataSet1.Racer);
            charityTableAdapter.Fill(dataSet1.Charity);
            sponsorshipTableAdapter.Fill(dataSet1.Sponsorship);
            registrationTableAdapter.Fill(dataSet1.Registration);
            racerViewTableAdapter.Fill(dataSet1.RacerView);

            RacerCB.ItemsSource = dataSet1.RacerView.DefaultView;
            RacerCB.DisplayMemberPath = "Expr2";
            RacerCB.SelectedValuePath = "ID_Racer";
            RacerCB.SelectedIndex = 0;

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

        private void RacerCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            for (int j = 0; j < dataSet1.Tables["Registration"].Rows.Count; j++)
            {
                if (RacerCB.SelectedValue.ToString() == dataSet1.Tables["Registration"].Rows[j]["ID_Racer"].ToString())
                {
                    charityID = dataSet1.Tables["Registration"].Rows[j]["ID_Charity"].ToString();
                }
            }

            for (int j = 0; j < dataSet1.Tables["Registration"].Rows.Count; j++)
            {
                if (RacerCB.SelectedValue.ToString() == dataSet1.Tables["Registration"].Rows[j]["ID_Racer"].ToString())
                {
                    //minimalPayment = decimal.Parse(dataSet1.Tables["Registration"].Rows[j]["Cost"].ToString());
                    //PaymentTB.Text = minimalPayment.ToString();
                    PaymentSumm.Content = PaymentTB.Text;
                }
            }

            for (int i = 0; i < dataSet1.Tables["Charity"].Rows.Count; i++)
            {
                if (charityID == dataSet1.Tables["Charity"].Rows[i]["ID_Сharity"].ToString())
                {
                    string charityName = dataSet1.Tables["Charity"].Rows[i]["Charity_Name"].ToString();
                    CharityName.Text = charityName;
                }
            }
        }

        private void LessMoney_Click(object sender, RoutedEventArgs e)
        {
            decimal summ;
            if (decimal.Parse(PaymentTB.Text) > 0)
            {
                summ = decimal.Parse(PaymentTB.Text);
                PaymentTB.Text = (summ - 1).ToString();
                PaymentSumm.Content = PaymentTB.Text;
            }
        }

        private void MoreMoney_Click(object sender, RoutedEventArgs e)
        {
            decimal summ;
            summ = decimal.Parse(PaymentTB.Text);
            PaymentTB.Text = (summ + 1).ToString();
            PaymentSumm.Content = PaymentTB.Text;
        }

        private void PaymentTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                if (decimal.Parse(PaymentTB.Text) < 0)
                {
                    PaymentTB.Text = "0";
                    PaymentSumm.Content = PaymentTB.Text;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Wrong format");
                PaymentSumm.Content = PaymentTB.Text;
            }
        }

        private void Pay_Click(object sender, RoutedEventArgs e)
        {

            try
            {
                DateTime dateCard = new DateTime(int.Parse(CardYearTB.Text), int.Parse(CardMonthtTB.Text), 1, 0, 0, 0);
                DateTime datenow = DateTime.Now;
                TimeSpan timeSpan = new TimeSpan(0, 0, 0, 0);

                bool check1 = true;
                bool check2 = true;
                bool check3 = true;

                if (string.IsNullOrEmpty(CardMonthtTB.Text) || string.IsNullOrEmpty(CardYearTB.Text) || string.IsNullOrEmpty(CardOwnerTB.Text) || string.IsNullOrEmpty(NameTB.Text) || string.IsNullOrEmpty(CVCTB.Text))
                {
                    check2 = false;
                    MessageBox.Show("Empty fields");
                }

                if((dateCard - datenow)<timeSpan)
                {
                    MessageBox.Show("Invalid card expiration date");
                    CardYearTB.Text = "";
                    CardMonthtTB.Text = "";
                    check3 = false;
                }
                if(check1&&check2&&check3)
                {
                    sponsorshipTableAdapter.InsertQuery(NameTB.Text, decimal.Parse((string)PaymentSumm.Content), (int)RacerCB.SelectedValue);
                    DataHolder.raceName = RacerCB.Text;
                    DataHolder.charName = CharityName.Text;
                    DataHolder.payment = PaymentSumm.Content.ToString();

                    AcceptSponsorWindow acceptSponsorWindow = new AcceptSponsorWindow();
                    acceptSponsorWindow.Show();
                    this.Close();
                }
            }
            catch (Exception ex) { MessageBox.Show(ex.ToString()); }
        }
        private void CarNumberTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (CarNumberTB.Text.Length == 4 || CarNumberTB.Text.Length == 9 || CarNumberTB.Text.Length == 14)
            {
                CarNumberTB.Text = CarNumberTB.Text + " ";
                CarNumberTB.SelectionStart = CarNumberTB.Text.Length;
            }
        }
        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        void textBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }
        void textBox_PreviewTextInput1(object sender, TextCompositionEventArgs e)
        {
            if (Char.IsLetter(e.Text, 0) || CVCTB.Text.Length >= 3)
            {
                MessageBox.Show("CVC invalid format");
                e.Handled = true;
            }
        }
        void textBox_PreviewTextInput2(object sender, TextCompositionEventArgs e)
        {
            if (Char.IsLetter(e.Text, 0) || CardMonthtTB.Text.Length >= 2)
            {
                e.Handled = true;
            }
        }
        void textBox_PreviewTextInput3(object sender, TextCompositionEventArgs e)
        {
            if (Char.IsLetter(e.Text, 0) || CardYearTB.Text.Length >= 4)
            {
                e.Handled = true;
            }
        }
    }
}