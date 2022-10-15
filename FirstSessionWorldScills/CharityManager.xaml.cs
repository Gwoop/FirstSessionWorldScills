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
    public partial class CharityManager : Window
    {

        public DispatcherTimer timer = new DispatcherTimer();

        UtilityClass utilityClass = new UtilityClass();

        DataSet1 dataSet1;
        CharityTableAdapter charityTableAdapter1;

        public CharityManager()
        {
            InitializeComponent();

            dataSet1 = new DataSet1();
            charityTableAdapter1 = new CharityTableAdapter();

            TimeToEvent.Text = TimeToEvent.Text = utilityClass.CountTimeToEvent();

            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Start();

            charityTableAdapter1.Fill(dataSet1.Charity);

            listview.ItemsSource = dataSet1.Charity.DefaultView;
            listview.SelectedValuePath = "ID_Сharity";
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            DataHolder.charityEdit = true;

            Button button = sender as Button;
            int index = Int32.Parse(button.Tag.ToString());
            int charityID = (int)listview.SelectedValue;

            DataHolder.charityID = charityID.ToString();
            MessageBox.Show(DataHolder.charityID.ToString());
            CharityAddWindow charityAddWindow = new CharityAddWindow();
            charityAddWindow.Show();
            this.Close();

            //MessageBox.Show(index.ToString());
        }

        private void timerTick(object sender, EventArgs e)
        {
            TimeToEvent.Text = utilityClass.CountTimeToEvent();
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            AdminWindow adminWindow = new AdminWindow();
            adminWindow.Show();
            this.Close();
        }

        private void AddCharityBTN_Click(object sender, RoutedEventArgs e)
        {
            CharityAddWindow charityAddWindow = new CharityAddWindow();
            charityAddWindow.Show();
            this.Close();
        }
    }
}
