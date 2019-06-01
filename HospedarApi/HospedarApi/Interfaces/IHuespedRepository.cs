using HospedarApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HospedarApi.Interfaces
{
    interface IHuespedRepository
    {
        Task<List<Huesped>> Listar();
    }
}
