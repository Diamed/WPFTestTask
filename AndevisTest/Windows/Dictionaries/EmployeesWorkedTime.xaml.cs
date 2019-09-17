using AndevisTest.Model;
using AndevisTest.ViewModel;
using System.Windows;

namespace AndevisTest.Windows.Dictionaries
{
    /// <summary>
    /// Interaction logic for EmployeesWorkedTime.xaml
    /// </summary>
    public partial class EmployeesWorkedTime : Window
    {
        public EmployeesWorkedTime(EntitiesDataContext context)
        {
            InitializeComponent();
            DataContext = new EmployeesWorkedTimeViewModel(context);
        }
    }
}
