using AndevisTest.Infrastructure;
using AndevisTest.Model;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace AndevisTest.ViewModel
{
    public sealed class EmployeesSalariesViewModel : INotifyPropertyChanged
    {
        private EntitiesDataContext _context;

        public ObservableCollection<GetSalariesInfoResult> Employees { get; set; }

        private sbyte? _month;
        public sbyte? Month
        {
            get => _month;
            set
            {
                _month = value;
                OnPropertyChanged(nameof(Month));
            }
        }

        private ushort? _year;
        public ushort? Year
        {
            get => _year;
            set
            {
                _year = value;
                OnPropertyChanged(nameof(Year));
            }
        }

        private int? _employeeId;
        public int? EmployeeId
        {
            get => _employeeId;
            set
            {
                _employeeId = value;
                OnPropertyChanged(nameof(EmployeeId));
            }
        }

        private RelayCommand _fillCommand;
        public RelayCommand FillCommand
        {
            get => _fillCommand ?? (_fillCommand = new RelayCommand(obj =>
                {
                    Employees.Clear();
                    foreach (var employee in _context.GetSalariesInfo(Month, Year, EmployeeId))
                    {
                        Employees.Add(employee);
                    }
                }));
        }

        public EmployeesSalariesViewModel(EntitiesDataContext context)
        {
            _context = context;
            Employees = new ObservableCollection<GetSalariesInfoResult>();
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
        }
    }
}
