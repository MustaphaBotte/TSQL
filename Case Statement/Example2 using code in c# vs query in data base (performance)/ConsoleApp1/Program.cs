using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;


namespace ConsoleApp1
{
    class Program
    {
        private static DataTable DataTable = new DataTable();

        static List<int> HighEmployees = new List<int>();
        static List<int> MediumEmployees = new List<int>();
        static List<int> LowEmployees = new List<int>();
        private static DataTable FinalDataTable = new DataTable();
        
        public static string GetConnectionString()
        {
            return @"Server=.\MSSQLSERVER1;Database=C21_DB1; User=sa;Password=123456;TrustServerCertificate=True;";
        }
        public static void LoadData()
        {
            SqlCommand sqlCommand = new SqlCommand("select * from employees2", new SqlConnection(GetConnectionString()));
            try
            {
                sqlCommand.Connection.Open();
                DataTable.Load(sqlCommand.ExecuteReader());               
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        public static void PrintSpaces(int length)
        {
            for (int i = 0; i < length; i++)
            {
                Console.Write(" ");
            }
        }
        public static void PrintOriginalData()
        {

            foreach (DataRow row in DataTable.Rows)
            {
                Console.Write(row[0] + "\t");
                Console.Write(row[1]); PrintSpaces(9 - row[1].ToString().Length); Console.Write("\t");
                Console.Write(row[2] + "\t\t");
                Console.Write(row[3] + "\t");
                Console.Write(row[4] + "\t");
                Console.WriteLine();
            }
        }
        public static void AddPerformanceCategory()
        {
            DataColumn column =  DataTable.Columns.Add();
            column.ColumnName = "PerformanceCategory";
            for(int i=0;i<DataTable.Rows.Count;i++)
            {               
               if (int.TryParse(DataTable.Rows[i]["Performancerating"].ToString(), out int rate))
               {
                   if (rate >= 80)
                   {
                       DataTable.Rows[i]["PerformanceCategory"] = "High";
                       HighEmployees.Add(i);
                   }
                   else if (rate >= 60)
                   {
                       DataTable.Rows[i]["PerformanceCategory"] = "Medium";
                       MediumEmployees.Add(i);
                   }
                   else
                   {
                       DataTable.Rows[i]["PerformanceCategory"] = "Low";
                       LowEmployees.Add(i);
                   }
               }
               else
               { DataTable.Rows[i]["PerformanceCategory"] = "Low"; 
               }              
            }
        }

        public static int GetAverage(List<int> employees)
        {
            int sum = 0;
            foreach(int index in employees)
            {
                sum += Convert.ToInt32(DataTable.Rows[index]["Salary"]);
            }
            return employees.Count==0?0:sum / employees.Count;
        }
        public static void GenerateFinalReport()
        {
            FinalDataTable.Columns.Add("NumberOfEmployees");
            FinalDataTable.Columns.Add("AvgSalary");
            FinalDataTable.Columns.Add("PerformanceCategory");

            if(HighEmployees.Count>0)
              FinalDataTable.Rows.Add(new object[]{HighEmployees.Count,"High", GetAverage(HighEmployees)});
            if (MediumEmployees.Count > 0)
                FinalDataTable.Rows.Add(new object[] { MediumEmployees.Count, "Medium", GetAverage(MediumEmployees) });
            if (LowEmployees.Count > 0)
               FinalDataTable.Rows.Add(new object[] { LowEmployees.Count, "High", GetAverage(LowEmployees) });
            
        }
        public static void PrintFinalReport()
        {
            foreach (DataRow row in FinalDataTable.Rows)
            {
                Console.Write(row[0] + "\t");
                Console.Write(row[1]); PrintSpaces(9 - row[1].ToString().Length); Console.Write("\t");
                Console.Write(row[2] + "\t\t");
                Console.WriteLine();
            }
        }

        public static void SqlQuery()
        {
            SqlCommand sqlCommand = new SqlCommand("select count(*)As NumberOfEmployees,PerformanceCategory,TotalSalaries=Avg(Salary) from(select *,\r\n\r\nPerformanceCategory = case\r\nwhen PerformanceRating>=80 then 'High'\r\nwhen PerformanceRating>=60 then 'Medium'\r\nelse 'Low' end \r\nfrom Employees2)A\r\ngroup by A.PerformanceCategory", new SqlConnection(GetConnectionString()));
            try
            {
                sqlCommand.Connection.Open();
                FinalDataTable.Clear();
                FinalDataTable.Columns.Clear();
                FinalDataTable.Load(sqlCommand.ExecuteReader());
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        static void Main(string[] args)
        {
            PrintOriginalData(); // not included in the stopwatch because not required

            Stopwatch stopwatch = Stopwatch.StartNew();
            LoadData();
            AddPerformanceCategory();
            Console.WriteLine("************************* Using C# **************************************");
            GenerateFinalReport();
            PrintFinalReport();
            stopwatch.Stop();
            Console.WriteLine(stopwatch.ElapsedMilliseconds+"MS");
            Console.WriteLine("*************************************************************************");
            //  now all that code will be replaced with one sql query
            stopwatch.Restart();
            SqlQuery();
            PrintFinalReport();
            stopwatch.Stop();
            Console.WriteLine(stopwatch.ElapsedMilliseconds + "MS");
            Console.WriteLine("************************ Using SQL Query ********************************");
        }
    }
}
