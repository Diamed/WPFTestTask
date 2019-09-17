using AndevisTest.Infrastructure;
using AndevisTest.Model;
using System;
using System.Collections.ObjectModel;
using System.Windows;

namespace AndevisTest.ViewModel
{
    public sealed class LanguagesViewModel
    {
        private EntitiesDataContext _context;


        public ObservableCollection<Keeled> Languages { get; set; }

        private RelayCommand _saveRowCommand;
        public RelayCommand SaveRowCommand
        {
            get => _saveRowCommand ?? (_saveRowCommand = new RelayCommand(obj =>
            {
                if (obj is Keeled keeled)
                {
                    try
                    {
                        if (keeled.Id.Equals(0))
                        {
                            _context.Keeleds.InsertOnSubmit(keeled);
                        }
                        _context.SubmitChanges();
                        Languages.Add(new Keeled());
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
                if (obj is Keeled keeled && !keeled.Id.Equals(0))
                {
                    if (keeled.PersonalKeeleds.Count > 0)
                    {
                        var answer = MessageBox.Show($"Для данного языка имеются связанные данные.{Environment.NewLine}" +
                            "Удалить информацию о языке и о связанных данных?",
                            "Предупреждение", MessageBoxButton.YesNo);
                        if (answer == MessageBoxResult.Yes)
                        {
                            _context.PersonalKeeleds.DeleteAllOnSubmit(keeled.PersonalKeeleds);
                        }
                        else
                        {
                            return;
                        }
                    }
                    _context.Keeleds.DeleteOnSubmit(keeled);
                    Languages.Remove(keeled);
                    _context.SubmitChanges();
                }
            }));
        }

        public LanguagesViewModel(EntitiesDataContext context)
        {
            _context = context;
            Languages = new ObservableCollection<Keeled>(_context.Keeleds);
        }
    }
}
