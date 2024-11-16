# BashUserManagement
This project is a Bash script that simulates a basic user management system with the following core functionalities:

1. User Registration
</br>
Verifies if a username already exists; duplicates are rejected with an appropriate message.
Collects user details like email and password with specific validation rules.
Generates a unique user ID, appends user details to a .csv registry, and creates a personal "home" directory for the new user.
2. User Authentication and Logout
</br>
Enables login by verifying credentials (username and password) from the registry.
Upon successful login, the user is navigated to their "home" directory, and the last_login field in the registry is updated.
The username is added to a logged_in_users array to track active sessions.
Logout functionality removes the username from the active sessions list.
3. Report Generation
</br>
Generates a report for a specific user, counting the number of files, directories, and the total disk space used in their "home" directory.
The report is generated asynchronously and saved in the user's "home" directory.
