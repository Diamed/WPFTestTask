using AndevisTest.Infrastructure;
using AndevisTest.Model;
using System;
using System.Collections.ObjectModel;
using System.Windows;

namespace AndevisTest.ViewModel
{
    public sealed class LanguageLevelsViewModel
    {
        private EntitiesDataContext _context;


        public ObservableCollection<Tase> LanguageLevels { get; set; }

        private RelayCommand _saveRowCommand;
        public RelayCommand SaveRowCommand
        {
            get => _saveRowCommand ?? (_saveRowCommand = new RelayCommand(obj =>
            {
                if (obj is Tase languageLevel)
                {
                    try
                    {
                        if (languageLevel.Id.Equals(0))
                        {
                            _context.Tases.InsertOnSubmit(languageLevel);
                            LanguageLevels.Add(new Tase());
                        }
                        _context.SubmitChanges();
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
                if (obj is Tase languageLevel && !languageLevel.Id.Equals(0))
                {
                    if (languageLevel.KeeleTasuds.Count > 0)
                    {
                        var answer = MessageBox.Show($"Для данной записи имеются связанные данные.{Environment.NewLine}" +
                            "Удалить информацию о записи и о связанных данных?",
                            "Предупреждение", MessageBoxButton.YesNo);
                        if (answer == MessageBoxResult.Yes)
                        {
                            _context.KeeleTasuds.DeleteAllOnSubmit(languageLevel.KeeleTasuds);
                            _context.PersonalKeeleds.DeleteAllOnSubmit(languageLevel.PersonalKeeleds);
                        }
                        else
                        {
                            return;
                        }
                    }
                    _context.Tases.DeleteOnSubmit(languageLevel);
                    LanguageLevels.Remove(languageLevel);
                    _context.SubmitChanges();

                }
            }));
        }

        public LanguageLevelsViewModel(EntitiesDataContext context)
        {
            _context = context;
            LanguageLevels = new ObservableCollection<Tase>(_context.Tases);
        }
    }
}
