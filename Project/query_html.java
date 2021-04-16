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
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import javax.json.*;

public class query_html extends HttpServlet{
    /* Name of your table */
    final static String tableName = "SpotifyMusic";
    static String q= null;



    /* Create a NoSQL handle to access the cloud service - to connect to the cloud database*/
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

    /* To delete a row from code database */
    private static List<MapValue> deleteRow(NoSQLHandle handle,HttpServletRequest request) throws Exception {

        
        
        List<MapValue> results=new ArrayList<>();
        
        try{
        
        String id=request.getParameter("deleteID");
            

        String query="Delete from SpotifyMusic where ID='"+id+"'"; 
        // q=query;
        QueryRequest queryRequest = new QueryRequest().setStatement(query);
        
        
        QueryResult queryResult=null;
            //do{
                    queryResult = handle.query(queryRequest);
                    results = queryResult.getResults();
                    
            //}while (!queryRequest.isDone());
        }
        catch(Exception iae){
            iae.printStackTrace();
        }
        
        return results;

    }
/* code to insert values into the database */
  private static List<MapValue> writeRows(NoSQLHandle handle,HttpServletRequest request) throws Exception {       
        List<MapValue> list=new ArrayList<>();
       
        try{

            String id=request.getParameter("insertID");
                String artists=request.getParameter("insertArtist");
                String song=request.getParameter("insertSongName");
                String year=request.getParameter("insertYear");
                String duration=request.getParameter("insertTime");
                String popularity=request.getParameter("insertPop");
                String key=request.getParameter("insertKey");
                String mode=request.getParameter("insertMode");
                
                Integer years=Integer.valueOf(year);
                Long durs=Long.parseLong(duration);
                Integer popular=Integer.valueOf(popularity);
                Integer keys=Integer.valueOf(key);
                Integer modes=Integer.valueOf(mode);
          
                QueryRequest queryRequest = new QueryRequest().setStatement("select * from spotifymusic where id='"+id+"'");
                List<MapValue> results1=new ArrayList<>();
                QueryResult queryResult=null;
                do{
                    queryResult = handle.query(queryRequest);
                    results1 = queryResult.getResults();
                
                }while (!queryRequest.isDone());
            
                if(results1.toString().contains("ID"))
                    throw new IllegalArgumentException();
                MapValue value =new MapValue().put("ID", id).put("Artists",artists).put("Songname", song).put("Year",years).put("Durationms",durs).put("Popularity",popular).put("Key",keys).put("Mode",modes);
                list.add(value);
                PutRequest putRequest =new PutRequest().setValue(value).setTableName(tableName);
                PutResult putResult = handle.put(putRequest);
                
                if (putResult.getVersion() != null) 
                {
                    System.out.println("Wrote values");
                } 
                else 
                {
                    System.out.println("Put failed");
                }

            
        }
        catch(IllegalArgumentException iae){
            //iae.printStackTrace();
            List<MapValue> l=new ArrayList<>();
            MapValue value =new MapValue().put("Error", "id");
            l.add(value);
            return l;
        }
        return list;

        
        
    }
//  code to update rows in the database  
    private static List<MapValue> updateRows(NoSQLHandle handle,HttpServletRequest request) throws Exception {
        List<MapValue> results=new ArrayList<>();
        try{
            String id=request.getParameter("updateID");
                String artists=request.getParameter("updateArtist");
                String song=request.getParameter("updateSongName");
                String year=request.getParameter("updateYear");
                String duration=request.getParameter("updateTime");
                String popularity=request.getParameter("updatePopularity");
                String key=request.getParameter("updateKey");
                String mode=request.getParameter("updateMode");
 
            int flag=0;
            String cols="";
            if(artists.length()!=0)
            {
                cols=cols+"SET Artists='"+artists+"',";
            }
            if(song.length()!=0)
            {
                cols=cols+"SET Songname='"+song+"',";
            }
            if(year.length()!=0)
            {
                Integer years=Integer.valueOf(year);
                cols=cols+"SET Year="+years+",";
            }
            if(duration.length()!=0)
            {
                Long durs=Long.parseLong(duration);
                cols=cols+"SET Durationms="+durs+",";
            }
            if(popularity.length()!=0)
            {
                Integer popular=Integer.valueOf(popularity);
                cols=cols+"SET Popularity="+popular+",";
            }
            if(key.length()!=0)
            {
                Integer keys=Integer.valueOf(key);
                cols=cols+"SET Key="+keys+",";
            }
            if(mode.length()!=0)
            {
                flag=1;
                Integer modes=Integer.valueOf(mode);

                cols=cols+"SET Mode="+modes;
            }
            int len=cols.length();
            if(flag==0)
                cols = cols.substring(0, cols.lastIndexOf(","));
            

            //return cols;
//            Integer modes=Integer.valueOf(mode);
            String query="Update SpotifyMusic "+cols+" where ID='"+id+"'";
            q=query;
            QueryRequest queryRequest = new QueryRequest().setStatement(query);
            
            QueryResult queryResult=null;
            do{
                    queryResult = handle.query(queryRequest);
                    results = queryResult.getResults();

            }while (!queryRequest.isDone());
        }
catch(Exception iae){
            iae.printStackTrace();
        }
        return results;
    }
    
    
    //code to display the data in the database
    private static List<MapValue> display(NoSQLHandle handle,HttpServletRequest request) throws Exception {
       
        String query=request.getParameter("queryArea");
       
        QueryRequest queryRequest = new QueryRequest().setStatement(query);
        q=query;
        List<MapValue> results=new ArrayList<>();
        QueryResult queryResult=null;
            do{
                    queryResult = handle.query(queryRequest);
                    results = queryResult.getResults();
                    
            }while (!queryRequest.isDone());
        
        return results;
                

    }
    // to handle submit request in the web application
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  

PrintWriter out = response.getWriter();
      String operations=request.getParameter("operations");
        
        
        
        
       String id=request.getParameter("updateID");
                String artists=request.getParameter("updateArtist");
                String song=request.getParameter("updateSongName");
                String year=request.getParameter("updateYear");
                String duration=request.getParameter("updateTime");
                String popularity=request.getParameter("updatePopularity");
                String key=request.getParameter("updateKey");
                String mode=request.getParameter("updateMode");
        
                
String x=id+"   "+artists+"   "+song+"   "+year+"   "+duration+"   "+popularity+"   "+key+"   "+mode;
        
      try{
      NoSQLHandle handle=generateNoSQLHandle();
      List<MapValue> result=null;
      boolean idexists;
//      String results="";
      switch(operations)
      {
            case "update":
              
	          result=updateRows(handle,request);
              out.println(x);
              break;
            case "insert":
              
	           result=writeRows(handle,request);
              
               break;
	        case "delete":
	           result=deleteRow(handle,request);
               break;
              
	        
            case "query":
	           result=display(handle,request);
              break;
        
      }
          
          
          String destination = "display.jsp";
          RequestDispatcher requestDispatcher = request.getRequestDispatcher(destination);
          
          request.setAttribute("result", result.toString());
          requestDispatcher.forward(request, response);
          
          
          
     }
     catch (Exception exp)
     {
        System.err.print(exp);    
     } 


}  
}
