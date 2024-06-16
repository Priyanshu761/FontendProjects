<%@ page import="java.sql.*,java.io.*" %>
<%
    // Database connection details
    String url = "jdbc:mysql://localhost:3306/hotel_reservations";
    String username = "your_db_username";
    String password = "your_db_password";

    // Retrieve form data
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String checkIn = request.getParameter("checkIn");
    String checkOut = request.getParameter("checkOut");
    String roomType = request.getParameter("roomType");
    int guests = Integer.parseInt(request.getParameter("guests"));
    String payment = request.getParameter("payment");
    String paymentDetail = request.getParameter("paymentDetail");

    // Payment details based on the selected payment method
    String paymentDetailValue = "";
    if (payment.equals("credit_card") || payment.equals("debit_card")) {
        paymentDetailValue = request.getParameter("cardNumber");
    } else if (payment.equals("paypal")) {
        paymentDetailValue = request.getParameter("paypalEmail");
    }

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish database connection
        conn = DriverManager.getConnection(url, username, password);

        // Insert reservation data into the database
        String sql = "INSERT INTO reservations (name, email, phone, check_in, check_out, room_type, guests, payment_method, payment_detail) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, phone);
        pstmt.setString(4, checkIn);
        pstmt.setString(5, checkOut);
        pstmt.setString(6, roomType);
        pstmt.setInt(7, guests);
        pstmt.setString(8, payment);
        pstmt.setString(9, paymentDetailValue);

        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            // Successfully inserted the reservation data
            out.println("Reservation successfully submitted. Thank you, " + name + "!");
        } else {
            out.println("Failed to submit the reservation. Please try again.");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred while processing the reservation. Please try again.");
    } finally {
       
