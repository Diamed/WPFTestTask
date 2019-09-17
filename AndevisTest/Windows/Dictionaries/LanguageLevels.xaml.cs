using AndevisTest.Model;
using AndevisTest.ViewModel;
using System.Windows;

namespace AndevisTest.Windows.Dictionaries
{
    /// <summary>
    /// Interaction logic for LanguageLevels.xaml
    /// </summary>
    public partial class LanguageLevels : Window
    {
        public LanguageLevels(EntitiesDataContext context)
        {
            InitializeComponent();
            DataContext = new LanguageLevelsViewModel(context);
        }
    }
}
