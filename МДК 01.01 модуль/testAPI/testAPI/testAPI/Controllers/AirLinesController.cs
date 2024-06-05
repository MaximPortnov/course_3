using testAPI.Models;
using testAPI;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;


namespace API.Controllers
{
    [Route("")]
    [ApiController]
    public class AirLinesController : ControllerBase
    {
        AmonicAirlinesContext cont = new AmonicAirlinesContext();
        [HttpGet("CheckUsers", Name = "CheckUsers")]
        public string checkUsers(string login, string password)
        {
            var user = cont.Users.FirstOrDefault(x => x.Email == login && x.Password == password);
            if (user != null)
            {
                if (user.Active == false)
                    return "block";
                else if (user.RoleId == 1)
                    return "admin";
                else if (user.RoleId == 2)
                    return "user";
                else
                    return "error";
            }
            else
                return "false";
        }
        [HttpGet("/Offices")]
        public List<Office> getOffices() {
            return cont.Offices.ToList();
        }
        [HttpGet("/Airports")]
        public List<Airport> getAirports()
        {
            return cont.Airports.ToList();
        }
        [HttpGet("/CabinTypes")]
        public List<CabinType> getCabinTypes()
        {
            return cont.CabinTypes.ToList();
        }
        [HttpGet("/Country")]
        public List<Country> getCountry()
        {
            return cont.Countries.ToList();
        }
        [HttpPost("/Users")]
        public IActionResult CreateUser([FromBody] UserModel userModel)
        {
            int maxId = cont.Users.OrderByDescending(u => u.Id).Select(u => u.Id).FirstOrDefault();

            User user = new()
            {
                Id = maxId + 1,
                Email = userModel.EmailAddress,
                FirstName = userModel.FirstName,
                LastName = userModel.LastName,
                Birthdate = userModel.Birthdate,
                Password = userModel.Password,
                Active = true,
                RoleId = 2,
                Role = cont.Roles.SingleOrDefault(x => x.Id == 2),
                OfficeId = userModel.OfficeId,
                Office = cont.Offices.SingleOrDefault(x => x.Id == userModel.OfficeId)
            };

            cont.Users.Add(user);
            cont.SaveChanges();

            return Created("true", null);
        }

        [HttpGet("/UsersFromOffice")]
        public List<User> GetUsersFromOffice(int officeId)
        {
            if (officeId == -1)
            {
                return cont.Users.ToList();
            }
            else
            {
                return cont.Users.Where(x => x.OfficeId == officeId).ToList();
            }
        }

        [HttpPut("/UserSwitch")]
        public IActionResult SwitchUser(int userId)
        {
            var user = cont.Users.FirstOrDefault(x => x.Id == userId);
            if (user != null)
            {
                user.Active = !user.Active;
                cont.SaveChanges();
                return Ok("Operation completed");
            }
            else
            {
                return NotFound("User not found");
            }
        }

        [HttpPut("/UserEdit")]
        public IActionResult EditUser([FromBody] UserEditModel userModel)
        {
            var userToUpdate = cont.Users.FirstOrDefault(u => u.Id == userModel.Id);

            if (userToUpdate != null)
            {
                userToUpdate.Email = userModel.EmailAddress;
                userToUpdate.FirstName = userModel.FirstName;
                userToUpdate.LastName = userModel.LastName;
                userToUpdate.OfficeId = userModel.OfficeId;
                userToUpdate.RoleId = userModel.RoleId;

                cont.SaveChanges();

                return Ok("User updated successfully");
            }
            else
            {
                return NotFound("User not found");
            }
        }
    }
}
