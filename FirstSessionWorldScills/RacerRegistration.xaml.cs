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
    public partial class RacerRegistration : Window
    {
        public DispatcherTimer timer = new DispatcherTimer();
        UtilityClass utilityClass = new UtilityClass();

        DataSet1 dataSet1 = new DataSet1();
        GenderTableAdapter genderTableAdapter = new GenderTableAdapter();
        CountryTableAdapter countryTableAdapter = new CountryTableAdapter();
        UserTableAdapter userTableAdapter = new UserTableAdapter();
        RacerTableAdapter racerTableAdapter = new RacerTableAdapter();

        public RacerRegistration()
        {
            InitializeComponent();

            this.DateTB.PreviewTextInput += new TextCompositionEventHandler(textBox_PreviewTextInput);

            dataSet1 = new DataSet1();
            genderTableAdapter = new GenderTableAdapter();
            countryTableAdapter = new CountryTableAdapter();
            userTableAdapter = new UserTableAdapter();
            racerTableAdapter = new RacerTableAdapter();

            genderTableAdapter.Fill(dataSet1.Gender);
            countryTableAdapter.Fill(dataSet1.Country);
            userTableAdapter.Fill(dataSet1.User);
            racerTableAdapter.Fill(dataSet1.Racer);

            CountryTB.ItemsSource = dataSet1.Country.DefaultView;
            CountryTB.DisplayMemberPath = "Country_Name";
            CountryTB.SelectedValuePath = "ID_Country";
            CountryTB.SelectedIndex = 0;

            GenderCB.ItemsSource = dataSet1.Gender.DefaultView;
            GenderCB.DisplayMemberPath = "Gender_Name";
            GenderCB.SelectedValuePath = "ID_Gender";
            GenderCB.SelectedIndex = 0;

            TimeToEvent.Text = utilityClass.CountTimeToEvent();

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();
        }

        private void textBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void RegistrationTB_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                DateOnly.TryParse(DateTB.Text, out DateOnly dateOnly);

                bool chill1 = false;
                bool chill2 = false;
                bool chill3 = false;

                for (int i = 0; i < PasswordTB.Text.Length; i++)
                {
                    chill1 = char.IsLower(PasswordTB.Text[i]) ? true : chill1;
                    chill2 = !char.IsLetterOrDigit(PasswordTB.Text[i]) ? true : chill2;
                    chill3 = char.IsDigit(PasswordTB.Text[i]) ? true : chill3;
                }

                if (!string.IsNullOrEmpty(EmailTB.Text)
                    && !string.IsNullOrEmpty(PasswordTB.Text)
                    && !string.IsNullOrEmpty(RepeatPasswordTB.Text)
                    && !string.IsNullOrEmpty(NameTB.Text)
                    && !string.IsNullOrEmpty(SurnmaeTB.Text)
                    && EmailTB.Text.Contains("@")
                    && EmailTB.Text.Contains(".com")
                    && PasswordTB.Text == RepeatPasswordTB.Text
                    && PasswordTB.Text.Length >= 6
                    && chill1
                    && chill2
                    && (DateTime.Now.Year - dateOnly.Year) >= 10)
                {

                    int gg = (dataSet1.Tables["Racer"].Rows.Count);
                    userTableAdapter.InsertQuery(EmailTB.Text, PasswordTB.Text, NameTB.Text, SurnmaeTB.Text, "R");
                    racerTableAdapter.InsertQuery(NameTB.Text, SurnmaeTB.Text, (string)GenderCB.SelectedValue, DateTB.Text, (string)CountryTB.SelectedValue, PhotoTB.Text);
                    racerTableAdapter.Fill(dataSet1.Racer);

                    DataHolder.racerIDForRegistration = (int)dataSet1.Tables["Racer"].Rows[gg]["ID_Racer"]; 

                    //MessageBox.Show(DataHolder.racerIDForRegistration.ToString());
                    RacerWindow racerWindow = new RacerWindow();
                    racerWindow.Show();
                    this.Close();
                }
            }
            catch { }
        }

        private void CancelTB_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void timerTick(object sender, EventArgs e)
        {
            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }

        private void LoadPhoto_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog openFileDialog = new Microsoft.Win32.OpenFileDialog();
            openFileDialog.Filter = "png files (*.png)|*.png";
            bool? response = openFileDialog.ShowDialog();

            if (response == true)
            {
                string filepath = openFileDialog.FileName;
                PhotoTB.Text = filepath;
                PhotoIM.Source = new BitmapImage(new Uri(filepath));
            }
        }

        private void DateTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (DateTB.Text.Length == 4 || DateTB.Text.Length == 7)
            {
                DateTB.Text = DateTB.Text + "-";
                DateTB.SelectionStart = DateTB.Text.Length;
            }
        }
    }
}
