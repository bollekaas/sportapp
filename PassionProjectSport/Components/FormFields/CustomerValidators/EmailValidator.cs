using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace PassionProjectSport.Components.FormFields.CustomerValidators;

public class EmailValidator : ValidationAttribute
{
    public override bool IsValid(object value)
    {
        if (value == null) return false;

        string email = value.ToString();
        
        // Strong email regex pattern (more strict)
        var emailRegex = new Regex(@"^[^@\s]+@[^@\s]+\.[^@\s]+$");

        return emailRegex.IsMatch(email);
    }
}