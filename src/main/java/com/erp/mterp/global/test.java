package com.erp.mterp.global;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Servlet implementation class Test
 */
@WebServlet("/Test")
public class test extends HttpServlet {
    private static final long serialVersionUID = 1L;

    String API_KEY = "723d3227dc653f80a8e4beb87fadb693";
    String PASSWORD = "57349cecfe67899bdf44ac38683730b6";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        try {
            StringBuffer urlDomain = new StringBuffer("https://723d3227dc653f80a8e4beb87fadb693:57349cecfe67899bdf44ac38683730b6@croodseng.myshopify.com/admin/customers.json");

            // apikey and pwd hidden as security reason
            BufferedReader bufReader = null;
            URL urlConn = new URL(urlDomain.toString());
            HttpURLConnection httpURLConn = (HttpURLConnection) urlConn.openConnection();
            httpURLConn.addRequestProperty("X-Shopify-Access-Token", PASSWORD);
            httpURLConn.setRequestProperty("Content-Type", "application/json");
            httpURLConn.setRequestProperty("Accept", "application/json");
            httpURLConn.setRequestMethod("POST");
            httpURLConn.setDoInput(true);
            httpURLConn.setDoOutput(true);
            String data = "{\"customer\":{\"addresses\":[{\"zip\":\"\",\"country\":\"IN\",\"province\":\"\",\"city\":\"5\",\"address1\":\"\",\"last_name\":\"vbvbvb\",\"first_name\":\"vbvbvb\"}],\"phone\":\"\",\"last_name\":\"dfdf\",\"verified_email\":\"false\",\"first_name\":\"dfdf\",\"email\":\"\"}}";

            OutputStreamWriter wr = new OutputStreamWriter(httpURLConn.getOutputStream());
            wr.write(data);
            wr.flush();
            wr.close();
            // read the response
            InputStream in = new BufferedInputStream(httpURLConn.getInputStream());
            String result = "";//org.apache.commons.io.IOUtils.toString(in, "UTF-8");

            BufferedReader reader = new BufferedReader(new InputStreamReader(in));
            StringBuilder out = new StringBuilder();
            String line1;
            while ((line1 = reader.readLine()) != null) {
                out.append(line1);
            }
            System.out.println(out.toString());   //Prints the string content read from input stream
            reader.close();

            in.close();
            httpURLConn.disconnect();
	            
	            /*if ( httpURLConn.getResponseCode() == HttpURLConnection.HTTP_OK )
	                bufReader = new BufferedReader(new InputStreamReader(httpURLConn.getInputStream(), "UTF-8" ));
	            else {
	                System.out.println( "ErrorCode: " + httpURLConn.getResponseCode() );
	                bufReader = new BufferedReader(new InputStreamReader(httpURLConn.getErrorStream(), "UTF-8" ));
	            }
				String line = null;
				StringBuffer res = new StringBuffer();
				while ((line = bufReader.readLine()) != null) {
					res.append(line);
				}
				System.out.println(res.toString());*/
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.toString());
        }
	        
	        
	        
	      /*  String url = string.Format("https://{0}:{1}@{2}/admin/orders.json", APIKey, Password, ShopifyURL);

            var req = (HttpWebRequest)WebRequest.Create(url);
            req.Method = "GET";
            req.ContentType = "application/json";
            req.Headers.Add("X-Shopify-Access-Token", Password);

            using (var resp = (HttpWebResponse)req.GetResponse())
            {
                if (resp.StatusCode != HttpStatusCode.OK)
                {
                    string message = String.Format("Call failed. Received HTTP {0}", resp.StatusCode);
                    throw new ApplicationException(message);
                }

                var sr = new StreamReader(resp.GetResponseStream());
                response = sr.ReadToEnd();
            }*/
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
