# BashUserManagement

This project is a Bash script that simulates a basic **user management system** with the following core functionalities:  

## Features  

### 1. **User Registration**  
- Verifies if a username already exists; duplicates are rejected with an appropriate message.  
- Collects user details like email and password with specific validation rules.  
- Generates a unique user ID, appends user details to a `.csv` registry, and creates a personal "home" directory for the new user.  

### 2. **User Authentication and Logout**  
- Enables login by verifying credentials (username and password) from the registry.  
  - Upon successful login:  
    - Navigates the user to their "home" directory.  
    - Updates the `last_login` field in the registry.  
    - Adds the username to a `logged_in_users` array to track active sessions.  
- Logout functionality removes the username from the active sessions list.  

### 3. **Report Generation**  
- Generates a report for a specific user, counting the number of files, directories, and the total disk space used in their "home" directory.
- The report is generated asynchronously and saved in the user's "home" directory.

## Usage  
1. Clone the repository:  
   ```bash
   git clone https://github.com/gavrilaalexandru/BashUserManagement
   cd <repository-directory>
