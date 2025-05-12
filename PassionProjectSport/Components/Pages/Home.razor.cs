using Microsoft.AspNetCore.Components;
using PassionProjectSport.Session;

namespace PassionProjectSport.Components.Pages;

public partial class Home : ComponentBase
{
    protected override void OnInitialized()
    {
        if (!AppSession.IsLoggedIn())
        {
            Navigation.NavigateTo("/login", true);
        }
    }
}