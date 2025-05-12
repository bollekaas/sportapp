using MySqlConnector;
using PassionProjectSport.Components.FormFields;

namespace PassionProjectSport.Classes;

public class Database
{

	private readonly string connstring;
	private readonly PasswordHasher _passwordHasher;
	public Database(string server = "localhost", string user = "root", string password = "max197328!", string database = "workout_database")
	{
		connstring = $"Server={server}; Database={database}; Uid={user}; Pwd={password};";
		_passwordHasher = new PasswordHasher();
	}

	public MySqlConnection GetConnection()
	{
		return new MySqlConnection(connstring);

	}
	public User GetUserAndLogin(string email, string password)
    {
        MySqlConnection connection = this.GetConnection();
        connection.Open();
        string query = "SELECT * FROM user WHERE Email = @Email";
    
        User user = null;
    
        using (connection)
        {
            using (MySqlCommand command = new MySqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@Email", email.ToLower());

                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string userPassword = reader["Password"].ToString();
                        bool isPasswordCorrect = _passwordHasher.Verify(password, userPassword);
                        if (isPasswordCorrect)
                        {
                            int id = int.Parse(reader["Id"].ToString());
                        
                            string firstname = reader["Firstname"].ToString();
                            string middlename = reader["Middlename"].ToString();
                            string lastname = reader["Lastname"].ToString();
                        
                         
                        
                            User.AccountTypeEnum accountType = (User.AccountTypeEnum)Enum.Parse(typeof(User.AccountTypeEnum), reader["AccountType"].ToString(), true);
                        
                            string userEmail = reader["Email"].ToString();
                            DateTime created = Convert.ToDateTime(reader["DateTime_Created"]);
                            DateTime modified = Convert.ToDateTime(reader["DateTime_Modified"]);
                        
                            user = new User(id, created, modified, userEmail, firstname, middlename, lastname, accountType);
                        }
                    }
                }
            }
        }
        return user;
    }
	
	public async Task<bool> CreateUser( DateTime created, DateTime modified,  string firstname, string middlename, string lastname, string email, string password, RegisterFields.UserType userType)
{
    try
    {
        using var connection = new MySqlConnection(connstring);
        await connection.OpenAsync();
        
        string checkEmailQuery = "SELECT COUNT(1) FROM user WHERE Email = @Email";
        using (var checkCommand = new MySqlCommand(checkEmailQuery, connection))
        {
            checkCommand.Parameters.AddWithValue("@Email", email.ToLower());
            var result = await checkCommand.ExecuteScalarAsync();
            if (Convert.ToInt32(result) > 0)
            {
                return false;
            }
        }
        
        
        string query = "INSERT INTO user ( DateTime_Created, DateTime_Modified,  Email, Firstname, Middlename, Lastname, AccountType, Password) VALUES (@Id, @DateTime_Created, @DateTime_Modified, @Email, @Firstname, @Middlename, @Lastname, @AccountType, @Password)";
        using var command = new MySqlCommand(query, connection);
        command.Parameters.AddWithValue("@DateTime_Created", created);
        command.Parameters.AddWithValue("@DateTime_Modified", modified);
        command.Parameters.AddWithValue("@Email", email.ToLower());
        command.Parameters.AddWithValue("@Firstname", firstname);
        command.Parameters.AddWithValue("@Middlename", middlename);
        command.Parameters.AddWithValue("@Lastname", lastname);
        command.Parameters.AddWithValue("@AccountType", userType.ToString());
        command.Parameters.AddWithValue("@Password", _passwordHasher.Hash(password));
     

        int rowsAffected = await command.ExecuteNonQueryAsync();
        if (rowsAffected == 0)
        {
            throw new Exception("Failed to insert user.");
        }

        return true;
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Error: {ex.Message}");
        Console.WriteLine(ex.StackTrace);
        return false;
    }
}
	
	public async Task<List<User>> FetchAllUsersAsync()
	{
		var users = new List<User>();
		using var connection = this.GetConnection();
		await connection.OpenAsync();
		string query = @" SELECT * from user WHERE Id = 1";

		using (var command = new MySqlCommand(query, connection))
		{
			using (var reader = await command.ExecuteReaderAsync())
			{
				while (await reader.ReadAsync())
				{
					int id = int.Parse(reader["Id"].ToString());
					string firstname = reader["Firstname"].ToString();
					string middlename = reader["Middlename"].ToString();
					string lastname = reader["Lastname"].ToString();
					User.AccountTypeEnum accountType = (User.AccountTypeEnum)Enum.Parse(typeof(User.AccountTypeEnum),
						reader["AccountType"].ToString());
					string userEmail = reader["Email"].ToString();
					DateTime created = Convert.ToDateTime(reader["DateTime_Created"]);
					DateTime modified = Convert.ToDateTime(reader["DateTime_Modified"]);
                    
					users.Add(new User(id, created,modified,userEmail, firstname,middlename, lastname,accountType));
				}
			}
		}
		return users;
	}

	public async Task<List<Exercise>> getexercise(string name, string pmg)
	{
		var exerciseList = new List<Exercise>();

		try
		{
			using (var conn = this.GetConnection())
			{
				await conn.OpenAsync();

				string getExercisesQuery = "SELECT Name, Primary_Muscle FROM exercise";
				using (var command = new MySqlCommand(getExercisesQuery, conn))
				{
					using (var reader = await command.ExecuteReaderAsync())
					{
						while (await reader.ReadAsync()) 
						{
							var exercise = new Exercise
							{
								Name = reader.GetString("Name"),
								Primary_Muscle_Group = reader.GetString("Primary_Muscle")

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