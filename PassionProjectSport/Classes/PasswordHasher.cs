using BCrypt.Net;
using Org.BouncyCastle.Crypto.Generators;

namespace PassionProjectSport.Classes;

public class PasswordHasher
{
    public string Hash(string password)
    {
        return global::BCrypt.Net.BCrypt.HashPassword(password);
    }

    public bool Verify(string password, string hashedPassword)
    {
        return global::BCrypt.Net.BCrypt.Verify(password, hashedPassword);
    }
}