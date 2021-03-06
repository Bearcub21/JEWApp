﻿using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace JEWApp
{
    public class Database
    {
        private static ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["Prod1"];
        private string connectionString = settings.ConnectionString;
        private SqlConnection db;

        public Database()
        {
            db = new SqlConnection(connectionString);
        }

        public SqlConnection getDbConnection()
        {
            return db;
        }

        public void conectar()
        {
            db.Open();
        }

        public void desconectar()
        {
            db.Close();
        }

        public DataTable consultaStringDT(string sql)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, db);

            da.Fill(dt);
            return dt;
        }

        public string consultaStringScalar(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql, db);

            conectar();
            string result = Convert.ToString(cmd.ExecuteScalar());
            desconectar();

            return result;
        }
    }
}
