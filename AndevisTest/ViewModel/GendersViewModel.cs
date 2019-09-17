using AndevisTest.Infrastructure;
using AndevisTest.Model;
using System;
using System.Collections.ObjectModel;
using System.Windows;

namespace AndevisTest.ViewModel
{
    public sealed class GendersViewModel
    {
        private EntitiesDataContext _context;


        public ObservableCollection<Sugu> Genders { get; set; }

        private RelayCommand _saveRowCommand;
        public RelayCommand SaveRowCommand
        {
            get => _saveRowCommand ?? (_saveRowCommand = new RelayCommand(obj =>
            {
                if (obj is Sugu gender)
                {
                    try
                    {
                        if (gender.Id.Equals(0))
                        {
                            _context.Sugus.InsertOnSubmit(gender);
                        }
                        _context.SubmitChanges();
                        Genders.Add(new Sugu());
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
                if (obj is Sugu gender && !gender.Id.Equals(0))
                {
                    if (gender.Personals.Count > 0)
                    {
                        var answer = MessageBox.Show($"Для данной записи имеются связанные данные.{Environment.NewLine}" +
                            "Удалить информацию о записи и о связанных данных?",
                            "Предупреждение", MessageBoxButton.YesNo);
                        if (answer == MessageBoxResult.Yes)
                        {
                            _context.Personals.DeleteAllOnSubmit(gender.Personals);
                        }
                        else
                        {
                            return;
                        }
                    }
                    _context.Sugus.DeleteOnSubmit(gender);
                    Genders.Remove(gender);
                    _context.SubmitChanges();

                }
            }));
        }

        public GendersViewModel(EntitiesDataContext context)
        {
            _context = context;
            Genders = new ObservableCollection<Sugu>(_context.Sugus);
        }
    }
}
