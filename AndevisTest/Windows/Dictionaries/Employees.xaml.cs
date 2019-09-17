using AndevisTest.Model;
using AndevisTest.ViewModel;
using System.Windows;

namespace AndevisTest.Windows.Dictionaries
{
    /// <summary>
    /// Interaction logic for Employees.xaml
    /// </summary>
    public partial class Employees : Window
    {
        public Employees(EntitiesDataContext context)
        {
            InitializeComponent();
            DataContext = new EmployeesViewModel(context);
        }
    }
}
