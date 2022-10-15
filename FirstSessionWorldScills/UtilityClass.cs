using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstSessionWorldScills
{
    public static class DataHolder
    {
        public static string? charName;
        public static string? raceName;
        public static string? payment;
        public static string? charityID;
        public static string? racerSurname;
        public static bool? charityEdit;


        public static int racerIDForRegistration;
    }

    internal class UtilityClass
    {
        public string CountTimeToEvent()
        {
            DateTime otherDate = new DateTime(2022, 6, 20, 20, 0, 0);
            //TimeSpan remaining = otherDate - DateTime.Now;
            //DateTime total = new DateTime() + remaining;
            ////int year = remaining.Days / 365;
            ////int remains = remaining.Days % 365;
            ////int remainsDays = remaining.Days % 365;
            ////int month = remainsDays / 12;
            ////int remainsMonths = remaining.Days % 12;


            //return "До начала события осталось " + total.Year + " лет, " + total.Month + " месяцев, " + total.Day + " дней, " + total.Hour + " часов, " + total.Minute + " минут " + total.Second + " и секунд.";
            var left = otherDate.Subtract(DateTime.Now);
            var years = left.Days / 365;
            var daysRemainsOfYears = left.Days % 365;
            var months = daysRemainsOfYears / 30;
            var daysRemainsOfMonths = daysRemainsOfYears % 30;
            return $"До начала события осталось {years} лет, {months} месяцев, {daysRemainsOfMonths} дней, {left:hh} часов, {left:mm} минут и {left:ss} секунд";
        }
    }
}
