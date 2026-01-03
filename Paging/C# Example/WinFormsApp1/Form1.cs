using System.Data;
using System.Diagnostics;
namespace WinFormsApp1
{
    public partial class Form1 : Form
    {
        int CurrentDataPage = 0;
        int LastIdInLastPage = 1;

        public Form1()
        {
            InitializeComponent();

            for (int i = 0; i < 500; i++)
            {
                LoadData();
                CurrentDataPage += 1;
            }

        }
        private DataTable? FetchData()
        {
            return WinFormsApp1.DataAccess.GetAllCars(CurrentDataPage, 500, LastIdInLastPage);
        }
        private void LoadData()
        {
            Stopwatch watch = Stopwatch.StartNew();
            DataTable? Cars = FetchData();
            if (Cars != null && Cars.Rows.Count>0)
            {
                this.CarsDataGrid.AutoGenerateColumns = true;
                this.CarsDataGrid.DataSource = Cars;
                this.LastIdInLastPage = Convert.ToInt32(Cars.Rows[Cars.Rows.Count - 1][0]);
            }
            watch.Stop();
            File.AppendAllText("Log.txt","Page number "+ CurrentDataPage.ToString() + ": "+watch.ElapsedMilliseconds+"Ms\n");
        }

        private void Next_Click(object sender, EventArgs e)
        {
            CurrentDataPage += 1;
            LoadData();
        }

        private void Previous_Click(object sender, EventArgs e)
        {
            if(CurrentDataPage!=0)
            {
                CurrentDataPage -= 1;
                LoadData();
            }
        }
    }
}
