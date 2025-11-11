package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import model.Product;

public class connectDB {
    private static final String URL =
        "jdbc:mysql://localhost:3306/qlns?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = ""; // nếu bạn có mật khẩu thì điền vào đây

    public static Connection getConnect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("✅ ĐÃ KẾT NỐI MySQL THÀNH CÔNG!");
            return c;
        } catch (ClassNotFoundException e) {
            System.err.println("❌ KHÔNG TÌM THẤY DRIVER MYSQL (thiếu file .jar)!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("❌ LỖI KHI KẾT NỐI MySQL:");
            e.printStackTrace(); // in ra lỗi thật
        }
        return null;
    }

	public List<Product> getProductByIdCate(int catalogId) {
		// TODO Auto-generated method stub
		return null;
	}
}
