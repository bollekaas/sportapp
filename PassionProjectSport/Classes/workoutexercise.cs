namespace PassionProjectSport.Classes;

public class workoutexercise
{
    public int workout_id { get; set; }
    public int exercise_id { get; set; }

    public workoutexercise(int workout_id)
    {
        this.workout_id = workout_id;

    }
}