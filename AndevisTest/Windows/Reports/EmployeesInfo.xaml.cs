using AndevisTest.Model;
using AndevisTest.ViewModel;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Input;

namespace AndevisTest.Windows.Reports
{
    /// <summary>
    /// Interaction logic for EmployeesInfo.xaml
    /// </summary>
    public partial class EmployeesInfo : Window
    {
        public EmployeesInfo(EntitiesDataContext context)
        {
            InitializeComponent();
            DataContext = new EmployeesInfoViewModel(context);
        }

        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }
    }
}
