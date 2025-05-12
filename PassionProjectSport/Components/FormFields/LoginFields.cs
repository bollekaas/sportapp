using System.ComponentModel.DataAnnotations;
using PassionProjectSport.Components.FormFields.CustomerValidators;

namespace PassionProjectSport.Components.FormFields;

public class LoginFields
{
    [Required(ErrorMessage = "Email address is required.")]
    [EmailValidator(ErrorMessage = "Invalid email format.")]
    public string Email { get; set; }

    [Required(ErrorMessage = "Password is required.")]
    public string Password { get; set; }
}