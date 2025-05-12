
using Microsoft.AspNetCore.Components;
using PassionProjectSport.Classes;

namespace PassionProjectSport.Components.Pages;

public partial class ExercisePage : ComponentBase
{

    private readonly Database _database = new Database();
    private readonly Notification _notification = new Notification();

    private List<Exercise> AllExercises = new();
    private Dictionary<string, List<Exercise>> ExercisesByMuscle = new();
    private HashSet<string> ExpandedGroups = new(); 


    protected override async Task OnInitializedAsync()
    {
        try
        {
            string name = string.Empty;
            string pmg = string.Empty;
            AllExercises = await _database.getexercise(name, pmg);
            GroupExercisesByMuscle();
            

        }
        catch (Exception ex)
        {
            _notification.Show($"Error in OnInitializedAsync: {ex.Message}");

        }


    }

    private void GroupExercisesByMuscle()
    {
        ExercisesByMuscle = AllExercises
            .Where(ex => !string.IsNullOrWhiteSpace(ex.Primary_Muscle_Group))
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
            Navigation.NavigateTo("/StartWorkout");
        }
        else
        {
            Application.Current.MainPage.DisplayAlert("Let op", "Selecteer minstens één oefening.", "OK");
        }
    }

    async Task CreateExercise()
    {
        Navigation.NavigateTo("/CreateExercise");
    }
}