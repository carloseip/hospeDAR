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
    public class DepartamentoRepository : IDepartamento
    {
        private readonly IConfiguration _config;

        public DepartamentoRepository(IConfiguration config)
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
        public string Ingresar(Departamento departamento)
        {
            string rpta = "Like";
            IDbConnection conn = Connection;
            try
            {
                DynamicParameters dp = new DynamicParameters();
                dp.Add("@Nombre", departamento.nombre);
                conn.Execute("AGREGAR_DEPARTAMENTOS", dp, commandType: CommandType.StoredProcedure);
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

        public async Task<List<Departamento>> Listar()
        {
            List<Departamento> lis = new List<Departamento>();
            IDbConnection conn = Connection;
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                lis = (await conn.QueryAsync<Departamento>("LISTAR_DEPARTAMENTOS", parameters, commandType: CommandType.StoredProcedure)).ToList();
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
