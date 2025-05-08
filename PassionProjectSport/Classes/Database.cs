using MySqlConnector;

namespace PassionProjectSport.Classes;

public class Database
{

	private readonly string connstring;
	public Database(string server = "localhost", string user = "root", string password = "max197328!", string database = "workout_database")
	{
		connstring = $"Server={server}; Database={database}; Uid={user}; Pwd={password};";
	}

	public MySqlConnection GetConnection()
	{
		return new MySqlConnection(connstring);

	}

	public async Task<List<Exercise>> getexercise(string name)
	{
		var exerciseList = new List<Exercise>();

		try
		{
			using (var conn = this.GetConnection())
			{
				await conn.OpenAsync();

				string getExercisesQuery = "SELECT Name FROM exercise";
				using (var command = new MySqlCommand(getExercisesQuery, conn))
				{
					using (var reader = await command.ExecuteReaderAsync())
					{
						while (await reader.ReadAsync()) 
						{
							var exercise = new Exercise
							{
								Name = reader.GetString("Name"),

							};
							exerciseList.Add(exercise);
						}
					}
				}
			}
		}
		catch (MySqlException ex)
		{
			throw new ($"Databasefout: {ex.Message}");
		}

		return exerciseList;
	}


	public async Task CreateExercise(string exercisename, string equipment, string primaryMuscle, string otherMuscle)
	{
		try
		{
			using var conn = new MySqlConnection(connstring);
			await conn.OpenAsync();

			string query = "INSERT INTO exercise (Name, Primary_Muscle, Equipment, Other_Muscles) " +
						   "VALUES (@Name, @PrimaryMuscle, @Equipment, @OtherMuscle)";

			using var exercisecreate = new MySqlCommand(query, conn);
			exercisecreate.Parameters.AddWithValue("@Name", exercisename);
			exercisecreate.Parameters.AddWithValue("@PrimaryMuscle", primaryMuscle);
			exercisecreate.Parameters.AddWithValue("@Equipment", equipment);
			exercisecreate.Parameters.AddWithValue("@OtherMuscle", otherMuscle);

			await exercisecreate.ExecuteNonQueryAsync(); 

		}
		catch (MySqlException ex)
		{
			throw new ($"SQL-fout: {ex.Message}");
		}
	}


	public async Task LogWorkout(string workoutname,DateTime history)
	{
		try
		{
			using var conn = new MySqlConnection(connstring);
			await conn.OpenAsync();

			string query = "INSERT INTO workout (name, history) " +
						   "VALUES (@Name, @history)";

			using var exercisecreate = new MySqlCommand(query, conn);
			exercisecreate.Parameters.AddWithValue("@Name", workoutname);
			exercisecreate.Parameters.AddWithValue("@history", history);
			

			await exercisecreate.ExecuteNonQueryAsync();

		}
		catch (MySqlException ex)
		{
			throw new ($"SQL-fout: {ex.Message}");
		}
	}

	public async Task<List<Routine>> Getroutines()
	{
		var routinelist = new List<Routine>();

		try
		{
			using (var conn = this.GetConnection())
			{
				await conn.OpenAsync();

				string getRoutineQuery = @"
          SELECT r.routine_name, GROUP_CONCAT(e.name SEPARATOR ', ') AS exercises
			FROM routine r
			JOIN routine_exercises re ON r.routine_id = re.routine_id
			JOIN exercise e ON re.exercise_id = e.exercise_id
			GROUP BY r.routine_name;";

				using (var command = new MySqlCommand(getRoutineQuery, conn))
				{
					using (var reader = await command.ExecuteReaderAsync())
					{
						while (await reader.ReadAsync())
						{
							var routines = new Routine 
							{
								Routine_Name = reader.GetString("Routine_Name"),
								exercise1 = reader.GetString("Exercises")
							};

							routinelist.Add(routines);
						}
					}
				}
			}
		}
		catch (MySqlException ex)
		{
			throw new ($"Databasefout: {ex.Message}");
		}

		return routinelist;
	}
	public async Task<int> CreateRoutine(string routineName)
	{
		int routine_id = 0;

		try
		{
			using (var conn = this.GetConnection())
			{
				await conn.OpenAsync();


				string insertQuery = "INSERT INTO routine (Routine_Name) VALUES (@routineName); SELECT LAST_INSERT_ID();";
				using (var command = new MySqlCommand(insertQuery, conn))
				{
					command.Parameters.AddWithValue("@routineName", routineName);
					routine_id = Convert.ToInt32(await command.ExecuteScalarAsync());
				}
			}
		}
		catch (MySqlException ex)
		{
			throw new ($"Databasefout: {ex.Message}");
		}

		return routine_id; 
	}

	public async Task AddExerciseToRoutine(int routine_id, string exerciseName)
	{
		try
		{
			using (var conn = this.GetConnection())
			{
				await conn.OpenAsync();


				string getExerciseIdQuery = "SELECT exercise_id FROM exercise WHERE Name = @exerciseName";
				int exercise_id = 0;

				using (var command = new MySqlCommand(getExerciseIdQuery, conn))
				{
					command.Parameters.AddWithValue("@exerciseName", exerciseName);
					using (var reader = await command.ExecuteReaderAsync())
					{
						if (await reader.ReadAsync())
						{
							exercise_id = reader.GetInt32("exercise_id");
						}
					}
				}


				if (exercise_id > 0)
				{
					string insertQuery = "INSERT INTO routine_exercises (routine_id, exercise_id) VALUES (@routine_id, @exercise_id)";
					using (var insertCommand = new MySqlCommand(insertQuery, conn))
					{
						insertCommand.Parameters.AddWithValue("@routine_id", routine_id);
						insertCommand.Parameters.AddWithValue("@exercise_id", exercise_id);

						await insertCommand.ExecuteNonQueryAsync();
					}
				}
				else
				{
					throw new ($"Oefening '{exerciseName}' niet gevonden in de database.");
				}
			}
		}
		catch (MySqlException ex)
		{
			throw new ($"Databasefout: {ex.Message}");
		}
	}
	
	
	
}