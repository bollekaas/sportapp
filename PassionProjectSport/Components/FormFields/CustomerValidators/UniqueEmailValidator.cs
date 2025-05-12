using System.ComponentModel.DataAnnotations;
using PassionProjectSport.Classes;



namespace BizEasyNL.FormFields.CustomValidators;

public class UniqueEmailValidator : ValidationAttribute
{
    // Database _database = new Database();
    //
    // public override bool IsValid(object value)
    // {
    //     if (value == null) return false;
    //     
    //     string email = value.ToString();
    //
    //     return !_database.CheckIfUserWithEmailExists(email);
    // }
}