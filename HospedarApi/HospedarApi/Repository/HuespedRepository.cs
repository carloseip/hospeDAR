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

        public string Ingresar(Huesped huesped)
        {
            string rpta = "Like";
            IDbConnection conn = Connection;
            try
            {
                DynamicParameters dp = new DynamicParameters();
                dp.Add("@nombre", huesped.nombre);
                dp.Add("@departamento", huesped.departamento);
                dp.Add("@direccion", huesped.direccion);
                dp.Add("@edad", huesped.edad);
                dp.Add("@phone", huesped.phone);
                dp.Add("@descripcion", huesped.descripcion);
                dp.Add("@fecha_i", huesped.fecha_i);
                dp.Add("@fecha_f", huesped.fecha_f);
                dp.Add("@porque", huesped.porque);
                dp.Add("@valides", huesped.valides);
                conn.Execute("AGREGAR_HUESPED", dp, commandType: CommandType.StoredProcedure);
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

        public async Task<List<Huesped>> Listar()
        {
            List<Huesped> lis = new List<Huesped>();
            IDbConnection conn = Connection;
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                lis = (await conn.QueryAsync<Huesped>("LISTAR_USUARIOS", parameters, commandType: CommandType.StoredProcedure)).ToList();
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
