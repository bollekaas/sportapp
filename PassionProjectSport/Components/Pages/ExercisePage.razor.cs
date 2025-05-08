
using Microsoft.AspNetCore.Components;
using PassionProjectSport.Classes;

namespace PassionProjectSport.Components.Pages;

public partial class ExercisePage : ComponentBase
{

    private readonly Database _database = new Database();

    private List<Exercise> AllExercises = new();
    private Dictionary<string, List<Exercise>> ExercisesByMuscle = new();
    private HashSet<string> ExpandedGroups = new(); 


    protected override async Task OnInitializedAsync()
    {
        try
        {
            string name = string.Empty;
            AllExercises = await _database.getexercise(name);
            GroupExercisesByMuscle();

        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error in OnInitializedAsync: {ex.Message}");

        }


    }

    private void GroupExercisesByMuscle()
    {
        ExercisesByMuscle = AllExercises
            .GroupBy(ex => ex.Primary_Muscle_Group)
            .ToDictionary(g => g.Key, g => g.ToList());
    }

    private void ToggleDropdown(string muscleGroup)
    {
        if (!ExpandedGroups.Add(muscleGroup))
        {
            ExpandedGroups.Remove(muscleGroup);
        }
    }
    async Task SubmitSelection()
    {
        WorkoutState.SelectedExercises = AllExercises
            .Where(e => e.IsSelected)
            .Select(e => e.Name)
            .ToList();

        if (WorkoutState.SelectedExercises.Count > 0)
        {
            NavMenu.NavigateTo("/StartWorkout");
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