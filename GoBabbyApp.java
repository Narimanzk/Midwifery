    import java.io.BufferedReader;
    import java.io.IOException;
    import java.io.InputStreamReader;
    import java.sql.* ;
    import java.util.Dictionary;
    import java.util.Hashtable;
    import java.util.Random;

    class GoBabbyApp
    {

        public static void main ( String [ ] args ) throws SQLException, IOException {

            // Register the driver.  You must register the driver before you can use it.
            try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
            catch (Exception cnfe){ System.out.println("Class not found"); }

            // This is the url you must use for DB2.
            String url = "jdbc:db2://winter2022-comp421.cs.mcgill.ca:50000/cs421";

            //REMEMBER to remove your user id and password before submitting your code!!
            String your_userid = null;
            String your_password = null;
            //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
            //$  export SOCSPASSWD=yoursocspasswd
            if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
            {
              System.err.println("Error!! do not have a username to connect to the database!");
              System.exit(1);
            }
            if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
            {
              System.err.println("Error!! do not have a password to connect to the database!");
              System.exit(1);
            }
            Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
            Statement statement = con.createStatement ( ) ;

            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

            System.out.println("Welcome to the GoBabby App!\n");

            System.out.println("Please enter your practitioner id [E] to exit: ");
            String input = reader.readLine();
            int practitioner = getPractitioner(reader, statement, con, input);

            boolean cond1 = true;
            boolean cond2 = true;
            boolean cond3 = true;
            String date = null;
            String mother = null;
            int hcard = 0;
            int appid = 0;
            int cid = 0;
            int pregnum = 0;
            String body;
            String type;
            while(cond1) {
                if (cond2) {
                    System.out.println("Please enter the date for appointment list [E] to exit: ");
                    date = reader.readLine();
                    if (date.equals("E")) exit(statement, con);
                }

                if (cond3) {
                    Dictionary appDict = getAppointments(reader, con, practitioner, date);

                    System.out.println("Enter the appointment number that you would like to work on.");
                    System.out.println("[E] to exit [D] to go back to another date :");
                    String next = reader.readLine();
                    if (next.equals("E")) exit(statement, con);
                    if (next.equals("D")){
                        cond2 = true;
                        continue;
                    }

                    String[] data = (String[]) appDict.get(Integer.parseInt(next));

                    appid = Integer.parseInt(data[0]);
                    cid = Integer.parseInt(data[1]);
                    pregnum = Integer.parseInt(data[2]);
                    mother = data[3];
                    hcard = Integer.parseInt(data[4]);
                }


                System.out.println("For " + mother + " " + hcard);
                System.out.println("1. Review notes");
                System.out.println("2. Review tests");
                System.out.println("3. Add a note");
                System.out.println("4. Prescribe a test");
                System.out.println("5. Go back to the appointments.");

                System.out.println("\nEnter your choice: ");
                int option = Integer.parseInt(reader.readLine());

                switch (option) {
                    case 1:
                        reviewNotes(statement, cid, pregnum);
                        System.out.println();
                        cond2 = false;
                        cond3 = false;
                        continue;
                    case 2:
                        reviewTests(statement, cid, pregnum);
                        System.out.println();
                        cond2 = false;
                        cond3 = false;
                        continue;
                    case 3:
                        System.out.println("Please type your observation:");
                        body = reader.readLine();
                        addNotes(con,appid,practitioner,body);
                        cond2 = false;
                        cond3 = false;
                        continue;
                    case 4:
                        System.out.println("Please enter the type of test:");
                        type = reader.readLine();
                        addTests(con,type,appid,practitioner);
                        cond2 = false;
                        cond3 = false;
                        continue;
                    case 5:
                        cond2 = false;
                        cond3 =true;
                        continue;
                }
            }


          // Finally but importantly close the statement and connection
            statement.close ( ) ;
            con.close ( ) ;
        }

        private static void exit(Statement state, Connection con) throws SQLException {
            state.close();
            con.close();
            System.out.println("See you later!");
            System.exit(0);
        }

        private static int getPractitioner(BufferedReader reader, Statement state, Connection con, String input) throws IOException, SQLException {
            int pracid = 0;

            while(pracid == 0) {
                if (input.equals("E")) exit(state, con);

                try {
                    String querySQL = "SELECT pracid from midwives WHERE pracid = " + input;
                    ResultSet rs = state.executeQuery(querySQL);

                    while (rs.next()) {
                        pracid = rs.getInt("pracid");
                    }
                    if (pracid == 0) {
                        System.out.println("The practitioner ID does not exist in the database. Try again!");
                        input = reader.readLine();
                    }
                    rs.close();
                }
                catch (SQLException e)
                {
                    int sqlCode = e.getErrorCode(); // Get SQLCODE
                    String sqlState = e.getSQLState(); // Get SQLSTATE

                    System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                    System.out.println(e);
                }
            }
            return pracid;
        }

        private static Dictionary getAppointments(BufferedReader reader, Connection con, int pracid, String input) throws IOException {
            Time time;
            String mother;
            int hcard;
            int prim;
            int appid;
            int index = 1;
            int cid;
            int pregnum;
            String position;
            Dictionary dict = new Hashtable();

            Date dflt = Date.valueOf("2000-01-01");
            Date date = dflt;

            while (date.compareTo(dflt) == 0) {

                try {
                    String querySQL = "SELECT a.appid, a.date, a.time, p.hcardid, p.name, c.prim, c.cid, c.pregnum " +
                            "FROM appointments a " +
                            "INNER JOIN couples c ON c.cid = a.cid AND c.pregnum = a.pregnum " +
                            "INNER JOIN midwives m ON m.pracid = a.pracid " +
                            "INNER JOIN mothers m2 ON c.cid = m2.cid AND c.pregnum = m2.pregnum " +
                            "INNER JOIN parents p ON p.hcardid = m2.hcardid " +
                            "WHERE a.date = ?";
                    PreparedStatement ps = con.prepareStatement(querySQL);
                    ps.setDate(1,Date.valueOf(input));
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                        appid = rs.getInt("appid");
                        time = rs.getTime("time");
                        date = rs.getDate("date");
                        mother = rs.getString("name");
                        hcard = rs.getInt("hcardid");
                        prim = rs.getInt("prim");
                        cid = rs.getInt("cid");
                        pregnum = rs.getInt("pregnum");

                        if (pracid == prim) position = "P";
                        else position = "B";

                        dict.put(index, new String[]{Integer.toString(appid),Integer.toString(cid),Integer.toString(pregnum),mother,Integer.toString(hcard)});

                        System.out.println(index + ":\t" + time + " " + position + " " + mother + " " + hcard);
                        index++;
                    }
                    if (date.compareTo(dflt) == 0) {
                        System.out.println("No appointment exists for the given date. Try again!");
                        input = reader.readLine();
                    }
                    rs.close();

                }
                catch (SQLException e)
                {
                    int sqlCode = e.getErrorCode(); // Get SQLCODE
                    String sqlState = e.getSQLState(); // Get SQLSTATE

                    System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                    System.out.println(e);
                }
            }
            return dict;
        }

        private static void reviewNotes(Statement state, int cid, int pregnum) {
            Date date;
            Time time;
            String body;

            try {
                String querySQL = "SELECT n.date, n.time, n.body " +
                        "FROM notes n INNER JOIN appointments a ON a.appid = n.appid " +
                        "INNER JOIN couples c ON c.cid = a.cid AND c.pregnum = a.pregnum " +
                        "WHERE c.cid =  " + cid +
                        " AND c.pregnum =  " + pregnum +
                        " ORDER BY date DESC, time DESC";
                ResultSet rs = state.executeQuery(querySQL);

                while (rs.next()) {
                    time = rs.getTime("time");
                    date = rs.getDate("date");
                    body = rs.getString("body");

                    System.out.println(date + " " + time + " " + body);
                }
                rs.close();
            }
            catch (SQLException e)
            {
                int sqlCode = e.getErrorCode(); // Get SQLCODE
                String sqlState = e.getSQLState(); // Get SQLSTATE

                System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                System.out.println(e);
            }
        }

        private static void reviewTests(Statement state, int cid, int pregnum) {
            Date date;
            String type;
            String result;

            try {
                String querySQL = "SELECT t.prescdate, t.type, t.result " +
                        "FROM tests t INNER JOIN appointments a ON a.appid = t.appid " +
                        "INNER JOIN couples c ON c.cid = a.cid AND c.pregnum = a.pregnum " +
                        "WHERE c.cid =  " + cid +
                        " AND c.pregnum =  " + pregnum +
                        " ORDER BY prescdate DESC";
                ResultSet rs = state.executeQuery(querySQL);

                while (rs.next()) {
                    date = rs.getDate("prescdate");
                    type = rs.getString("type");
                    result = rs.getString("result");

                    if (result == null) result = "PENDING";

                    System.out.println(date + " " + "[" + type + "]" + " " + result);
                }
                rs.close();
            }
            catch (SQLException e)
            {
                int sqlCode = e.getErrorCode(); // Get SQLCODE
                String sqlState = e.getSQLState(); // Get SQLSTATE

                System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                System.out.println(e);
            }
        }

        private static void addNotes(Connection con, int appid, int pracid, String body) {
            long milis = System.currentTimeMillis();
            Date date = new Date(milis);
            Time time = new Time(milis);

            Random random = new Random();
            int nid = random.nextInt(9000);

            try {
                String querySQL = "INSERT INTO notes VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(querySQL);
                ps.setInt(1,nid);
                ps.setDate(2,date);
                ps.setTime(3, time);
                ps.setString(4, body);
                ps.setInt(5, appid);
                ps.setInt(6, pracid);
                ps.executeUpdate();
            }
            catch (SQLException e)
            {
                int sqlCode = e.getErrorCode(); // Get SQLCODE
                String sqlState = e.getSQLState(); // Get SQLSTATE

                System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                System.out.println(e);
            }
        }

        private static void addTests(Connection con, String type, int appid, int pracid) {
            long milis = System.currentTimeMillis();
            Date prescdate = new Date(milis);

            Random random = new Random();
            int tid = random.nextInt(10000);

            try {
                String querySQL = "INSERT INTO tests (tid, prescdate, type, appid, pracid) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(querySQL);
                ps.setInt(1, tid);
                ps.setDate(2, prescdate);
                ps.setString(3, type);
                ps.setInt(4, appid);
                ps.setInt(5, pracid);
                ps.executeUpdate();
            }
            catch (SQLException e)
            {
                int sqlCode = e.getErrorCode(); // Get SQLCODE
                String sqlState = e.getSQLState(); // Get SQLSTATE

                System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                System.out.println(e);
            }
        }
    }
