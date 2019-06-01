using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospedarApi.Interfaces;
using HospedarApi.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HospedarApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DepartamentoController : ControllerBase
    {
        private readonly IDepartamento _departamentoRepo;

        public DepartamentoController(IDepartamento departamentoRepo)
        {
            _departamentoRepo = departamentoRepo;
        }

        // GET: api/Departamento
        [HttpGet]
        public async Task<ActionResult<List<Departamento>>> Get()
        {
            return await _departamentoRepo.Listar();
        }

        // GET: api/Departamento/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Departamento
        [HttpPost]
        public string Post([FromBody]Departamento departamento)
        {
            if (ModelState.IsValid)
            {
                return _departamentoRepo.Ingresar(departamento);
            }
            return "Error";
        }

        // PUT: api/Departamento/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
