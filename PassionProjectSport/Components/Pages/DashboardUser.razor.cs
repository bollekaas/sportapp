using Microsoft.AspNetCore.Components;
using PassionProjectSport.Classes;

namespace PassionProjectSport.Components.Pages;

public partial class DashboardUser : ComponentBase
{
    private readonly Database _database = new();
    private readonly Notification _notification = new();
    
    private List<workoutexercise> _workoutexercise = new();
    
 
    protected override async Task OnInitializedAsync()
    {
        
        _workoutexercise = await  _database.GetWorkoutExercise();
    }
    
    private void LogNewWorkout()
    {
        Navigation.NavigateTo("/LogWorkout"); 
    }
    
}