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
    /// <summary>
    /// Interaction logic for RaceRegistration.xaml
    /// </summary>
    public partial class RaceRegistration : Window
    {
        DataSet1 dataSet1;
        CharityTableAdapter charityTableAdapter1;
        RegistrationTableAdapter registrationTableAdapter1;

        public DispatcherTimer timer = new DispatcherTimer();
        UtilityClass utilityClass = new UtilityClass();

        public int summ = 25;
        public int summForInventory = 0;

        public bool radio1 = false;
        public bool radio2 = false;
        public bool radio3 = false;

        public RaceRegistration()
        {
            InitializeComponent();

            dataSet1 = new DataSet1();
            charityTableAdapter1 = new CharityTableAdapter();
            registrationTableAdapter1 = new RegistrationTableAdapter();

            charityTableAdapter1.Fill(dataSet1.Charity);
            registrationTableAdapter1.Fill(dataSet1.Registration);

            this.TargetTB.PreviewTextInput += new TextCompositionEventHandler(textBox_PreviewTextInput);

            MoneyTB.Text = "$ " + summ;

            TimeToEvent.Text = utilityClass.CountTimeToEvent();

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();

            CharityCB.ItemsSource = dataSet1.Charity.DefaultView;
            CharityCB.DisplayMemberPath = "Charity_Name";
            CharityCB.SelectedValuePath = "ID_Сharity";
            CharityCB.SelectedIndex = 0;

        }

        private void textBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void Register_Click(object sender, RoutedEventArgs e)
        {
            if(!string.IsNullOrEmpty(TargetTB.Text))
            {
                int gg = 0;
                if (radio1) gg = 1;
                if (radio2) gg = 2;
                if (radio3) gg = 3;

                DateOnly ff = new DateOnly(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                
                string dateNow = DateTime.Now.ToString("yyyy-MM-dd");

                if (TypeOne.IsChecked==true) registrationTableAdapter1.Insert(DataHolder.racerIDForRegistration, Convert.ToDateTime(dateNow), 1, (decimal)(summ + summForInventory), (int)CharityCB.SelectedValue, decimal.Parse(TargetTB.Text), "2.5KM",  gg);
                if (TypeTwo.IsChecked==true) registrationTableAdapter1.Insert(DataHolder.racerIDForRegistration, Convert.ToDateTime(dateNow), 1, (decimal)(summ + summForInventory), (int)CharityCB.SelectedValue, decimal.Parse(TargetTB.Text), "4KM  ",  gg);
                if (TypeOne.IsChecked==true) registrationTableAdapter1.Insert(DataHolder.racerIDForRegistration, Convert.ToDateTime(dateNow), 1, (decimal)(summ + summForInventory), (int)CharityCB.SelectedValue, decimal.Parse(TargetTB.Text), "6.5KM",  gg);
                AcceptRacerWindow acceptRacerWindow = new AcceptRacerWindow();
                acceptRacerWindow.ShowDialog();
                this.Close();
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {

        }

        private void timerTick(object sender, EventArgs e)
        {
            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            RacerWindow racerWindow = new RacerWindow();
            racerWindow.Show();
            this.Close();
        }

        #region "Types"

        private void TypeOne_Unchecked(object sender, RoutedEventArgs e)
        {
            if ((TypeThree.IsChecked == true) || (TypeTwo.IsChecked == true))
            {
                summ -= 25;
                MoneyTB.Text = "$ " + (summ + summForInventory);
            }
            else
            {
                summ -= 25;
                TypeOne.IsChecked = true;
            }
        }

        private void TypeOne_Checked(object sender, RoutedEventArgs e)
        {
            if (summ != 25)
            {
                summ += 25;
                MoneyTB.Text = "$ " + (summ + summForInventory);
            }
            //MessageBox.Show(summ.ToString());

        }

        private void TypeTwo_Unchecked(object sender, RoutedEventArgs e)
        {
            if ((TypeThree.IsChecked == true) || (TypeOne.IsChecked == true))
            {
                summ -= 40;
                MoneyTB.Text = "$ " + (summ + summForInventory);
            }
            else
            {
                TypeTwo.IsChecked = true;

                summ -= 40;
            }
        }

        private void TypeTwo_Checked(object sender, RoutedEventArgs e)
        {
            summ += 40;
            MoneyTB.Text = "$ " + (summ + summForInventory);
        }

        private void TypeThree_Unchecked(object sender, RoutedEventArgs e)
        {
            if ((TypeTwo.IsChecked == true) || (TypeOne.IsChecked == true))
            {
                summ -= 65;
                MoneyTB.Text = "$ " + (summ + summForInventory);
            }
            else
            {
                TypeThree.IsChecked = true;
                summ -= 65;
            }
        }

        private void TypeThree_Checked(object sender, RoutedEventArgs e)
        {
            summ += 65;
            MoneyTB.Text = "$ " + (summ + summForInventory);
        }

        #endregion

        #region "Radio"

        private void A_Checked(object sender, RoutedEventArgs e)
        {
            summForInventory = 0;
            MoneyTB.Text = "$ " + (summ+summForInventory);
            radio1 = true;
        }

        private void A_Unchecked(object sender, RoutedEventArgs e)
        {
            summForInventory = 0;
            MoneyTB.Text = "$ " + (summ - summForInventory);
            radio1 = false;
        }

        private void B_Checked(object sender, RoutedEventArgs e)
        {

            summForInventory = 30;
            MoneyTB.Text = "$ " + (summ + summForInventory);
            radio2 = true;
        }

        private void B_Unchecked(object sender, RoutedEventArgs e)
        {

            summForInventory = 30;
            MoneyTB.Text = "$ " + (summ - summForInventory);
            radio2 = false;
        }

        private void C_Checked(object sender, RoutedEventArgs e)
        {

            summForInventory = 50;
            MoneyTB.Text = "$ " + (summ + summForInventory);
            radio3 = true;  
        }

        private void C_Unchecked(object sender, RoutedEventArgs e)
        {

            summForInventory = 50;
            MoneyTB.Text = "$ " + (summ - summForInventory);
            radio3 = false;
        }
        #endregion

    }
}
