import java.net.*;
import java.io.*;

public class contest {
	public static void main(String[] args) throws Exception {
		String url = "http://10.13.0.69:7878/testGet";
        	try {
			URL alert = new URL(url);
			HttpURLConnection con = (HttpURLConnection) alert.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("User-Agent", "chrome");
			int responseCode = con.getResponseCode();
			System.out.println("\nSending 'GET' request to URL : " + url);
			System.out.println("Response Code : " + responseCode);
		} 
		catch (IOException e) {
			e.printStackTrace();
		}				    	
	}
}
