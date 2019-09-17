using AndevisTest.Model;
using AndevisTest.ViewModel;
using System.Windows;

namespace AndevisTest.Windows.Dictionaries
{
    /// <summary>
    /// Interaction logic for EmployeesLanguages.xaml
    /// </summary>
    public partial class EmployeesLanguages : Window
    {
        public EmployeesLanguages(EntitiesDataContext context)
        {
            InitializeComponent();
            DataContext = new EmployeesLanguagesViewModel(context);
        }
    }
}
