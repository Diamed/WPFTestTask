using AndevisTest.Infrastructure;
using AndevisTest.Model;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace AndevisTest.ViewModel
{
    public sealed class EmployeesInfoViewModel : INotifyPropertyChanged
    {
        private EntitiesDataContext _context;
        private const string NotSelectedValue = "Все";

        public ObservableCollection<GetEmployeesInfoResult> Employees { get; set; }
        public ObservableCollection<Keeled> Languages { get; set; }
        public ObservableCollection<Tase> LanguageLevels { get; set; }
        public ObservableCollection<Sugu> SexCollection { get; set; }


        private Keeled _selectedLanguage;
        public Keeled SelectedLanguage
        {
            get => _selectedLanguage;
            set
            {
                _selectedLanguage = value;
                OnPropertyChanged(nameof(SelectedLanguage));
            }
        }

        private Tase _selectedLanguageLevel;
        public Tase SelectedLanguageLevel
        {
            get => _selectedLanguageLevel;
            set
            {
                _selectedLanguageLevel = value;
                OnPropertyChanged(nameof(SelectedLanguageLevel));
            }
        }

        private Sugu _selectedSex;
        public Sugu SelectedSex
        {
            get => _selectedSex;
            set
            {
                _selectedSex = value;
                OnPropertyChanged(nameof(SelectedSex));
            }
        }

        private sbyte? _typedAgeFrom;
        public sbyte? TypedAgeFrom
        {
            get => _typedAgeFrom;
            set
            {
                _typedAgeFrom = value;
                OnPropertyChanged(nameof(TypedAgeFrom));
            }
        }

        private sbyte? _typedAgeTo;
        public sbyte? TypedAgeTo
        {
            get => _typedAgeTo;
            set
            {
                _typedAgeTo = value;
                OnPropertyChanged(nameof(TypedAgeTo));
            }
        }

        private RelayCommand _fillCommand;
        public RelayCommand FillCommand
        {
            get => _fillCommand ?? (_fillCommand = new RelayCommand(obj =>
                {
                    Employees.Clear();
                    foreach (var employee in _context.GetEmployeesInfo(GetFilterValue(SelectedLanguage.Keel),
                        GetFilterValue(SelectedLanguageLevel.Title), TypedAgeFrom, TypedAgeTo, GetFilterValue(SelectedSex.Title)))
                    {
                        Employees.Add(employee);
                    }
                }));
        }

        public EmployeesInfoViewModel(EntitiesDataContext context)
        {
            _context = context;
            Employees = new ObservableCollection<GetEmployeesInfoResult>();
            FillLanguages();
            FillLanguageLevels();
            FillSexCollection();
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
        }

        private string GetFilterValue(string input)
        {
            return input == NotSelectedValue ? null : input;
        }

        private void FillLanguages()
        {
            var zeroItem = new Keeled { Keel = NotSelectedValue };
            Languages = GetObservableCollection(_context.Keeleds, zeroItem);
            SelectedLanguage = zeroItem;
        }

        private void FillLanguageLevels()
        {
            var zeroItem = new Tase { Title = NotSelectedValue };
            LanguageLevels = GetObservableCollection(_context.Tases, zeroItem);
            SelectedLanguageLevel = zeroItem;
        }

        private void FillSexCollection()
        {
            var zeroItem = new Sugu { Title = NotSelectedValue };
            SexCollection = GetObservableCollection(_context.Sugus, zeroItem);
            SelectedSex = zeroItem;
        }

        private ObservableCollection<T> GetObservableCollection<T>(IEnumerable<T> items, T zeroItem)
        {
            var output = new ObservableCollection<T>(items);
            output.Insert(0, zeroItem);
            return output;
        }
    }
}
