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

public class codetodump {
    /* Name of your table */
    final static String tableName = "SpotifyMusic";

    public static void main(String[] args) {
        NoSQLHandle handle = null;
        try {
            handle = generateNoSQLHandle();
            createTable(handle);
            writeRows(handle);
            
        } catch (Exception e) {
            System.err.print(e);
        } finally {
            handle.close();
        }
    }

    /* Create a NoSQL handle to access the cloud service  - to connect to the database*/
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

    /* code for creating the table in the cloud database*/
    private static void createTable(NoSQLHandle handle) throws Exception {
        String createTableDDL = "CREATE TABLE IF NOT EXISTS " +
                tableName + "(ID STRING,Artists STRING,Songname STRING,Year INTEGER,Durationms LONG,Popularity INTEGER,Key INTEGER,Mode INTEGER," +
                "PRIMARY KEY(ID))";

        TableLimits limits = new TableLimits(1, 2, 1);
        TableRequest treq = new TableRequest()
                .setStatement(createTableDDL).setTableLimits(limits);

        System.out.println("Creating table " + tableName);
        TableResult tres = handle.tableRequest(treq);

        /* The request is async,
          * so wait for the table to become active.
          */
        System.out.println("Waiting for "
                + tableName + " to become active");
        tres.waitForCompletion(handle, 60000, /* wait 60 sec */
                1000); /* delay ms for poll */
        System.out.println("Table " + tableName + " is active");
    }
    
    

    /* code for inserting 5300 rows into the cloud database SpotifyMusic table*/
    private static void writeRows(NoSQLHandle handle) throws Exception {
        
        String path="/Users/keerthigudipudi/Desktop/data.csv";
        String line="";
        try{
            BufferedReader br=new BufferedReader(new FileReader(path));
            line=br.readLine();
            System.out.println(line);
            

            while((line=br.readLine())!=null)
            {
                
                String[] values=line.split(",");
                Integer year=Integer.valueOf(values[3]);
                Long duration=Long.parseLong(values[4]);
                Integer popular=Integer.valueOf(values[5]);
                Integer key=Integer.valueOf(values[6]);
                Integer mode=Integer.valueOf(values[7]);
                
                MapValue value =new MapValue().put("ID", values[0]).put("Artists", values[1]).put("Songname", values[2]).put("Year",year).put("Durationms",duration).put("Popularity",popular).put("Key",key).put("Mode",mode);
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
        }
        catch(FileNotFoundException e){
            e.printStackTrace();
        }
        catch(IOException e){
            e.printStackTrace();
        }
        catch(IllegalArgumentException e){
            e.printStackTrace();
        }
        
        
    }
    
   
}
