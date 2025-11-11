package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class connectDB {
	 private static final String SERVER_NAME = "TIEN05\\SQLEXPRESS"; // Tên máy chủ SQL Server (giống file mẫu)
	    private static final String DATABASE_NAME = "QLNS";           // Tên cơ sở dữ liệu bạn tạo
	    private static final String USERNAME = "sa";                     // Tài khoản đăng nhập
	    private static final String PASSWORD = "123456";                 // Mật khẩu

	    // =============================
	    // Hàm kết nối tới SQL Server
	    // =============================
	    public static Connection getConnect() {
	        Connection connection = null;
	        try {
	            // Chuỗi kết nối SQL Server
	            String connectionURL = "jdbc:sqlserver://" + SERVER_NAME
	                    + ";databaseName=" + DATABASE_NAME
	                    + ";encrypt=true;trustServerCertificate=true;";

	            // Nạp driver JDBC của Microsoft
	            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

	            // Thực hiện kết nối
	            connection  = DriverManager.getConnection(connectionURL, USERNAME, PASSWORD);
	            System.out.println("✅ Kết nối SQL Server thành công!");
	        } catch (Exception e) {
	            System.out.println("❌ Kết nối thất bại!");
	            e.printStackTrace();
	        }
	        return connection;
	    }

	    // =============================
	    // Test kết nối
	    // =============================
	    public static void main(String[] args) {
	    	getConnect();
	    }
}