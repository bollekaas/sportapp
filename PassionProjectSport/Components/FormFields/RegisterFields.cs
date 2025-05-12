using System.ComponentModel.DataAnnotations;
using BizEasyNL.FormFields.CustomValidators;
using PassionProjectSport.Components.FormFields.CustomerValidators;

namespace PassionProjectSport.Components.FormFields;

public class RegisterFields
{
    public Guid Id { get; set; }
    public DateTime Created { get; set; }
    public DateTime Modified { get; set; }
    [Required(ErrorMessage = "Firstname is required.")]
    public string Firstname { get; set; }
        
    public string Middlename { get; set; }
        
    [Required(ErrorMessage = "Lastname is required.")]
    public string Lastname { get; set; }
        
    [Required(ErrorMessage = "Email address is required.")]
    [EmailValidator(ErrorMessage = "Invalid email format.")]
    [UniqueEmailValidator(ErrorMessage = "This email is not available")]
    public string Email { get; set; }

    [Required(ErrorMessage = "Password is required.")]
    public string Password { get; set; }
        
    public enum UserType
    {
        User,
        admin
    }
        
    public UserType SelectedUserType { get; set; }
}