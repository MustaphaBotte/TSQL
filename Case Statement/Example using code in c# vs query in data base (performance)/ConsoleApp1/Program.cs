
using Microsoft.Data.SqlClient;
using System.Data;
using System.Diagnostics;

namespace ConsoleApp1
{
    public class ClsBonusByPerformance
    {
        private static DataTable DataTable = new DataTable();
        public static string GetConnectionString()
        {
            return @"Server=.\MSSQLSERVER1;Database=C21_DB1; User=sa;Password=123456;TrustServerCertificate=True;";
        }
        public static void PrintSpaces(int length)
        {
            for (int i = 0; i < length; i++)
            {
                Console.Write(" ");
            }
        }
        public static void Print()
        {

            foreach (DataRow row in DataTable.Rows)
            {
                Console.Write(row[0] + "\t");
                Console.Write(row[1]); PrintSpaces(9 - row[1].ToString().Length); Console.Write("\t");
                Console.Write(row[2] + "\t\t");
                Console.Write(row[3] + "\t");
                Console.WriteLine();
            }
        }
        public static void AddBonus()
        {
         
            SqlCommand sqlCommand = new SqlCommand("", new SqlConnection(GetConnectionString()));
            try
            {
                sqlCommand.Connection.Open();
                sqlCommand.CommandText = $"update employees2 set salary = @Salary where Name =@Name";
                sqlCommand.Parameters.AddWithValue("@Salary", 0);
                sqlCommand.Parameters.AddWithValue("@Name", "");

                foreach (DataRow row in DataTable.Rows)
                {
                    int Perfommance = int.Parse(row[3]?.ToString() ?? "");
                    double CurrentSalary = int.Parse(row[2]?.ToString() ?? "");

                    if (Perfommance > 90)
                    {
                        CurrentSalary = CurrentSalary * 1.15;
                    }
                    else if (Perfommance >= 75 && Perfommance <= 90)
                    {
                        CurrentSalary = CurrentSalary * 1.10;
                    }
                    else if (Perfommance >= 50 && Perfommance < 75)
                    {
                        CurrentSalary = CurrentSalary * 1.05;
                    }
                    sqlCommand.Parameters[0].Value = CurrentSalary;
                    sqlCommand.Parameters[1].Value = row[0];
                    sqlCommand.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        public static void LoadData()
        {
            SqlCommand sqlCommand = new SqlCommand("select * from employees2", new SqlConnection(GetConnectionString()));
            try
            {
                sqlCommand.Connection.Open();
                DataTable.Load(sqlCommand.ExecuteReader());
                Print();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        public static void FasterBonusManager()
        {
            string CommandText = "update employees2 set salary =" +
                "case when Salary>90 then Salary*1.15 " +
                 " when Salary  between 75 and 90 then salary*1.10" +
                 " when Salary  between 50 and 74 then salary*1.05" +
                 " else Salary end;";


            SqlCommand sqlCommand = new SqlCommand(CommandText, new SqlConnection(GetConnectionString()));
            try
            {
                sqlCommand.Connection.Open();
                sqlCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
    public class ClsBonusByPerformanceAndDepertment
    {
        private static DataTable DataTable = new DataTable();
        public static string GetConnectionString()
        {
            return @"Server=.\MSSQLSERVER1;Database=C21_DB1; User=sa;Password=123456;TrustServerCertificate=True;";
        }
        public static void PrintSpaces(int length)
        {
            for (int i = 0; i < length; i++)
            {
                Console.Write(" ");
            }
        }
        public static void Print()
        {

            foreach (DataRow row in DataTable.Rows)
            {
                Console.Write(row[0] + "\t");
                Console.Write(row[1]); PrintSpaces(9 - row[1].ToString().Length); Console.Write("\t");
                Console.Write(row[2] + "\t\t");
                Console.Write(row[3] + "\t");
                Console.WriteLine();
            }
        }

        private static double GetBonus(string dep,int Perfommance, double CurrentSalary)
        {
            if (dep == "HR")
            {
                if (Perfommance > 90)
                {
                    CurrentSalary = CurrentSalary * 1.15;
                }
                else if (Perfommance >= 75 && Perfommance <= 90)
                {
                    CurrentSalary = CurrentSalary * 1.10;
                }
                else if (Perfommance >= 50 && Perfommance < 75)
                {
                    CurrentSalary = CurrentSalary * 1.05;
                }
            }
            else if (dep == "IT")
            {
                if (Perfommance > 90)
                {
                    CurrentSalary = CurrentSalary * 1.10;
                }
                else if (Perfommance >= 75 && Perfommance <= 90)
                {
                    CurrentSalary = CurrentSalary * 1.08;
                }
                else if (Perfommance >= 50 && Perfommance < 75)
                {
                    CurrentSalary = CurrentSalary * 1.04;
                }
            }
            else
            {
                if (Perfommance > 90)
                {
                    CurrentSalary = CurrentSalary * 1.07;
                }
                else if (Perfommance >= 75 && Perfommance <= 90)
                {
                    CurrentSalary = CurrentSalary * 1.04;
                }
                else if (Perfommance >= 50 && Perfommance < 75)
                {
                    CurrentSalary = CurrentSalary * 1.03;
                }
            }
            return CurrentSalary;
        }
        public static void AddBonus()
        {
            SqlCommand sqlCommand = new SqlCommand("", new SqlConnection(GetConnectionString()));
            try
            {
                sqlCommand.Connection.Open();
                sqlCommand.CommandText = $"update employees2 set salary = @Salary where Name =@Name";
                sqlCommand.Parameters.AddWithValue("@Salary", 0);
                sqlCommand.Parameters.AddWithValue("@Name", "");

                foreach (DataRow row in DataTable.Rows)
                {
                    int Perfommance = int.Parse(row[3]?.ToString() ?? "");
                    double CurrentSalary = int.Parse(row[2]?.ToString() ?? "");
                    string?  Department = Convert.ToString(row[1]);
                 
                    sqlCommand.Parameters[0].Value = GetBonus(Department,Perfommance,CurrentSalary);
                    sqlCommand.Parameters[1].Value = row[0];
                    sqlCommand.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        public static void LoadData()
        {
            SqlCommand sqlCommand = new SqlCommand("select * from employees2", new SqlConnection(GetConnectionString()));
            try
            {
                sqlCommand.Connection.Open();
                DataTable.Load(sqlCommand.ExecuteReader());
                Print();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        public static void FasterBonusManager()
        {
            string CommandText = @"
                                   UPDATE employees2 
                                   SET salary = 
                                   CASE   
                                       WHEN Department = 'HR' THEN
                                           CASE 
                                               WHEN Salary > 90 THEN Salary * 1.15  
                                               WHEN Salary BETWEEN 75 AND 90 THEN Salary * 1.10 
                                               WHEN Salary BETWEEN 50 AND 74 THEN Salary * 1.05
                                               ELSE Salary
                                           END
                                       WHEN Department = 'IT' THEN
                                           CASE 
                                               WHEN Salary > 90 THEN Salary * 1.10  
                                               WHEN Salary BETWEEN 75 AND 90 THEN Salary * 1.08 
                                               WHEN Salary BETWEEN 50 AND 74 THEN Salary * 1.04
                                               ELSE Salary
                                           END
                                       ELSE
                                           CASE 
                                               WHEN Salary > 90 THEN Salary * 1.07  
                                               WHEN Salary BETWEEN 75 AND 90 THEN Salary * 1.04 
                                               WHEN Salary BETWEEN 50 AND 74 THEN Salary * 1.02
                                               ELSE Salary
                                           END
                                   END;
                                   ";
                                   

            SqlCommand sqlCommand = new SqlCommand(CommandText, new SqlConnection(GetConnectionString()));
            try
            {
                sqlCommand.Connection.Open();
                sqlCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
    internal class Program
    {       
        static void Main(string[] args)
        {
            // by performance
            //Stopwatch stopwatch1 = Stopwatch.StartNew();
            //ClsBonusByPerformance.LoadData();
            //ClsBonusByPerformance.AddBonus();
            //stopwatch1.Stop();
            //Console.WriteLine("Updating rows in c# program takes " + stopwatch1.ElapsedMilliseconds + "Ms");

            //stopwatch1.Reset();
            //stopwatch1.Start();
            //ClsBonusByPerformance.FasterBonusManager();
            //stopwatch1.Stop();
            //Console.WriteLine("Updating rows in database directly takes " + stopwatch1.ElapsedMilliseconds + "Ms");


            //by performance and department
            Stopwatch stopwatch = Stopwatch.StartNew();
            ClsBonusByPerformanceAndDepertment.LoadData();
            ClsBonusByPerformanceAndDepertment.AddBonus();
            stopwatch.Stop();
            Console.WriteLine("Updating rows in c# program takes " + stopwatch.ElapsedMilliseconds + "Ms");

            stopwatch.Reset();
            stopwatch.Start();
            ClsBonusByPerformanceAndDepertment.FasterBonusManager();
            stopwatch.Stop();
            Console.WriteLine("Updating rows in database directly takes " + stopwatch.ElapsedMilliseconds + "Ms");
        }
    }
}
