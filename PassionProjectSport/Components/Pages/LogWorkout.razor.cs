
using Microsoft.AspNetCore.Components;
using PassionProjectSport.Classes;

namespace PassionProjectSport.Components.Pages;

public partial class LogWorkout : ComponentBase
{
    private readonly Database _database = new Database();
    private List<Routine> _routines = new();
    
    protected override async Task OnInitializedAsync()
    {
        try
        {
            _routines = await _database.Getroutines();

        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error in OnInitializedAsync: {ex.Message}");

        }
    }
    void StartWorkout(Routine routine)
    {
        
        var exerciseList = routine.exercise1?.Split(',').Select(x => x.Trim()).ToList() ?? new();
        var encodedExercises = Uri.EscapeDataString(string.Join(",", exerciseList));

        NavMenu.NavigateTo($"/CreateRoutine?name={Uri.EscapeDataString(routine.Routine_Name)}&exercises={encodedExercises}");
        
    }

    void StartEmptyWorkout()
    {
        NavMenu.NavigateTo("/ExercisePage");
    }

    void NewRoutine()
    {
        NavMenu.NavigateTo("/NewRoutine");
    }

    void Search()
    {
        Console.WriteLine("Zoeken...");
    }
    
}