using AndevisTest.Model;
using AndevisTest.ViewModel;
using System.Windows;

namespace AndevisTest.Windows.Dictionaries
{
    /// <summary>
    /// Interaction logic for Languages.xaml
    /// </summary>
    public partial class Languages : Window
    {
        public Languages(EntitiesDataContext context)
        {
            InitializeComponent();
            DataContext = new LanguagesViewModel(context);
        }
    }
}
