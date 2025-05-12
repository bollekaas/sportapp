using Microsoft.AspNetCore.Components;
using System;
using System.Threading.Tasks;
using PassionProjectSport.Classes;
using PassionProjectSport.Components.FormFields;
using PassionProjectSport.Session;
using MySqlConnector;
using Task = System.Threading.Tasks.Task;

namespace PassionProjectSport.Components.Pages
{
    public partial class Register : ComponentBase
    {
        private Database _database = new Database();
        private Notification _notification = new Notification();
        private PasswordHasher _passwordHasher = new PasswordHasher();
        
        RegisterFields _registerFields = new RegisterFields();
        
        public bool ShowCompanyFields { get; set; } = false;

        private void HandleAccountTypeChange(ChangeEventArgs e)
        {
            _registerFields.SelectedUserType = (RegisterFields.UserType)Enum.Parse(typeof(RegisterFields.UserType), e.Value.ToString(), true);
            ShowCompanyFields = _registerFields.SelectedUserType == RegisterFields.UserType.admin;
        }
        

        public async Task HandleRegister()
        {
            _registerFields.Created = DateTime.Now;
            _registerFields.Modified = DateTime.Now;
            try
            {
              
                bool isUserCreated = await _database.CreateUser(
                    
                    _registerFields.Created,
                    _registerFields.Modified,
                    _registerFields.Firstname,
                    _registerFields.Middlename,
                    _registerFields.Lastname,
                    _registerFields.Email,
                    _registerFields.Password,
                    _registerFields.SelectedUserType
                );

                if (isUserCreated)
                {
                    _notification.Show("Your account has been created!");
                    Navigation.NavigateTo("/login", forceLoad: true);
                }
                else
                {
                    _notification.Show("Account creation failed. Please try again.");
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

    }
}