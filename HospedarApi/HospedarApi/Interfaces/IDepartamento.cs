using HospedarApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HospedarApi.Interfaces
{
    public interface IDepartamento
    {
        Task<List<Departamento>> Listar();

        string Ingresar(Departamento departamento);
    }
}
