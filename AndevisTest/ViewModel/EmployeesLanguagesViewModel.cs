using AndevisTest.Infrastructure;
using AndevisTest.Model;
using System.Collections.ObjectModel;
using System.Windows;

namespace AndevisTest.ViewModel
{
    public sealed class EmployeesLanguagesViewModel
    {
        private EntitiesDataContext _context;


        public ObservableCollection<PersonalKeeled> EmployeesLanguages { get; set; }
        public ObservableCollection<Personal> Employees { get; set; }
        public ObservableCollection<Keeled> Languages { get; set; }
        public ObservableCollection<Tase> LanguageLevels { get; set; }

        private RelayCommand _saveRowCommand;
        public RelayCommand SaveRowCommand
        {
            get => _saveRowCommand ?? (_saveRowCommand = new RelayCommand(obj =>
            {
                if (obj is PersonalKeeled employeeLanguage)
                {
                    try
                    {
                        if (employeeLanguage.Id.Equals(0))
                        {
                            _context.PersonalKeeleds.InsertOnSubmit(employeeLanguage);
                        }
                        _context.SubmitChanges();
                        EmployeesLanguages.Add(new PersonalKeeled());
                    }
                    catch
                    {
                        MessageBox.Show("Что-то пошло не так, попробуйте изменить данные и повторить попытку", "Ошибка");
                    }
                }
            }));
        }

        private RelayCommand _removeRowCommand;
        public RelayCommand RemoveRowCommand
        {
            get => _removeRowCommand ?? (_removeRowCommand = new RelayCommand(obj =>
            {
                if (obj is PersonalKeeled employeeLanguage && !employeeLanguage.Id.Equals(0))
                {
                    _context.PersonalKeeleds.DeleteOnSubmit(employeeLanguage);
                    EmployeesLanguages.Remove(employeeLanguage);
                    _context.SubmitChanges();
                }
            }));
        }

        public EmployeesLanguagesViewModel(EntitiesDataContext context)
        {
            _context = context;
            EmployeesLanguages = new ObservableCollection<PersonalKeeled>(_context.PersonalKeeleds);
            Employees = new ObservableCollection<Personal>(_context.Personals);
            Languages = new ObservableCollection<Keeled>(_context.Keeleds);
            LanguageLevels = new ObservableCollection<Tase>(_context.Tases);
        }
    }
}
