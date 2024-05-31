import java.sql.*;
import javax.swing.JOptionPane;
public class Connection {
   Connection con=null;
   public static java.sql.Connection Dbconnection(){
	   try{
		   String username="divya";
		   String password="divya";
		   Class.forName("com.mysql.jdbc.Driver");
		   java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery?autoReconnect=true&useSSL=false", username, password);
		   return con;
	   }
	   catch(Exception e){
		   JOptionPane.showMessageDialog(null,e);
		   return null;
	   }
   }
   
}
