using AndevisTest.Infrastructure;
using AndevisTest.Model;
using System;
using System.Collections.ObjectModel;
using System.Windows;

namespace AndevisTest.ViewModel
{
    public sealed class EmployeesViewModel
    {
        private EntitiesDataContext _context;


        public ObservableCollection<Personal> Employees { get; set; }
        public ObservableCollection<Sugu> Genders { get; set; }
        public ObservableCollection<TimeUnit> TimeUnits { get; set; }

        private RelayCommand _saveRowCommand;
        public RelayCommand SaveRowCommand
        {
            get => _saveRowCommand ?? (_saveRowCommand = new RelayCommand(obj =>
            {
                if (obj is Personal employee)
                {
                    try
                    {
                        if (employee.Id.Equals(0))
                        {
                            _context.Personals.InsertOnSubmit(employee);
                        }
                        _context.SubmitChanges();
                        Employees.Add(new Personal());
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
                if (obj is Personal employee && !employee.Id.Equals(0))
                {
                    if (employee.Tooaegs.Count > 0)
                    {
                        var answer = MessageBox.Show($"Для данного сотрудника имеются связанные данные.{Environment.NewLine}" +
                            "Удалить информацию о сотруднике и о связанных данных?",
                            "Предупреждение", MessageBoxButton.YesNo);
                        if (answer == MessageBoxResult.Yes)
                        {
                            _context.Tooaegs.DeleteAllOnSubmit(employee.Tooaegs);
                            _context.PersonalKeeleds.DeleteAllOnSubmit(employee.PersonalKeeleds);
                        }
                        else
                        {
                            return;
                        }
                    }
                    _context.Personals.DeleteOnSubmit(employee);
                    Employees.Remove(employee);
                    _context.SubmitChanges();
                }
            }));
        }

        public EmployeesViewModel(EntitiesDataContext context)
        {
            _context = context;
            Employees = new ObservableCollection<Personal>(_context.Personals);
            Genders = new ObservableCollection<Sugu>(_context.Sugus);
            TimeUnits = new ObservableCollection<TimeUnit>(_context.TimeUnits);
        }
    }
}
