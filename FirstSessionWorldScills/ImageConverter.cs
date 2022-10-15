using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace FirstSessionWorldScills
{
    public class ImageConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            dynamic dataObject = value;
            if (dataObject != null)
            {
                string path = dataObject.GetGuestImage();
                if (System.IO.File.Exists(path))
                    return new Uri(dataObject.GetGuestImage(), UriKind.RelativeOrAbsolute);
            }
            return new Uri(@"c:\placeholderimage.png", UriKind.RelativeOrAbsolute);
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}