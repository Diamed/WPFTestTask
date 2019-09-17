using AndevisTest.Infrastructure;
using AndevisTest.Model;
using System.Collections.ObjectModel;
using System.Windows;

namespace AndevisTest.ViewModel
{
    public sealed class LanguageLevelSupplementsViewModel
    {
        private readonly EntitiesDataContext _context;


        public ObservableCollection<KeeleTasud> LanguageLevelSupplements { get; set; }
        public ObservableCollection<Tase> LanguageLevels { get; set; }

        private RelayCommand _saveRowCommand;
        public RelayCommand SaveRowCommand
        {
            get => _saveRowCommand ?? (_saveRowCommand = new RelayCommand(obj =>
            {
                if (obj is KeeleTasud languageLevelSupplement)
                {
                    try
                    {
                        if (languageLevelSupplement.Id.Equals(0))
                        {
                            _context.KeeleTasuds.InsertOnSubmit(languageLevelSupplement);
                        }
                        _context.SubmitChanges();
                        LanguageLevelSupplements.Add(new KeeleTasud());
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
                if (obj is KeeleTasud languageLevelSupplement && !languageLevelSupplement.Id.Equals(0))
                {
                    _context.KeeleTasuds.DeleteOnSubmit(languageLevelSupplement);
                    LanguageLevelSupplements.Remove(languageLevelSupplement);
                    _context.SubmitChanges();
                }
            }));
        }

        public LanguageLevelSupplementsViewModel(EntitiesDataContext context)
        {
            _context = context;
            LanguageLevelSupplements = new ObservableCollection<KeeleTasud>(_context.KeeleTasuds);
            LanguageLevels = new ObservableCollection<Tase>(_context.Tases);
        }
    }
}
