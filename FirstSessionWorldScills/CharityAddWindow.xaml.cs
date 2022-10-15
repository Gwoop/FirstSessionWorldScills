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
    /// Interaction logic for CharityAddWindow.xaml
    /// </summary>
    public partial class CharityAddWindow : Window
    {

        public DispatcherTimer timer = new DispatcherTimer();

        UtilityClass utilityClass = new UtilityClass();

        DataSet1 dataSet1;
        CharityTableAdapter charityTableAdapter;

        public CharityAddWindow()
        {
            InitializeComponent();

            dataSet1 = new DataSet1();
            charityTableAdapter = new CharityTableAdapter();

            charityTableAdapter.Fill(dataSet1.Charity);

            TimeToEvent.Text = TimeToEvent.Text = utilityClass.CountTimeToEvent();

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();

            try
            {
                MessageBox.Show(DataHolder.charityID.ToString());
            }
            catch (Exception ex) { }
        }

        private void saveBTN_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (DataHolder.charityEdit == true)
                {
                    charityTableAdapter.UpdateQuery(NameTB.Text, descriptionTB.Text, logotipTB.Text, int.Parse(DataHolder.charityID));
                    CharityManager charityManager = new CharityManager();
                    charityManager.Show();
                    this.Close();
                }
                else
                {
                    if(!string.IsNullOrEmpty(NameTB.Text)&&!string.IsNullOrEmpty(logotipTB.Text))
                    {
                        charityTableAdapter.Insert(NameTB.Text, descriptionTB.Text, logotipTB.Text);
                        CharityManager charityManager = new CharityManager();
                        charityManager.Show();
                        this.Close();
                    }
                }
            }
            catch { }
        }

        private void otmenaBTN_Click(object sender, RoutedEventArgs e)
        {
            CharityManager charityManager = new CharityManager();
            charityManager.Show();
            this.Close();
        }

        private void photoBTN_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog openFileDialog = new Microsoft.Win32.OpenFileDialog();
            openFileDialog.Filter = "png files (*.png)|*.png";
            bool? response = openFileDialog.ShowDialog();

            if (response == true)
            {
                string filepath = openFileDialog.FileName;
                logotipTB.Text = filepath;
                Logo.Source = new BitmapImage(new Uri(filepath));
            }
        }

        private void logoutBTN_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void timerTick(object sender, EventArgs e)
        {
            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            int id = int.Parse(DataHolder.charityID);
            for (int i = 0; i < dataSet1.Tables["Charity"].Rows.Count; i++)
            {
                if (id == (int)dataSet1.Tables["Charity"].Rows[i]["ID_Сharity"])
                {
                    NameTB.Text = dataSet1.Tables["Charity"].Rows[0]["Charity_Name"].ToString();
                    descriptionTB.Text = dataSet1.Tables["Charity"].Rows[0]["Charity_Description"].ToString();
                    try
                    {
                        Logo.Source = new BitmapImage(new Uri(dataSet1.Tables["Charity"].Rows[0]["Charity_Logo"].ToString()));
                    }
                    catch
                    {

                    }
                }
            }
        }
    }
}