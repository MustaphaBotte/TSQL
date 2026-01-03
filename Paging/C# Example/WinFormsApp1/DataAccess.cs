using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using System.Security.AccessControl;

namespace WinFormsApp1
{
    class DataAccess
    {
        public static string GetConnectionString()
        {
            return @"Server=.\MSSQLSERVER1;Database=Cars; User=sa;Password=123456;TrustServerCertificate=True;";
        }

        public static DataTable? GetAllCars(int PageNumber,int Rowsnumber,int LastIdInLastPage)
        {
            SqlConnection connection = new SqlConnection(GetConnectionString());
            using (SqlCommand command = new SqlCommand("FetchCars", connection))
            {
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter sqlPageNumberr = new SqlParameter("@PageNumber", PageNumber);
                SqlParameter sqlRowsnumber = new SqlParameter("@RowPerPage", Rowsnumber);
                SqlParameter sqlLastID = new SqlParameter("@LastIdInLastPage", LastIdInLastPage);


                sqlPageNumberr.DbType = DbType.Int32;
                sqlRowsnumber.DbType  = DbType.Int32;
                sqlLastID.DbType = DbType.Int32;


                command.Parameters.Add(sqlPageNumberr);
                command.Parameters.Add(sqlRowsnumber);
                command.Parameters.Add(sqlLastID);

                try
                {
                    connection.Open();
                    DataTable Data = new DataTable();
                    SqlDataReader reader =  command.ExecuteReader();
                    Data.Load(reader);
                    return Data;
                }
                catch
                {
                    return null;
                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }
}
