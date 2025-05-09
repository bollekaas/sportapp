using Microsoft.AspNetCore.Components;
using PassionProjectSport.Classes;

namespace PassionProjectSport.Components.Pages;

public partial class NewRoutine : ComponentBase
{
    private readonly Database _database = new Database();
    private List<Exercise> AllExercises = new();
    private string routineName;
    
    protected override async Task OnInitializedAsync()
    {
        try
        {
            string name = string.Empty;
            string pmg = string.Empty;
            AllExercises = await _database.getexercise(name, pmg);

        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error in OnInitializedAsync: {ex.Message}");

        }


    }


    async Task CreateRoutine()
    {
        var selected = AllExercises
            .Where(e => e.IsSelected)
            .Select(e => e.Name)
            .ToList();

        if (selected.Count > 0)
        {
            WorkoutState.SelectedExercises = selected;

            var joined = string.Join(", ", selected);
            
            int routine_id = await _database.CreateRoutine(routineName); 
            
            foreach (string exercise in selected)
            {
                await _database.AddExerciseToRoutine(routine_id, exercise);
            }
            
            
            NavMenu.NavigateTo("/");
        }
        else
        {
            Application.Current.MainPage.DisplayAlert("Let op", "Selecteer minstens één oefening.", "OK");
        }
    }

    async Task CreateExercise()
    {
        NavMenu.NavigateTo("/CreateExercise");
    }
}