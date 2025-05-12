using PassionProjectSport.Classes;

namespace PassionProjectSport.Session;

public class Appsession
{
    public User _user;

    public Appsession()
    {
        _user = null;
    }

    public void SetUser(User user)
    {
        _user = user;
    }

    public User GetUser()
    {
        if (IsLoggedIn())
        {
            return _user;
        }

        return null;
    }
    

    public bool IsLoggedIn()
    {
        return _user != null;
    }

    public void LogoutUser()
    {
        _user = null;
    }
}