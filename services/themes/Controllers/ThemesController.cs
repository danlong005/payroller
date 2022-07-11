using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace themes.Controllers
{
    [Route("v1/themes")]
    [ApiController]
    public class ThemesController : ControllerBase
    {
        [HttpGet]
        public async Task<IActionResult> GetTheme()
        {
            await Task.Delay(000);
            return StatusCode(StatusCodes.Status200OK, "");
        }
    }
}
