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
    public class ComodidadRepository : IComodidadRepository
    {
        private readonly IConfiguration _config;

        public ComodidadRepository(IConfiguration config)
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

        public string Ingresar(Comodidad comodidad)
        {
            string rpta = "Like";
            IDbConnection conn = Connection;
            try
            {
                DynamicParameters dp = new DynamicParameters();
                dp.Add("@nombre", comodidad.nombre);
                conn.Execute("AGREGAR_COMODIDADES", dp, commandType: CommandType.StoredProcedure);
            }
            catch (Exception e)
            {
                rpta = "Excepción encontrada: " + e.Message;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return rpta;
        }

        public async Task<List<Comodidad>> Listar()
        {
            List<Comodidad> lis = new List<Comodidad>();
            IDbConnection conn = Connection;
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                lis = (await conn.QueryAsync<Comodidad>("LISTAR_COMODIDADES", parameters, commandType: CommandType.StoredProcedure)).ToList();
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
