/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ca.databaseapp;

import java.sql.*;
import java.util.Scanner;

/**
 *
 * @author ge_ma
 */
public class CADatabaseapp {

    private static Connection con;

    public static void main(String[] args) {

        // This application uses a main body as clean as possible, calling methods that are described below.
        try {

            // Connecting to Database
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/teyvatleague", "root", "pass1234!");

            // Declaring variable for main menu.
            int choice;

            // Do statement while user doesn't choose 7 (exit). Ensures once every action finishes goes back to menu.
            do {

                // Method to display options menu.
                displayMenu();

                // Assiging user choice using a method that gets and validates user choice.
                choice = getChoice();

                // Switch statement. Options 1-6 use a method for each action.
                switch (choice) {

                    case 1:
                        Action1();
                        break;
                    case 2:
                        Action2();
                        break;
                    case 3:
                        Action3();
                        break;
                    case 4:
                        Action4();
                        break;
                    case 5:
                        Action5();
                        break;
                    case 6:
                        Action6();
                        break;
                    case 7:
                        System.out.println("\nYou will now exit the program. Thank you and see you next time.");
                        break;

                    // Default statement to handle other cases. Might be unecessary as the getChoice method ensures only numbers between 1-7 enter the switch console.
                    // Kept in for good practice.
                    default:
                        System.out.println("\nThis is not a valid choice. Please choose a number between 1 and 7");
                }

                // Do ends if choice is 7.    
            } while (choice != 7);

            // Closing connection before app ends.
            con.close();

            // Catch statement for driver issues.
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not Found.");

            // This will give user details on connection issues.
        } catch (SQLException e) {
            System.out.println("Application was not able to connect to the database.");
            System.out.println("SQL State: " + e.getSQLState());
            System.out.println("Error Code: " + e.getErrorCode());
            System.out.println("Error Message: " + e.getMessage());
        } // Finally statement to close the connection regardless of what happens.
        finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Main menu Methods
    // Displays the options the user has.
    private static void displayMenu() {

        System.out.println("\n*** Teyvat American Football Statistics Menu ***");
        System.out.println("\nOption 1 - Check all players that have a certain name or last name.");
        System.out.println("Option 2 - List all players of a certain team in various orders.");
        System.out.println("Option 3 - Matchday statistics.");
        System.out.println("Option 4 - League Statistics.");
        System.out.println("Option 5 - Injury statistics.");
        System.out.println("Option 6 - Check player details.");
        System.out.println("\n* Option 7 - Exit Program. *");
    }

    // Gets the user options, validating the input.
    private static int getChoice() {

        Scanner scanner = new Scanner(System.in);

        System.out.println("\nPlease enter your option of choice: (numbers from 1-7)");

        // While loop to catch any non-int input.
        while (!scanner.hasNextInt()) {
            System.out.println("Invalid input. Please use only a number from 1-7 for choosing an option.");
            scanner.next();
        }

        // Getting user input.
        int choice = scanner.nextInt();

        // If statement to make sure choice is between 1 and 7.
        if (choice < 1 || choice > 7) {
            System.out.println("Invalid number. Please use only a number from 1-7 for choosing an option.");
            return getChoice();
        }

        return choice;
    }

    // Menu Actions
    private static void Action1() {

        // This first do statement is on every action of this application.
        // The statement has a method at the end to only exit the action when the user chooses so.
        // It gives the option for the user to either check something else with this action or go back to menu.
        do {
            Scanner scanner = new Scanner(System.in);
            String pName;

            do {
                System.out.println("\nPlease enter the first or last name you want to check.");
                pName = scanner.nextLine();

                // This if calls a validation method described below to ensure only letters input are considered.
                if (!NameValidation(pName)) {
                    System.out.println("Please enter a valid name. Only letters with no names or spaces.");
                } // If input is valid, code queries the database.
                else {
                    String query = "SELECT p.player_id, p.first_name, p.last_name, t.team_name "
                            + "FROM player p "
                            + "JOIN team t ON p.team_id = t.team_id "
                            + "WHERE p.first_name LIKE ? OR p.last_name LIKE ?";
                    try ( PreparedStatement preparedStatement = con.prepareStatement(query)) {
                        preparedStatement.setString(1, pName);
                        preparedStatement.setString(2, pName);
                        ResultSet resultSet = preparedStatement.executeQuery();

                        // If statement to check for no matches and inform user.
                        // This is used again throughout the code 
                        // where it is possible database doesn't have data YET.
                        if (!resultSet.isBeforeFirst()) {

                            System.out.println("No players found with the name '" + pName + "'.");
                        } // If there are matches, prints the player details.
                        else {
                            System.out.println("\nPlayers with the name '" + pName + "':");
                            while (resultSet.next()) {
                                int playerId = resultSet.getInt("player_id");
                                String firstName = resultSet.getString("first_name");
                                String lastName = resultSet.getString("last_name");
                                String teamName = resultSet.getString("team_name");

                                System.out.println("***");
                                System.out.println("Player ID: " + playerId);
                                System.out.println("First Name: " + firstName);
                                System.out.println("Last Name: " + lastName);
                                System.out.println("Team Name: " + teamName);
                                System.out.println("***");
                            }

                        }

                        // Catch any problems connection
                    } catch (SQLException e) {
                        System.out.println("Application was not able to connect to the database.");
                        e.printStackTrace();
                    }

                }
            } while (!NameValidation(pName));

        } while (BackMainMenu());

    }

    private static void Action2() {

        // Same do statment to keep user inside this action unless they want out.
        do {

            // Method to display team options and their id.
            DisplayTeams();

            // getTeamChoice is a method that gets the team_id as an input from the user validating it.
            int teamId = getTeamChoice();

            // Method to get which attribute they want to sort by.
            String chosenAtt = getAttribute();

            // Method to get which sorting order they want.
            String sortType = getSorting();

            // Query to get results.
            try {
                String query = "SELECT player_id, first_name, last_name, skill_level, age "
                        + "FROM player "
                        + "WHERE team_id = ? "
                        + "ORDER BY " + chosenAtt + " " + sortType;

                try ( PreparedStatement preparedStatement = con.prepareStatement(query)) {
                    preparedStatement.setInt(1, teamId);
                    ResultSet resultSet = preparedStatement.executeQuery();

                    System.out.println("\nPlayers in Team " + teamId
                            + " ordered by " + chosenAtt + " in " + sortType + " order:");

                    while (resultSet.next()) {
                        int playerId = resultSet.getInt("player_id");
                        String firstName = resultSet.getString("first_name");
                        String lastName = resultSet.getString("last_name");
                        int skillLevel = resultSet.getInt("skill_level");
                        int age = resultSet.getInt("age");

                        System.out.println("Player ID: " + playerId + ", Name: " + firstName + " " + lastName + ", Skill Level: " + skillLevel + ", Age: " + age);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } while (BackMainMenu());
    }

    // Action 3 was the query (4) I wasn't able to properly get the desired results (how many teams won/lost/drew) within MySQL Workbench for the Database part of the CA.
    // In MySQL Workbench, I was only able to get how many matches were a draw and a non-draw so we can deduce how many teams won/lost/drew.
    // Using Java I was able to get the desired results from the question.
    private static void Action3() {

        do {

            // Menu to dinamically displays current matchdays.
            DisplayMatchdays();

            // Method to get the matchday_id from user, validating it.
            int matchday = GetMatchday();

            // If statement that uses a method to check if the matchday has any data.
            // This is done because previous method allows user to pick a matchday that may have not happened yet.
            if (!MatchdayHasData(matchday)) {
                System.out.println("No stats available for the specified matchday as it still hasn't happened.");
                continue;
            }

            // Queries to get user results.
            // Due to my database structure, I separated the queries to get the results properly.
            try {

                // Win query counts any match that scores are not equal as 1 win.
                String winningQuery = "SELECT COUNT(DISTINCT m.hometeam_id) AS totalWinningTeams "
                        + "FROM matches m "
                        + "WHERE m.matchday_id = ? AND m.home_score != m.away_score";

                // Loss query counts any match that scores are not equal as 1 loss.
                // May be redundant, but I really wasn't able to get the right results in a single query.
                // I tried using a single query and *2 the result but somehow it gets wrong.
                // I believe it's mostly because using < > to get the winning team comparing home scores and away scores would get complicated.
                // As sometimes home wins, sometimes away wins. 
                // This works, isn't that hard to understand and doesn't add excessive lines to code , so I kept it.
                // The key idea was to have isolated results for both win and loss.
                String losingQuery = "SELECT COUNT(DISTINCT m.hometeam_id) AS totalLosingTeams "
                        + "FROM matches m "
                        + "WHERE m.matchday_id = ? AND m.home_score != m.away_score";

                // Draw query. Simpler as just counts and sum both teams if scores are equal, to a single result.
                String drawingQuery = "SELECT COUNT(DISTINCT m.hometeam_id) + COUNT(DISTINCT m.awayteam_id) AS totalDrawingTeams "
                        + "FROM matches m "
                        + "WHERE m.matchday_id = ? AND m.home_score = m.away_score";

                // Get all injuries from all matches in this matchday.
                String injuryQuery = "SELECT SUM(m.number_injuries) AS totalInjuries "
                        + "FROM matches m "
                        + "WHERE m.matchday_id = ?";

                // Gets the date of the matchday.
                String dateQuery = "SELECT matchday_date "
                        + "FROM matchday md "
                        + "WHERE md.matchday_ID = ?";

                try ( PreparedStatement winningStatement = con.prepareStatement(winningQuery);  PreparedStatement losingStatement = con.prepareStatement(losingQuery);  PreparedStatement drawingStatement = con.prepareStatement(drawingQuery);  PreparedStatement injuryStatement = con.prepareStatement(injuryQuery);  PreparedStatement dateStatement = con.prepareStatement(dateQuery)) {

                    winningStatement.setInt(1, matchday);
                    losingStatement.setInt(1, matchday);
                    drawingStatement.setInt(1, matchday);
                    injuryStatement.setInt(1, matchday);
                    dateStatement.setInt(1, matchday);

                    ResultSet winningResult = winningStatement.executeQuery();
                    ResultSet losingResult = losingStatement.executeQuery();
                    ResultSet drawingResult = drawingStatement.executeQuery();
                    ResultSet injuryResult = injuryStatement.executeQuery();
                    ResultSet dateResult = dateStatement.executeQuery();

                    String matchdayDate = dateResult.next() ? dateResult.getString("matchday_date") : "Unknown Date";

                    int totalWinningTeams = winningResult.next() ? winningResult.getInt("totalWinningTeams") : 0;
                    int totalLosingTeams = losingResult.next() ? losingResult.getInt("totalLosingTeams") : 0;
                    int totalDrawingTeams = drawingResult.next() ? drawingResult.getInt("totalDrawingTeams") : 0;
                    int totalInjuries = injuryResult.next() ? injuryResult.getInt("totalInjuries") : 0;

                    System.out.println("\nMatchday Stats for " + matchdayDate + ":");
                    System.out.println("On this match day a total of " + totalWinningTeams + " teams won, "
                            + totalLosingTeams + " teams lost, " + totalDrawingTeams + " teams drew, "
                            + "and a total of " + totalInjuries + " injuries were recorded.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error fetching matchday stats from the database.");
            }

        } while (BackMainMenu());

    }

    private static void Action4() {
        do {

            // Method that gets a specific team attribute to view.
            String teamAtt = getTeamAttribute();

            // Using the same method to get the sorting order from Action 2.
            // Works as it only gets asc or desc as result.
            String sortingChoice = getSorting();

            try {
                String query = "SELECT * FROM team ORDER BY " + teamAtt + " " + sortingChoice;

                try ( PreparedStatement preparedStatement = con.prepareStatement(query)) {
                    ResultSet resultSet = preparedStatement.executeQuery();

                    // For the results I found a cool table-format structure to print it. It just looks great.
                    System.out.printf("%-26s | %-6s | %-4s | %-6s | %-5s%n", "Team", "Points", "Wins", "Losses", "Draws");
                    System.out.println("------------------------------------------------------");

                    while (resultSet.next()) {
                        String teamName = resultSet.getString("team_name");
                        int leaguePoints = resultSet.getInt("league_points");
                        int wins = resultSet.getInt("wins");
                        int losses = resultSet.getInt("losses");
                        int draws = resultSet.getInt("draws");

                        System.out.printf("%-26s | %-6d | %-4d | %-6d | %-5d%n", teamName, leaguePoints, wins, losses, draws);
                    }

                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } while (BackMainMenu());

    }

    // Action 5 is a quite extensive insight regarding injuries, therefore I'm counting this action as 2. :D
    private static void Action5() {
        do {

            // First we present a menu that gives user two options.
            // Option 1 is for general injury information.
            // Option 2 for another menu, giving options of different types of specific info.
            int userChoice = injuryMenu();

            // If user choses option 1, displays general injury data from matches so far.
            if (userChoice == 1) {

                injuryGeneral();

            } else {

                // if user choses option 2, gives another menu for specific info
                // and prompts user for their choice, validating it.
                int specificChoice = injurySpecific();

                switch (specificChoice) {

                    // Team injury records specific data.
                    case 1:
                        System.out.println("\n You have chosen to view Team specific Injury records.");

                        //Reusing both display teams and get teams methods from Action 2.
                        DisplayTeams();

                        int chosenTeam = getTeamChoice();

                        // Method that fecthes the desired data.
                        displayTeamInj(chosenTeam);

                        break;

                    // Player injury record specific data.    
                    case 2:

                        System.out.println("\n You have chosen to view Player specific Injury records.");

                        // Method that fecthes the desired data.
                        getPlayerInjRec();

                        break;

                    // Matchday/date injury records data.
                    case 3:
                        System.out.println("\n You have chosen to view Matchday specific Injury records.");

                        //Reutilizing Action 3 Matchday related methods to get matchday information.
                        DisplayMatchdays();

                        int matchday = GetMatchday();

                        // Validating in case matchday has no data.
                        if (!MatchdayHasData(matchday)) {
                            System.out.println("No stats available for the specified matchday as it still hasn't happened.");
                        }

                        // Method that fecthes the desired data.
                        getMatchdayInj(matchday);

                        break;
                }

            }

        } while (BackMainMenu());
    }

    private static void Action6() {
        do {

            // Rather simple query to fetch various information from a certain player.
            // This was created mainly because on previous action for player specific injury
            // I ask user for the player ID. In case they don't know, they are
            // propted to use this action to find out.
            searchPlayerByName();

        } while (BackMainMenu());
    }

    // Actions Loop Method, added to every action to check if user wants to check something else in this action or go back to the main menu.
    // Within the actions, it uses a do-while loop to keep user within the action if they want or back to menu.
    // Uses a boolean method to return either true or false (repeat action or go back to menu)
    private static boolean BackMainMenu() {
        Scanner scanner = new Scanner(System.in);
        int userChoice = 0;
        while (true) {
            System.out.println("\nResults finalized. What would you like to do now?");
            System.out.println("1. Check something else within this option.");
            System.out.println("2. Return to the main menu.");
            System.out.print("\nEnter your choice: ");

            if (scanner.hasNextInt()) {
                userChoice = scanner.nextInt();

                if (userChoice == 1 || userChoice == 2) {
                    break;
                } else {
                    System.out.println("Invalid choice. Please enter 1 or 2.");
                }
            } else {
                scanner.next();
                System.out.println("Invalid choice. Please enter either number 1 or number 2.");
            }
        }

        return userChoice == 1;
    }

    // Action 1 Method, validating the Player name
    private static boolean NameValidation(String name) {
        return name.matches("^[A-Za-z\\s]+$");
    }

    // Action 2 Methods
    // Method to display the teams in our league
    private static void DisplayTeams() {
        System.out.println("\n*** Please pick a team to view. Make sure to use their Team ID for choosing them.***");
        System.out.println("Mondstadt Knights - 4001");
        System.out.println("Springvale Hunters - 4002");
        System.out.println("Fatuui Skirmishers - 4003");
        System.out.println("Liyue Harbor Milileth - 4004");
        System.out.println("Quince Village Youngs - 4005");
        System.out.println("Chasm Miners - 4006");
        System.out.println("Narukami Samurai - 4007");
        System.out.println("Watatsumi Fighters - 4008");
        System.out.println("Sumeru City Scholars - 4009");
        System.out.println("Port Ormos Sailors - 4010");
        System.out.println("Aaru Village Vultures - 4011");
        System.out.println("Fontaine City Enforcer - 4012");
        System.out.println("Poisson Village Survivors - 4013");
        System.out.println("Meropide Inmates - 4014");
        System.out.println("***");
    }

    // Method to get the user team choice, validating the choice between available teams.
    // Does not account for possible new teams, as in a sports league adding extra
    // teams would mean change so big everything would have to be reconsidered.
    private static int getTeamChoice() {

        Scanner scanner = new Scanner(System.in);
        System.out.println("\nPlease input the Team ID of choice: (numbers from 4001-4014)");

        int teamChoice;

        while (true) {

            while (!scanner.hasNextInt()) {
                System.out.println("Invalid input. Please use only a number from 4001-4014 for choosing an option.");
                scanner.next();
            }

            teamChoice = scanner.nextInt();

            if (teamChoice >= 4001 && teamChoice <= 4014) {
                break;
            }

            System.out.println("Invalid number. Please use only a number from 4001-4014 for choosing an option.");

        }

        return teamChoice;

    }

    // Method to get the user attribute choice.
    private static String getAttribute() {

        Scanner scanner = new Scanner(System.in);
        System.out.println("\nPlease choose between the following attributes to order the player by:");
        System.out.println("1. Name (Alphabetical)");
        System.out.println("2. Age");
        System.out.println("3. Skill");
        System.out.println("\nPlease write the attribute you want to order by (Name, Age or Skill)");

        String chosenAttribute = "a";

        boolean attInput = false;

        while (!attInput) {

            chosenAttribute = scanner.nextLine().toLowerCase();

            switch (chosenAttribute) {
                case "age":
                    System.out.println("You chose Age.");
                    attInput = true;
                    break;
                case "name":
                    System.out.println("You chose Name.");
                    attInput = true;
                    // The line below changes the user choice to the actual value on the table.
                    // Same with skill below.
                    chosenAttribute = "first_name";
                    break;
                case "skill":
                    System.out.println("You chose Skill.");
                    attInput = true;
                    chosenAttribute = "skill_level";
                    break;
                default:
                    System.out.println("Invalid input. Please enter Age, Name, or Skill.");
                    break;
            }
        }

        return chosenAttribute;

    }

    // Method to get the user sorting choice.
    private static String getSorting() {

        Scanner scanner = new Scanner(System.in);
        System.out.println("\nPlease choose the sorting order for the attributes:");
        System.out.println("1. Ascending (ASC)");
        System.out.println("2. Descending (DESC)");
        System.out.println("\nPlease the attribute order you want (Only write ASC or DESC)");

        String chosenSorting = "s";

        boolean sortInput = false;

        while (!sortInput) {

            chosenSorting = scanner.nextLine().toLowerCase();

            switch (chosenSorting) {
                case "asc":
                    System.out.println("You chose Ascedubg.");
                    sortInput = true;
                    break;
                case "desc":
                    System.out.println("You chose Descending.");
                    sortInput = true;
                    break;
                default:
                    System.out.println("Invalid input. Please enter either ASC for Ascending or DESC for Descending.");
                    break;
            }
        }

        return chosenSorting;

    }

    //Action 3 Methods
    // Method to interactively display the match days that have happened. If any match days are added, they will be fecthed as well.
    private static void DisplayMatchdays() {
        System.out.println("\n*** Please pick a Match Day to view statistics. Make sure to use their Matchday ID for choosing them.***");

        try {
            String query = "SELECT matchday_id, matchday_date, round_number FROM matchday";
            try ( PreparedStatement preparedStatement = con.prepareStatement(query)) {
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    int matchdayId = resultSet.getInt("matchday_id");
                    String matchdayDate = resultSet.getString("matchday_date");
                    int roundNumber = resultSet.getInt("round_number");

                    System.out.println("Match day date: " + matchdayDate + " - " + "Round number: " + roundNumber + " - Match day ID " + matchdayId);

                }

                System.out.println("\nThese are the match days that currently happened.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error fetching matchdays from the database.");
        }

        System.out.println("***");
    }

    // Method to get the user match day of choice.
    private static int GetMatchday() {

        Scanner scanner = new Scanner(System.in);
        System.out.println("\nPlease input the Match Day ID of choice: (numbers from 3001-3099)");

        int matchdayChoice;

        while (true) {

            while (!scanner.hasNextInt()) {
                System.out.println("Invalid input. Please use only a number from 3001-3099 for choosing an option.");
                scanner.next();
            }

            matchdayChoice = scanner.nextInt();

            // Note that it allows for up to 99 matchdays. While realistically it may never reach this point
            // This is to account for future matchdays.
            if (matchdayChoice >= 3001 && matchdayChoice <= 3099) {
                break;
            }

            System.out.println("Invalid number. Please use only a number from 3001-3099 for choosing an option.");

        }

        return matchdayChoice;

    }

    // Method to chec if any given matchday has any data.
    private static boolean MatchdayHasData(int matchday) {

        String checkQuery = "SELECT 1 FROM matches WHERE matchday_id = ? LIMIT 1";

        // This is in case the user choses a matchday that hasn't happened yet.
        // Returns true if there is any results, and false if there is none.
        // Within its uses, it is used along an if (!matchdayhasdata). 
        // If no results are found, gives user a message stating that.
        try ( PreparedStatement checkStatement = con.prepareStatement(checkQuery)) {
            checkStatement.setInt(1, matchday);
            ResultSet checkResult = checkStatement.executeQuery();
            return checkResult.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    //Action 4 Methods
    // Method to get sorting attribute.
    private static String getTeamAttribute() {

        Scanner scanner = new Scanner(System.in);
        System.out.println("\nPlease choose between the following stats to order the Teams by:");
        System.out.println("Points");
        System.out.println("Wins");
        System.out.println("Losses");
        System.out.println("Draws");
        System.out.println("\nPlease write the stat you want to order by (Points, Wins, Losses or Draws)");

        String chosenAttribute = "a";

        boolean attInput = false;

        while (!attInput) {

            chosenAttribute = scanner.nextLine().toLowerCase();

            switch (chosenAttribute) {
                case "points":
                    System.out.println("You chose Points.");
                    chosenAttribute = "league_points";
                    attInput = true;
                    break;
                case "wins":
                    System.out.println("You chose Wins.");
                    attInput = true;
                    break;
                case "losses":
                    System.out.println("You chose Losses.");
                    attInput = true;
                    break;
                case "draws":
                    System.out.println("You chose Draws.");
                    attInput = true;
                    break;

                default:
                    System.out.println("Invalid input. Please enter one of these words: Points, Wins, Losses or Draws");
                    break;
            }
        }

        return chosenAttribute;

    }

    //Action 5 Methods
    //Menu to ask if user wants general or specific data.
    private static int injuryMenu() {

        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("\nInjury Statistics Menu:");
            System.out.println("1. General Information");
            System.out.println("2. Specific Information");
            System.out.print("\nEnter your choice: ");

            int choice = scanner.nextInt();

            if (choice == 1 || choice == 2) {
                return choice;
            } else {
                System.out.println("Invalid choice. Please enter a valid option (number 1 or number 2).");
            }
        }

    }

    //Method that shows general information from injuries.
    private static void injuryGeneral() {

        try {
            String query = "SELECT "
                    + "(SELECT COUNT(*) FROM injury) AS totalInjuries, "
                    + "(SELECT COUNT(DISTINCT inj_type) FROM injury) AS distinctInjuryTypes, "
                    + "(SELECT COUNT(DISTINCT player_id) FROM injury) AS uniquePlayersInjured";

            try ( PreparedStatement preparedStatement = con.prepareStatement(query)) {
                ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    int totalInjuries = resultSet.getInt("totalInjuries");
                    int distinctInjuryTypes = resultSet.getInt("distinctInjuryTypes");
                    int uniquePlayersInjured = resultSet.getInt("uniquePlayersInjured");

                    System.out.println("\nGeneral Injury Statistics:");
                    System.out.println("Total Injuries: " + totalInjuries);
                    System.out.println("Distinct Injury Types: " + distinctInjuryTypes);
                    System.out.println("Unique Players Injured: " + uniquePlayersInjured);
                } else {
                    System.out.println("No data available for injury statistics.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error fetching injury statistics from the database.");
        }

    }

    //Menu for the specific data user might want.
    private static int injurySpecific() {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("\n What specifics would you like?");
            System.out.println("1. Team injury records.");
            System.out.println("2. Player injury records.");
            System.out.println("3. Matchday injury records.");
            System.out.print("\nEnter your choice (number 1 to 3): ");

            int specChoice = scanner.nextInt();

            if (specChoice >= 1 && specChoice <= 3) {
                return specChoice;
            } else {
                System.out.println("Invalid choice. Please enter a valid option (number 1 to 3).");
            }
        }
    }

    // Method to fetch team specific injury data.
    private static void displayTeamInj(int teamID) {

        try {
            String query = "SELECT "
                    + "p.first_name, "
                    + "p.last_name, "
                    + "i.inj_type, "
                    + "md.matchday_date "
                    + "FROM "
                    + "player p "
                    + "JOIN injury i ON p.player_id = i.player_id "
                    + "JOIN matches m ON i.match_id = m.match_id "
                    + "JOIN matchday md ON m.matchday_id = md.matchday_id "
                    + "WHERE "
                    + "p.team_id = ?";

            try ( PreparedStatement preparedStatement = con.prepareStatement(query)) {
                preparedStatement.setInt(1, teamID);
                ResultSet resultSet = preparedStatement.executeQuery();

                if (!resultSet.isBeforeFirst()) {

                    System.out.println("No team injury records found for the selected team.");
                } else {

                    System.out.println("\nTeam Injury Records:");

                    while (resultSet.next()) {
                        String firstName = resultSet.getString("first_name");
                        String lastName = resultSet.getString("last_name");
                        String injuryType = resultSet.getString("inj_type");
                        String injuryDate = resultSet.getString("matchday_date");

                        System.out.println("Player: " + firstName + " " + lastName
                                + ", Injury Type: " + injuryType
                                + ", Date: " + injuryDate);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error fetching team injury records from the database.");
        }

    }

    // Method to fetch player specific injury data.
    private static void getPlayerInjRec() {

        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.print("\nEnter the player ID (between 5000 and 5999), or enter 0 to exit, in case you don't know the player's ID: ");

            if (scanner.hasNextInt()) {
                int playerId = scanner.nextInt();

                if (playerId == 0) {
                    System.out.println("Exiting player injury records, if you want to know a player's ID, use option 6 from the main menu.");
                    break;
                }

                if (playerId >= 5000 && playerId <= 5999) {
                    try {
                        String query = "SELECT p.first_name, p.last_name, i.inj_type, md.matchday_date "
                                + "FROM player p "
                                + "JOIN injury i ON p.player_id = i.player_id "
                                + "JOIN matches m ON i.match_id = m.match_id "
                                + "JOIN matchday md ON m.matchday_id = md.matchday_id "
                                + "WHERE p.player_id = ?";

                        try ( PreparedStatement preparedStatement = con.prepareStatement(query)) {
                            preparedStatement.setInt(1, playerId);
                            ResultSet resultSet = preparedStatement.executeQuery();

                            if (!resultSet.isBeforeFirst()) {
                                System.out.println("No injury records found for this player.");
                            } else {
                                if (resultSet.next()) {
                                    String firstName = resultSet.getString("first_name");
                                    String lastName = resultSet.getString("last_name");

                                    System.out.println("\n" + firstName + " " + lastName + " Injury Records:");

                                    do {
                                        String injuryType = resultSet.getString("inj_type");
                                        String matchdayDate = resultSet.getString("matchday_date");

                                        System.out.println("Injury Type: " + injuryType
                                                + ", Matchday Date: " + matchdayDate);
                                    } while (resultSet.next());
                                }
                            }

                            break;
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        System.out.println("Error fetching player injury records from the database.");
                    }
                } else {
                    System.out.println("Invalid player ID. Please enter a valid ID between 5000 and 5999.");
                }
            } else {
                System.out.println("Invalid input. Please enter a valid number.");
                scanner.next();
            }
        }
    }

    // Method to fetch matchday specific injury data.
    private static void getMatchdayInj(int matchday) {
        try {
            String query = "SELECT p.first_name, p.last_name, i.inj_type, md.matchday_date "
                    + "FROM player p "
                    + "JOIN injury i ON p.player_id = i.player_id "
                    + "JOIN matches m ON i.match_id = m.match_id "
                    + "JOIN matchday md ON m.matchday_id = md.matchday_id "
                    + "WHERE md.matchday_id = ?";

            try ( PreparedStatement preparedStatement = con.prepareStatement(query)) {
                preparedStatement.setInt(1, matchday);
                ResultSet resultSet = preparedStatement.executeQuery();

                if (!resultSet.isBeforeFirst()) {
                    System.out.println("No injuries found for the specified matchday.");
                    return;
                }

                resultSet.next(); // Move to the first row
                String matchdayDate = resultSet.getString("matchday_date");

                System.out.println("\nIn the match day " + matchdayDate + " the following injuries happened:");
                System.out.println(" ");

                do {
                    String firstName = resultSet.getString("first_name");
                    String lastName = resultSet.getString("last_name");
                    String injuryType = resultSet.getString("inj_type");

                    System.out.println(firstName + " " + lastName + " sustained a " + injuryType + " injury.");
                } while (resultSet.next());

            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error fetching injuries by matchday from the database.");
        }
    }

    // Action 6 Methods.
    private static void searchPlayerByName() {
        Scanner scanner = new Scanner(System.in);

        System.out.print("\nEnter a player name to check details of any player with this name: ");
        String playerName = scanner.nextLine();

        if (!NameValidation(playerName)) {
            System.out.println("Please enter a valid name. Only letters with no names or spaces.");
        } else {

            try {
                String query = "SELECT p.player_id, p.first_name, p.last_name, p.age, pos.position_name, t.team_name "
                        + "FROM player p "
                        + "JOIN position pos ON p.position_id = pos.position_id "
                        + "JOIN team t ON p.team_id = t.team_id "
                        + "WHERE first_name LIKE ? OR last_name LIKE ?";

                try ( PreparedStatement preparedStatement = con.prepareStatement(query)) {
                    preparedStatement.setString(1, "%" + playerName + "%");
                    preparedStatement.setString(2, "%" + playerName + "%");

                    ResultSet resultSet = preparedStatement.executeQuery();

                    if (resultSet.isBeforeFirst()) {
                        System.out.println("\nPlayers matching the name '" + playerName + "':");

                        while (resultSet.next()) {
                            int playerId = resultSet.getInt("player_id");
                            String firstName = resultSet.getString("first_name");
                            String lastName = resultSet.getString("last_name");
                            int age = resultSet.getInt("age");
                            String positionName = resultSet.getString("position_name");
                            String teamName = resultSet.getString("team_name");

                            System.out.println("Name: " + firstName + " " + lastName
                                    + ", Player ID: " + playerId
                                    + ", Age: " + age
                                    + ", Position: " + positionName
                                    + ", Team: " + teamName);
                        }
                    } else {
                        System.out.println("No players found matching the name '" + playerName + "'.");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error fetching player information from the database.");
            }
        }
    }
}
