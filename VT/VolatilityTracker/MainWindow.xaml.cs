using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.ComponentModel;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Net.Http;
using System.Net.Http.Headers;
using LiveCharts;
using LiveCharts.Defaults;
using LiveCharts.Wpf;

namespace VolatilityTracker
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : INotifyPropertyChanged
    {
        public SeriesCollection SeriesCollection { get; set; }
        public Func<double, string> XFormatter { get; set; }
        public Func<double, string> YFormatter { get; set; }
        static HttpClient client = new HttpClient();


        public MainWindow()
        {

            InitializeComponent();

            const string URL = "https://www.alphavantage.co/";
            client.BaseAddress = new Uri(URL);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));

        }

        private ZoomingOptions _zoomingMode;
        public ZoomingOptions ZoomingMode
        {
            get { return _zoomingMode; }
            set
            {
                _zoomingMode = value;
                OnPropertyChanged();
            }
        }

        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName = null)
        {
            if (PropertyChanged != null) PropertyChanged.Invoke(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
        }

        private void ToogleZoomingMode(object sender, RoutedEventArgs e)
        {
            switch (ZoomingMode)
            {
                case ZoomingOptions.None:
                    ZoomingMode = ZoomingOptions.X;
                    break;
                case ZoomingOptions.X:
                    ZoomingMode = ZoomingOptions.Y;
                    break;
                case ZoomingOptions.Y:
                    ZoomingMode = ZoomingOptions.Xy;
                    break;
                case ZoomingOptions.Xy:
                    ZoomingMode = ZoomingOptions.None;
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }

        private async Task<ChartValues<DateTimePoint>> GetData()
        {
            string _api_function = api_function.Text;
            string _api_stock_symbol = api_stock_symbol.Text;
            string _api_output_size = api_output_size.Text;
            string urlParameters = string.Format("query?function={0}&symbol={1}&outputsize={2}&apikey=WPR105SZICA1KKXP", _api_function, _api_stock_symbol, _api_output_size);

            Dictionary<string, Dictionary<string, string>> price = await GetData_API.RunAsync(client, urlParameters);

            int size = price.Count;
            var array = new DateTimePoint[size];
            var values = new ChartValues<DateTimePoint>();
            int i = 0;
            foreach (KeyValuePair<string, Dictionary<string, string>> entry in price)
            {
                DateTime datetime = DateTime.Parse(entry.Key);
                Double price_close = Convert.ToDouble(entry.Value["4. close"]);
                array[i] = new DateTimePoint(datetime, price_close);
                i += 1;
            }

            Array.Reverse(array);
            values.AddRange(array);
            return values;
        }
        
        private void ResetZoomOnClick(object sender, RoutedEventArgs e)
        {
            //Use the axis MinValue/MaxValue properties to specify the values to display.
            //use double.Nan to clear it.

            X.MinValue = double.NaN;
            X.MaxValue = double.NaN;
            Y.MinValue = double.NaN;
            Y.MaxValue = double.NaN;
        }

        // click
        private void GridBarTop_MouseDown(object sender, MouseButtonEventArgs e)
        {
            DragMove();
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private async void UpdateData_Click(object sender, RoutedEventArgs e)
        {

            ChartValues<DateTimePoint> _values = await GetData();

            // calc high point

            double VQ = 9.10; // VTI volatility, %
            int count = _values.Count;
            var array_high = new DateTimePoint[count];
            var array_mid_warning = new DateTimePoint[count];
            var array_low = new DateTimePoint[count];
            var high_point = _values[0].Value;
            array_high[0] = new DateTimePoint(_values[0].DateTime, high_point);
            array_mid_warning[0] = new DateTimePoint(_values[0].DateTime, high_point * (1 - VQ / 100 / 2));
            array_low[0] = new DateTimePoint(_values[0].DateTime, high_point * (1 - VQ / 100));
            for (var i=1; i <= count -1; i++)
            {
                if (_values[i].Value >= high_point)
                {
                    high_point = _values[i].Value;
                }
                else if (high_point * (1-VQ/100) >= _values[i].Value)  //   later time price is lower than the previous price ...  _values[i + 1].Value < _values[i].Value
                {
                    high_point = _values[i].Value;
                }
                array_high[i] = new DateTimePoint(_values[i].DateTime, high_point);
                array_mid_warning[i] = new DateTimePoint(_values[i].DateTime, high_point * (1 - VQ / 100 / 2));
                array_low[i] = new DateTimePoint(_values[i].DateTime, high_point *(1 - VQ / 100));
            }

            var values_high = new ChartValues<DateTimePoint>();
            var values_mid = new ChartValues<DateTimePoint>();
            var values_low = new ChartValues<DateTimePoint>();
            values_high.AddRange(array_high);
            values_mid.AddRange(array_mid_warning);
            values_low.AddRange(array_low);

            SeriesCollection = new SeriesCollection
            {

                new LineSeries
                {
                    Title = "Highest Price",
                    Values = values_high,
                    Fill = Brushes.Green,
                    Stroke = Brushes.Green,
                    LineSmoothness = 0,
                    StrokeThickness = 1,
                    PointGeometrySize = 0
                },
                new LineSeries
                {
                    Title = "Mid Price (Warning)",
                    Values = values_mid,
                    Fill = Brushes.Yellow,
                    Stroke = Brushes.Yellow,
                    LineSmoothness = 0,
                    StrokeThickness = 1,
                    PointGeometrySize = 0
                },

                new LineSeries
                {
                    Title = "Trailing Stop",
                    Values = values_low,
                    //Fill = Brushes.Red,
                    Stroke = Brushes.Red,
                    LineSmoothness = 0,
                    StrokeThickness = 1,
                    PointGeometrySize = 0
                },
                new LineSeries
                {
                    Title = "close price",
                    Values = _values,
                    //Fill = Brushes.Yellow,
                    Stroke = Brushes.White,
                    LineSmoothness = 0,
                    StrokeThickness = 3,
                    PointGeometrySize = 0,
                },
            };

            ZoomingMode = ZoomingOptions.X;

            XFormatter = val => new DateTime((long)val).ToString("yy-MM-dd");
            YFormatter = val => val.ToString("C");

            DataContext = this;
        }
    }

    public class ZoomingModeCoverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            switch ((ZoomingOptions)value)
            {
                case ZoomingOptions.None:
                    return "None";
                case ZoomingOptions.X:
                    return "X";
                case ZoomingOptions.Y:
                    return "Y";
                case ZoomingOptions.Xy:
                    return "XY";
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }

}
