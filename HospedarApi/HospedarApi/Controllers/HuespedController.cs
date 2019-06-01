using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospedarApi.Interfaces;
using HospedarApi.Models;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HospedarApi.Controllers
{
    [Route("api/[controller]")]
    [EnableCors("Politica")]
    [ApiController]
    public class HuespedController : ControllerBase
    {
        private readonly IHuespedRepository _huespedRepo;

        public HuespedController(IHuespedRepository personaRepo)
        {
            _huespedRepo = personaRepo;
        }

        // GET: api/Huesped
        [HttpGet]
        public async Task<ActionResult<List<Huesped>>> Get()
        {
            return await _huespedRepo.Listar();
        }


        // GET: api/Huesped/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Huesped
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Huesped/5
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
