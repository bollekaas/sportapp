using Microsoft.AspNetCore.Components;
using PassionProjectSport.Classes;
using PassionProjectSport.Components.Layout;

namespace PassionProjectSport.Components.Pages;

public partial class CreateExercise : ComponentBase
{
    private readonly Database _database = new Database();
    private Exercise _newexercise = new Exercise();
    private readonly Notification _notification = new Notification();
    
    private string ExerciseName;
    private string SelectedEquipment;
    private string SelectedPrimaryMuscle;
    private string SelectedOtherMuscle;

    private List<string> EquipmentList = new() { "Barbell", "Dumbbell", "Machine", "Bodyweight" };
    private List<string> MuscleGroupList = new() { "Chest", "Back", "Legs", "Shoulders", "Biceps", "Triceps", "Core", "Glutes" };

    async Task SaveExercise()
    {

        await _database.CreateExercise(ExerciseName, SelectedEquipment, SelectedPrimaryMuscle, SelectedOtherMuscle);
    }
}