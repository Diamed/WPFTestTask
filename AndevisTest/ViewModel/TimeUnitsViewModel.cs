using AndevisTest.Infrastructure;
using AndevisTest.Model;
using System;
using System.Collections.ObjectModel;
using System.Windows;

namespace AndevisTest.ViewModel
{
    public sealed class TimeUnitsViewModel
    {
        private EntitiesDataContext _context;


        public ObservableCollection<TimeUnit> TimeUnits { get; set; }

        private RelayCommand _saveRowCommand;
        public RelayCommand SaveRowCommand
        {
            get => _saveRowCommand ?? (_saveRowCommand = new RelayCommand(obj =>
            {
                if (obj is TimeUnit timeUnit)
                {
                    try
                    {
                        if (timeUnit.Id.Equals(0))
                        {
                            _context.TimeUnits.InsertOnSubmit(timeUnit);
                        }
                        _context.SubmitChanges();
                        TimeUnits.Add(new TimeUnit());
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
                if (obj is TimeUnit timeUnit && !timeUnit.Id.Equals(0))
                {
                    if (timeUnit.Personals.Count > 0)
                    {
                        var answer = MessageBox.Show($"Для данной единицы измерения имеются связанные данные.{Environment.NewLine}" +
                            "Удалить информацию о единице измерения и о связанных данных?",
                            "Предупреждение", MessageBoxButton.YesNo);
                        if (answer == MessageBoxResult.Yes)
                        {
                            _context.Personals.DeleteAllOnSubmit(timeUnit.Personals);
                        }
                        else
                        {
                            return;
                        }
                    }
                    _context.TimeUnits.DeleteOnSubmit(timeUnit);
                    TimeUnits.Remove(timeUnit);
                    _context.SubmitChanges();
                }
            }));
        }

        public TimeUnitsViewModel(EntitiesDataContext context)
        {
            _context = context;
            TimeUnits = new ObservableCollection<TimeUnit>(_context.TimeUnits);
        }
    }
}
