namespace PassionProjectSport.Classes;

public class Exercise
{
    public int exercise_id { get; set; }
    public string Name { get; set; }
    public string Primary_Muscle_Group { get; set; }
    public string Other_Muscle_Group { get; set; }
    public string Equipment {  get; set; }
    public bool IsSelected { get; set; }
}