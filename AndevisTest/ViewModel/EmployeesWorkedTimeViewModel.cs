using AndevisTest.Infrastructure;
using AndevisTest.Model;
using System.Collections.ObjectModel;
using System.Windows;

namespace AndevisTest.ViewModel
{
    public sealed class EmployeesWorkedTimeViewModel
    {
        private EntitiesDataContext _context;


        public ObservableCollection<Tooaeg> EmployeesWorkedTime { get; set; }
        public ObservableCollection<Personal> Employees { get; set; }

        private RelayCommand _saveRowCommand;
        public RelayCommand SaveRowCommand
        {
            get => _saveRowCommand ?? (_saveRowCommand = new RelayCommand(obj =>
            {
                if (obj is Tooaeg workedTime)
                {
                    try
                    {
                        if (workedTime.Id.Equals(0))
                        {
                            _context.Tooaegs.InsertOnSubmit(workedTime);
                        }
                        _context.SubmitChanges();
                        EmployeesWorkedTime.Add(new Tooaeg());
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
                if (obj is Tooaeg workedTime && !workedTime.Id.Equals(0))
                {
                    _context.Tooaegs.DeleteOnSubmit(workedTime);
                    EmployeesWorkedTime.Remove(workedTime);
                    _context.SubmitChanges();
                }
            }));
        }

        public EmployeesWorkedTimeViewModel(EntitiesDataContext context)
        {
            _context = context;
            EmployeesWorkedTime = new ObservableCollection<Tooaeg>(_context.Tooaegs);
            Employees = new ObservableCollection<Personal>(_context.Personals);
        }
    }
}
