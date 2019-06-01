using Dapper;
using HospedarApi.Interfaces;
using HospedarApi.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace HospedarApi.Repository
{
    public class HuespedRepository : IHuespedRepository
    {
        private readonly IConfiguration _config;

        public HuespedRepository(IConfiguration config)
        {
            _config = config;
        }
        public IDbConnection Connection
        {
            get
            {
                return new SqlConnection(_config.GetConnectionString("cn"));
            }
        }

        public async Task<List<Huesped>> Listar()
        {
            List<Huesped> lis = new List<Huesped>();
            IDbConnection conn = Connection;
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                lis = (await conn.QueryAsync<Huesped>("LISTAR_HUESPEDES", parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            catch (Exception e)
            {
                var rpta = "Excepción encontrada: " + e.Message;
                lis = null;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return lis;
        }
    }
}
