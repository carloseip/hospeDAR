using HospedarApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HospedarApi.Interfaces
{
    public interface IComodidadRepository
    {
        Task<List<Comodidad>> Listar();

        string Ingresar(Comodidad comodidad);
    }
}
