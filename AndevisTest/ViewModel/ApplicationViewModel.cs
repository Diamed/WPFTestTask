using AndevisTest.Infrastructure;
using AndevisTest.Model;
using AndevisTest.Windows;
using AndevisTest.Windows.Dictionaries;
using AndevisTest.Windows.Reports;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows;

namespace AndevisTest.ViewModel
{
    public sealed class ApplicationViewModel : INotifyPropertyChanged
    {
        private EntitiesDataContext _context;
        private EntitiesDataContext Context
        {
            get => _context ?? (_context = IsConnectionStringFilled() ? new EntitiesDataContext(ConnectionString) : null);
        }


        private string _connectionString;
        public string ConnectionString
        {
            get => _connectionString;
            set
            {
                _connectionString = value;
                OnPropertyChanged(nameof(ConnectionString));
            }
        }

        private RelayCommand _saveConnectionString;
        public RelayCommand SaveConnectionString
        {
            get => _saveConnectionString ?? (_saveConnectionString = new RelayCommand(obj =>
            {
                if (string.IsNullOrWhiteSpace(ConnectionString))
                {
                    MessageBox.Show("Пожалуйста задайте строку подключения");
                }
                else
                {
                    _context = new EntitiesDataContext(ConnectionString);
                }
            }));
        }
        private RelayCommand _exitCommand;
        public RelayCommand ExitCommand
        {
            get => _exitCommand ?? (_exitCommand = new RelayCommand(obj => Application.Current.Shutdown()));
        }

        private RelayCommand _showReportEmployeesInfo;
        public RelayCommand ShowReportEmployeesInfo
        {
            get => _showReportEmployeesInfo ??
                (_showReportEmployeesInfo = new RelayCommand(obj => new EmployeesInfo(Context).Show()));
        }

        private RelayCommand _showReportEmployeesSalaries;
        public RelayCommand ShowReportEmployeesSalaries
        {
            get => _showReportEmployeesSalaries ??
                (_showReportEmployeesSalaries = new RelayCommand(obj => new EmployeesSalaries(Context).Show()));
        }

        private RelayCommand _showEmployees;
        public RelayCommand ShowEmployees
        {
            get => _showEmployees ??
                (_showEmployees = new RelayCommand(obj => new Employees(Context).Show()));
        }

        private RelayCommand _showEmployeesLanguages;
        public RelayCommand ShowEmployeesLanguages
        {
            get => _showEmployeesLanguages ??
                (_showEmployeesLanguages = new RelayCommand(obj => new EmployeesLanguages(Context).Show()));
        }

        private RelayCommand _showEmployeesWorkedTime;
        public RelayCommand ShowEmployeesWorkedTime
        {
            get => _showEmployeesWorkedTime ??
                (_showEmployeesWorkedTime = new RelayCommand(obj => new EmployeesWorkedTime(Context).Show()));
        }

        private RelayCommand _showGenders;
        public RelayCommand ShowGenders
        {
            get => _showGenders ??
                (_showGenders = new RelayCommand(obj => new Genders(Context).Show()));
        }

        private RelayCommand _showLanguageLevels;
        public RelayCommand ShowLanguageLevels
        {
            get => _showLanguageLevels ??
                (_showLanguageLevels = new RelayCommand(obj => new LanguageLevels(Context).Show()));
        }

        private RelayCommand _showLanguageLevelSupplements;
        public RelayCommand ShowLanguageLevelSupplements
        {
            get => _showLanguageLevelSupplements ??
                (_showLanguageLevelSupplements = new RelayCommand(obj => new LanguageLevelSupplements(Context).Show()));
        }

        private RelayCommand _showLanguages;
        public RelayCommand ShowLanguages
        {
            get => _showLanguages ??
                (_showLanguages = new RelayCommand(obj => new Languages(Context).Show()));
        }

        private RelayCommand _showTimeUnits;
        public RelayCommand ShowTimeUnits
        {
            get => _showTimeUnits ??
                (_showTimeUnits = new RelayCommand(obj => new TimeUnits(Context).Show()));
        }

        private RelayCommand _showAbout;
        public RelayCommand ShowAbout
        {
            get => _showAbout ??
                (_showAbout = new RelayCommand(obj => new About().Show()));
        }

        private bool IsConnectionStringFilled()
        {
            if (string.IsNullOrWhiteSpace(ConnectionString))
            {
                throw new System.Exception("Пожалуйста задайте строку подключения");
            }
            return true;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
        }
    }
}
