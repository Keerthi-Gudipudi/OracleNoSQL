import java.io.*;
import java.util.*;
import oracle.nosql.driver.NoSQLHandle;
import oracle.nosql.driver.NoSQLHandleConfig;
import oracle.nosql.driver.NoSQLHandleFactory;
import oracle.nosql.driver.Region;
import oracle.nosql.driver.iam.SignatureProvider;
import oracle.nosql.driver.ops.GetRequest;
import oracle.nosql.driver.ops.QueryRequest;
import oracle.nosql.driver.ops.QueryResult;
import oracle.nosql.driver.ops.DeleteRequest;
import oracle.nosql.driver.ops.DeleteResult;
import oracle.nosql.driver.ops.GetResult;
import oracle.nosql.driver.ops.PutRequest;
import oracle.nosql.driver.ops.PutResult;
import oracle.nosql.driver.ops.TableLimits;
import oracle.nosql.driver.ops.TableRequest;
import oracle.nosql.driver.ops.TableResult;
import oracle.nosql.driver.values.MapValue;
import oracle.nosql.driver.values.FieldValue;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import javax.json.*;

public class query_Text extends HttpServlet{
    /* Name of your table */
    static String q= null;
    final static String tableName = "SpotifyMusic";


    /* Create a NoSQL handle to access the cloud service - to connect to the database*/
    private static NoSQLHandle generateNoSQLHandle() throws Exception {

        SignatureProvider ap = new SignatureProvider(
                "ocid1.tenancy.oc1..aaaaaaaa73lwbbrquuvystds3joc7hnss7okjqaulifgj3nybb3c45qv7mba",
                "ocid1.user.oc1..aaaaaaaan4j4asabvoqh26gcguyvqcptfx7aaswywotguval7265ut5vxpqq",
                "6e:a1:1e:00:fc:24:5b:fd:06:ac:0e:f4:11:8d:33:ff",
                new File("/Users/keerthigudipudi/desktop/users/oracleidentitycloudservice_kgudipudi-03-18-02-58.pem"),
                "null".toCharArray());

        /* Create a NoSQL handle to access the cloud service */
        NoSQLHandleConfig config = new NoSQLHandleConfig(
                Region.US_SANJOSE_1, ap);
        NoSQLHandle handle = NoSQLHandleFactory.createNoSQLHandle(config);
        return handle;
    }
// To display the result from database table
    private static List<MapValue> display(NoSQLHandle handle,String query) throws Exception {
       
        
        
        QueryRequest queryRequest = new QueryRequest().setStatement(query);
        queryRequest.setLimit(1000);
        //q=q+String.valueOf(queryRequest.getLimit())+"\\\\\\"+String.valueOf(queryRequest.getMaxReadKB());
        String results1=null;
        List<MapValue> results=new ArrayList<>();
        QueryResult queryResult=null;
            do{
                    queryResult = handle.query(queryRequest);
                    results = queryResult.getResults();
                results1=results1+results.toString();
            }while (!queryRequest.isDone());
       
        return results;
                

    }
        
// To handle requests from the web application
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  


      //String operations=request.getParameter("ops");
      //String query=request.getParameter("query");
    String op=request.getParameter("visualization");
        String query=null;
    if(Character.toLowerCase(op.charAt(0)) == '1')
    query="select Year,count(songname) from spotifymusic group by year";
        
    if(Character.toLowerCase(op.charAt(0)) == '2')
    query="select Artists,count(Songname) as count from spotifymusic group by Artists ORDER BY count(Songname) ";
    if(Character.toLowerCase(op.charAt(0)) == '3')
        query="SELECT Artists,mode,count(songname) FROM SpotifyMusic group by artists,mode";
    if(Character.toLowerCase(op.charAt(0)) == '4')
        query="SELECT Artists,key,count(songname) FROM SpotifyMusic group by artists,key";
    
      try{
      NoSQLHandle handle=generateNoSQLHandle();
      //List<MapValue> result=display(handle,query);
          List<MapValue> result=display(handle,query);
      
          String destination = "show.jsp";
          RequestDispatcher requestDispatcher = request.getRequestDispatcher(destination);
          
          request.setAttribute("result", result);
          request.setAttribute("op", op);
          requestDispatcher.forward(request, response);
        

     }
     catch (Exception exp)
     {
        System.err.print(exp);    
     } 


}  
}
