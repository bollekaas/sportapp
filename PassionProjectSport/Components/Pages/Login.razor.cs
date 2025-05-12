using Microsoft.AspNetCore.Components;
using PassionProjectSport.Classes;
using PassionProjectSport.Components.FormFields;
using Task = System.Threading.Tasks.Task;
namespace PassionProjectSport.Components.Pages;

public partial class Login : ComponentBase
{
    private User _user;
    private List<User> _users = new();
    private readonly Database _database = new Database();
    private readonly Notification _notification = new Notification();
    
    private LoginFields _loginFields = new LoginFields();
    

    private async Task HandleLogin()
    {
        _users = await _database.FetchAllUsersAsync();
        _notification.Show(_users.Count.ToString());
        _user = _database.GetUserAndLogin(_loginFields.Email, _loginFields.Password);
        try
        {
            if (_user != null)
            {
                if (AppSession.IsLoggedIn())
                {
                    AppSession.LogoutUser();
                }
        
                AppSession.SetUser(_user);
                _notification.Show($"Successfully logged in as {AppSession.GetUser().Firstname}");
                StateHasChanged();
                Navigation.NavigateTo("/", forceLoad: true);
            }
            else
            {
                _notification.Show("Failed to login!");
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            throw;
        }
    }
}