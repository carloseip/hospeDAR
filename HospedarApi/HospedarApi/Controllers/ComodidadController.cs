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
    public class ComodidadController : ControllerBase
    {
        private readonly IComodidadRepository _comodidadRepo;

        public ComodidadController(IComodidadRepository comodidadRepo)
        {
            _comodidadRepo = comodidadRepo;
        }

        // GET: api/Comodidad
        [HttpGet]
        public async Task<ActionResult<List<Comodidad>>> Get()
        {
            return await _comodidadRepo.Listar();
        }
        
        //// GET: api/Comodidad/5
        //[HttpGet("{id}", Name = "Get")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        // POST: api/Comodidad
        [HttpPost]
        public string Post([FromBody]Comodidad comodidad)
        {
            if (ModelState.IsValid)
            {
                return _comodidadRepo.Ingresar(comodidad);
            }
            return "Error";
        }

        //// PUT: api/Comodidad/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE: api/ApiWithActions/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
