using AndevisTest.Model;
using AndevisTest.ViewModel;
using System;
using System.Text;
using System.Windows;

namespace AndevisTest
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            InitializeComponent();
            Application.Current.DispatcherUnhandledException += Current_DispatcherUnhandledException;
            DataContext = new ApplicationViewModel();
        }

        private void Current_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
        {
            const string caption = "Что-то пошло не так...";
            StringBuilder output = new StringBuilder(255);
            if (e?.Exception is Exception exception)
            {
                output.AppendLine(exception.Message);
            }
            MessageBox.Show(output.ToString(), caption);
            e.Handled = true;
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}
