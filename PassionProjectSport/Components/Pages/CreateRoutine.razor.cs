using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.WebUtilities;
using PassionProjectSport.Classes;

namespace PassionProjectSport.Components.Pages;

public partial class CreateRoutine : ComponentBase
{
    public string? Name { get; set; }

    private string RoutineName = string.Empty;
    private List<string> Exercises = new();
    
    private readonly Database _database = new Database();
    private Workout _logroutine = new();
    
    Dictionary<string, List<SetLog>> ExerciseLogs = new();
    
    private string workoutname;
   
    
    protected override void OnInitialized()
    {
        
        var parameters = ParseQueryParameters(NavMenu.Uri);

        if (parameters.TryGetValue("name", out var name))
        {
            RoutineName = name;
        }

        if (parameters.TryGetValue("exercises", out var exerciseCsv))
        {
            Exercises = exerciseCsv.Split(',').Select(x => x.Trim()).ToList();
        }
        foreach (var exercise in Exercises)
        {
            ExerciseLogs[exercise] = new List<SetLog>
            {
                new SetLog(), new SetLog()
            };
        }
    }
    private Dictionary<string, string> ParseQueryParameters(string uri)
    {
        var query = new Uri(uri).Query;
        var queryDictionary = new Dictionary<string, string>();

        if (!string.IsNullOrEmpty(query))
        {
            query = query.TrimStart('?');
            var pairs = query.Split('&', StringSplitOptions.RemoveEmptyEntries);

            foreach (var pair in pairs)
            {
                var parts = pair.Split('=');
                if (parts.Length == 2)
                {
                    var key = Uri.UnescapeDataString(parts[0]);
                    var value = Uri.UnescapeDataString(parts[1]);
                    queryDictionary[key] = value;
                }
            }
        }

        return queryDictionary;
    }
    
    void AddSet(string exercise)
    {
        ExerciseLogs[exercise].Add(new SetLog());
        
    }


    async Task FinishRoutine()
    {
        _logroutine.name = workoutname;
        _logroutine.history = DateTime.Now;
        await _database.LogWorkout(_logroutine.name, _logroutine.history);
        NavMenu.NavigateTo("/NewRoutine");
    }
}