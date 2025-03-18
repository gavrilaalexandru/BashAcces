# 🖥️ UserForge

This project is a Bash script that simulates a basic **user management system** with the following core functionalities:  

## ✨ Features  

### 1. **User Registration**  
- ✅ Verifies if a username already exists; duplicates are rejected with an appropriate message.  
- 📧 Collects user details like email and password with specific validation rules.  
- 🔑 Generates a unique user ID, appends user details to a `.csv` registry, and creates a personal "home" directory for the new user.  

### 2. **User Authentication and Logout**  
- 🔐 Enables login by verifying credentials (username and password) from the registry.  
  - ✔️ Upon successful login:  
    - 🏠 Navigates the user to their "home" directory.  
    - ⏰ Updates the `last_login` field in the registry.  
    - 👥 Adds the username to a `logged_in_users` array to track active sessions.  
- 🚪 Logout functionality removes the username from the active sessions list.  

### 3. **Report Generation**  
- 📊 Generates a report for a specific user, counting the number of files, directories, and the total disk space used in their "home" directory.
- 💾 The report is generated asynchronously and saved in the user's "home" directory.

## 🗂️ File Structure
- **`main.sh`**: The primary script that provides a menu-driven interface for user management, including options for user registration, login, logout, generating reports, and checking the current directory. It calls specific scripts based on user input, using `source` for login/logout to ensure session variables persist.
- **`inregistrare_utilizatori.sh`**: Handles user registration, validation, and adding user details to the registry. It checks for duplicate usernames and emails, validates password strength, and ensures password confirmation matches. After registration, it generates a unique user ID, stores user details in `users.csv`, and creates a home directory for the user.
- **`logare_utilizatori.sh`**: Manages user login by verifying the username against `users.csv`. If the user exists and is not already logged in, it prompts for a password and validates it against the stored password. After successful login, it updates the `last_login` field in `users.csv`, adds the user to the `logged_in_users` array, and navigates to the user’s home directory. It allows up to 3 login attempts before denying further access.
- **`delogare_utilizatori.sh`**: Handles user logout by searching the `logged_in_users` array for the specified username. If the user is found, they are removed from the array and logged out. If the user is not found or there are no logged-in users, the script will display an appropriate message.
- **`raport_utlizatori.sh`**: Generates a report for a specified user, counting the number of files and directories in the user's home directory and calculating total disk usage. The report is saved as a text file in the user's home directory. The script also prompts the user to view the report after generation.

## 🚀 Usage  
1. Clone the repository:  
   ```bash
   git clone https://github.com/gavrilaalexandru/UserForge
   cd UserForge/project
2. Make all scripts executable:
   ```bash
   chmod +x *.sh
3. Execute the main script with source to ensure variables and functions persist in the current shell:
   ```bash
   source ./main.sh
