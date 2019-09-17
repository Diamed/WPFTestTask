using AndevisTest.Model;
using AndevisTest.ViewModel;
using System.Windows;

namespace AndevisTest.Windows.Dictionaries
{
    /// <summary>
    /// Interaction logic for TimeUnits.xaml
    /// </summary>
    public partial class TimeUnits : Window
    {
        public TimeUnits(EntitiesDataContext context)
        {
            InitializeComponent();
            DataContext = new TimeUnitsViewModel(context);
        }
    }
}
