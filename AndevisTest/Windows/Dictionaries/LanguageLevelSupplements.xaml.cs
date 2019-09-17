using AndevisTest.Model;
using AndevisTest.ViewModel;
using System.Windows;

namespace AndevisTest.Windows.Dictionaries
{
    /// <summary>
    /// Interaction logic for LanguageLevelSupplements.xaml
    /// </summary>
    public partial class LanguageLevelSupplements : Window
    {
        public LanguageLevelSupplements(EntitiesDataContext context)
        {
            InitializeComponent();
            DataContext = new LanguageLevelSupplementsViewModel(context);
        }
    }
}
