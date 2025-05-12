
using Microsoft.AspNetCore.Components;
using PassionProjectSport.Classes;

namespace PassionProjectSport.Components.Pages;

public partial class LogWorkout : ComponentBase
{
    private readonly Database _database = new Database();
    private readonly Notification _notification = new Notification();
    private List<Routine> _routines = new();
    
    protected override async Task OnInitializedAsync()
    {
       
        
        try
        {
            _routines = await _database.Getroutines();

        }
        catch (Exception ex)
        {
            _notification.Show($"Error in OnInitializedAsync: {ex.Message}");

        }
    }
    void StartWorkout(Routine routine)
    {
        
        var exerciseList = routine.exercise1?.Split(',').Select(x => x.Trim()).ToList() ?? new();
        var encodedExercises = Uri.EscapeDataString(string.Join(",", exerciseList));

        Navigation.NavigateTo($"/CreateRoutine?name={Uri.EscapeDataString(routine.Routine_Name)}&exercises={encodedExercises}");
        
    }

    void StartEmptyWorkout()
    {
        Navigation.NavigateTo("/ExercisePage");
    }

    void NewRoutine()
    {
        Navigation.NavigateTo("/NewRoutine");
    }

    void Search()
    {
        _notification.Show("Zoeken...");
    }
    
}