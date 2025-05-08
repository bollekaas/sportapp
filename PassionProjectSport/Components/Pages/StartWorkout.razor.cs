using Microsoft.AspNetCore.Components;
using PassionProjectSport.Classes;
using PassionProjectSport.Components.Layout;

namespace PassionProjectSport.Components.Pages;

public partial class StartWorkout : ComponentBase
{
    Dictionary<string, List<SetLog>> ExerciseLogs = new();
    
    private Workout _logworkout = new();
    private readonly Database _database = new Database();

    private string workoutname;
    
    protected override async Task OnInitializedAsync()
    {
        foreach (var exercise in WorkoutState.SelectedExercises)
        {
            ExerciseLogs[exercise] = new List<SetLog>
            {
                new SetLog(), new SetLog()
            };
        }
    }

    void AddSet(string exercise)
    {
        ExerciseLogs[exercise].Add(new SetLog());
        
    }


    async Task FinishWorkout()
    {
        _logworkout.name = workoutname;
        _logworkout.history = DateTime.Now;
        await _database.LogWorkout(_logworkout.name, _logworkout.history);
        NavMenu.NavigateTo("/NewRoutine");
    }
}

