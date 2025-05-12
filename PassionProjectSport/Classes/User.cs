namespace PassionProjectSport.Classes;

public class User
{
    public int Id;
    public DateTime Created;
    public DateTime Modified;
    public string Email;
    public string Firstname;
    public string Middlename;
    public string Lastname;
    public AccountTypeEnum AccountType;

    public enum AccountTypeEnum
    {
        admin,
        user
    }

    public User(int id, DateTime created, DateTime modified, string email, string firstName, string middleName,
        string lastName, AccountTypeEnum accountType)
    {
        this.Id = id;
        this.Created = created;
        this.Modified = modified;
        this.Email = email;
        this.Firstname = firstName;
        this.Middlename = middleName;
        this.Lastname = lastName;
        this.AccountType = accountType;
    }
}