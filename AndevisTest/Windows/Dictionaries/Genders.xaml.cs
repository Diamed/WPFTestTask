using AndevisTest.Model;
using AndevisTest.ViewModel;
using System.Windows;

namespace AndevisTest.Windows.Dictionaries
{
    /// <summary>
    /// Interaction logic for Genders.xaml
    /// </summary>
    public partial class Genders : Window
    {
        public Genders(EntitiesDataContext context)
        {
            InitializeComponent();
            DataContext = new GendersViewModel(context);
        }
    }
}
