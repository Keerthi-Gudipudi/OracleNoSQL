<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="./insert.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>


    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="http://malsup.github.com/jquery.form.js"></script>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #4a919e; color:white;">


        <div style="margin-left: 25%;" id="navbarNavDropdown">
            <h1>Oracle NoSQL CRUD and Visualizations</h1>
        </div>
    </nav>

    <div class="center_div">

        <label for="operation">Operation</label>
        <select class="custom-select" name="operations" id="operation">
            <option selected>Choose...</option>
            <option value="insert">Insert</option>
            <option value="update">Update</option>
            <option value="delete">Delete</option>
            <option value="query">Query</option>
            <option value="visual-result">Visualizations</option>
        </select>

    </div>

    <div class="container center_div" style='display:none;' id="insert_div">
        <form class="form-control-lg form-row align-items-center" method="post" action="queryhtml">
            <div class="center_div">

                <label name="operations" for="operation">Insert Operation</label>
                <input type="hidden" value='insert' name="operations">

            </div>
            <div class="input-group required form_div col-auto my-1">
                <label for="insertID" class="mr-sm-2 between_fields">ID: </label>
                <input type="text" class="mr-sm-2 form-control" name="insertID" required>
            </div>

            <div class="input-group required form_div form_div col-auto my-1 ">
                <label for="insertArtist" class="mr-sm-2 between_fields">Artist: </label>
                <input type="text" class="mr-sm-2 form-control" name="insertArtist" required>
            </div>
            <div class="input-group required form_div form_div col-auto my-1">
                <label for="insertSongName" class="mr-sm-2  between_fields">Song Name: </label>
                <input type="text" class="mr-sm-2  form-control" name="insertSongName" required>
            </div>

            <div class="input-group required form_div form_div col-auto my-1">
                <label for="insertYear" class="mr-sm-2  between_fields">Year: </label>
                <input type="text" class="mr-sm-2  form-control" name="insertYear" required>
            </div>
            <div class="input-group required form_div form_div col-auto my-1 ">
                <label for="insertTime" class="mr-sm-2  between_fields">Time(ms): </label>
                <input type="text" class="mr-sm-2  form-control" name="insertTime" required>
            </div>
            <div class="input-group required form_div form_div col-auto my-1">
                <label for="insertPop" class="mr-sm-2  between_fields">Popularity: </label>
                <input type="text" class="mr-sm-2 form-control" name="insertPop" required>
            </div>
            <div class="input-group required form_div form_div col-auto my-1 ">
                <label for="insertKey" class="mr-sm-2  between_fields">Key: </label>
                <input type="text" class="mr-sm-2 form-control" name="insertKey" required>
            </div>
            <div class="input-group form_div required form_div col-auto my-1 ">
                <label for="insertMode" class="mr-sm-2  between_fields">Mode: </label>
                <input type="text" class="mr-sm-2 form-control" name="insertMode" required>
            </div>


            <!--<div class="form-group">
                <label for="queryArea">Enter the query</label>
                <textarea class="form-control" id="queryArea" rows="3"></textarea>
            </div>-->
            <button type="submit" class="  form_div col-auto my-1 btn btn-primary mb-2">Submit</button>
        </form>
    </div>


    <div class="container center_div" style='display:none;' id="delete_div">
        <form class="form-control-lg form-row align-items-center" method="post" action="queryhtml">
            <label name="operations" for="operation">Delete Operation</label>
            <input type="hidden" value='delete' name="operations">
            <div class="input-group required form_div col-auto my-1">
                <label for="insertID" class="mr-sm-2 between_fields">ID: </label>
                <input type="text" class="mr-sm-2 form-control" name="deleteID" id="deleteID" requiredrequired>
            </div>

            <!--<div class="form-group">
                <label for="queryArea">Enter the query</label>
                <textarea class="form-control" id="queryArea" rows="3"></textarea>
            </div>-->
            <button type="submit" class="  form_div col-auto my-1 btn btn-primary mb-2">Submit</button>
        </form>
    </div>


    <div class="container center_div" style='display:none;' id="update_div">
        <form class="form-control-lg form-row align-items-center" method="post" action="queryhtml">
            <label name="operations" for="operation">Update Operation</label>
            <input type="hidden" value='update' name="operations">
            <div class="input-group required form_div col-auto my-1">
                <label for="insertID" class="mr-sm-2 between_fields">ID: </label>
                <input type="text" class="mr-sm-2 form-control" name="updateID" id="updateID" required>
            </div>

            <div class="input-group form_div form_div col-auto my-1 ">
                <label for="insertArtist" class="mr-sm-2 between_fields">Artist: </label>
                <input type="text" class="mr-sm-2 form-control" name="updateArtist" id="updateArtist">
            </div>
            <div class="input-group form_div form_div col-auto my-1">
                <label for="insertSongName" class="mr-sm-2  between_fields">Song Name: </label>
                <input type="text" class="mr-sm-2  form-control" name="updateSongName" id="updateSongName">
            </div>

            <div class="input-group form_div form_div col-auto my-1">
                <label for="insertYear" class="mr-sm-2  between_fields">Year: </label>
                <input type="text" class="mr-sm-2  form-control" name="updateYear" id="updateYear">
            </div>
            <div class="input-group form_div form_div col-auto my-1 ">
                <label for="insertTime" class="mr-sm-2  between_fields">Time(ms): </label>
                <input type="text" class="mr-sm-2  form-control" name="updateTime" id="updateTime">
            </div>
            <div class="input-group form_div form_div col-auto my-1">
                <label for="insertPop" class="mr-sm-2  between_fields">Popularity: </label>
                <input type="text" class="mr-sm-2 form-control" name="updatePopularity" id="updatePopularity">
            </div>
            <div class="input-group form_div form_div col-auto my-1 ">
                <label for="insertKey" class="mr-sm-2  between_fields">Key: </label>
                <input type="text" class="mr-sm-2 form-control" name="updateKey" id="updateKey">
            </div>
            <div class="input-group form_div form_div col-auto my-1 ">
                <label for="insertMode" class="mr-sm-2  between_fields">Mode: </label>
                <input type="text" class="mr-sm-2 form-control" name="updateMode" id="updateMode">
            </div>


            <!--<div class="form-group">
                <label for="queryArea">Enter the query</label>
                <textarea class="form-control" id="queryArea" rows="3"></textarea>
            </div>-->
            <button type="submit" class="  form_div col-auto my-1 btn btn-primary mb-2">Submit</button>
        </form>
    </div>
    <div class="container center_div" style='display:none;' id="query_div">
        <form class="form-control-lg form-row align-items-center" method="post" action="queryhtml">
            <label name="operations" for="operation">Enter the query</label>
            <input type="hidden" value='query' name="operations">

            <textarea class="form-control" name='queryArea' id="queryArea" rows="3"></textarea>
            <button type="submit" class="  form_div col-auto my-1 btn btn-primary mb-2">Submit</button>
        </form>
    </div>
    <div class='center_div2  table-responsive' id="main-div" style="padding-top: 2%">
        <table id='result_table_div' class='table table-bordered table-hover table-sm' style="display: none">
            <thead class="thead-light" id="result_head">

            </thead>
            <tbody id="result_body">

            </tbody>
        </table>
    </div>


    <div class='center_div2 ' id="update-result_div" style="padding-top: 2%" style="display: none">
    </div>


    <div class='center_div2 ' id="visual-result_div" style="padding-top: 2%; display: none">
        <form class="form-control-lg form-row align-items-center" method="post" action="queries">
            <select class="custom-select" name="visualization" id="visualization">
                <option selected>Select Visualization</option>
                <option name='1' value="1">Songs/year</option>
                <option name='2' value="2">Top artists</option>
                <option name='3' value="3">Mode Preference for each artist</option>
                <option name='4' value="4">Key Preference for each artist</option>

            </select>
            <button type="submit" class="  form_div col-auto my-1 btn btn-primary mb-2">Generate</button>
        </form>
        
        

        <div class="container center_div" style='display:none;' id="1">
        <canvas id="canvas" width="100" height="50"></canvas>
        </div>
        <div class="container center_div" style='display:none;' id="2">
        <canvas id="canvas2" width="100" height="50"></canvas>
        </div>
        <div class="container center_div" style='display:none;' id="3"></div>
        <div class="container center_div" style='display:none;' id="4"></div>

    </div>
</body>
<script src='./insert.js'></script>
<script>
    
    function set() {
        var e = document.getElementById("visualization");

        var d = ["1", "2", "3", "4"]
        e.onchange = function() {

            var selected_div = e.value;

            for (i in d) {
                if (d[i] != e.value) {

                    var div_name = d[i]
                    //console.log(div_name)
                    document.getElementById(div_name).style.display = "none"
                }
            }
            var hiddenDiv = document.getElementById(selected_div);
            if (hiddenDiv.style.display == "none")
                hiddenDiv.style.display = "block"
            else
                hiddenDiv.style.display = "none"

            //<%
            //                    query_Text q = new query_Text(); %>

        }
        var val = $('#visualization option:selected').val();
        if(val=='1')
        {
            console.log('x')
        }
    }
        $(document).ready(function() {
            set()        
            if((document.getElementById("operation").value=='visual-result'))
                document.getElementById("visual-result_div").style.display="block"
            var value = '${result}';
            
            //console.log(flag)
            console.log(value)
            //&& document.getElementById('result_table').style.display=='none' && document.getElementById('insert_div').style.display=='block' 
            if (value != '') {
                
                    var item = JSON.parse(value);
                console.log(item)
                    for (i in item) {
                        if (item[i].NumRowsUpdated != undefined)
                            alert("No.of updated rows= " + item[i].NumRowsUpdated)
                        else if (item[i].numRowsDeleted != undefined)
                            alert("No.of rows deleted= " + item[i].numRowsDeleted)
                        else if(item[i].Error!=undefined)
                            alert("Error while performing operation")
                        else if (item[i].Column_1 != undefined) {

                            var tbody = document.getElementById("result_body")
                            var th = document.getElementById("result_head")
                            var tr1 = document.createElement('tr');

                            if (i == 0) {
                                keys = Object.keys(item[0])
                                for (j in keys) {
                                    var td1 = document.createElement('th');
                                    td1.appendChild(document.createTextNode(keys[j]))
                                    tr1.appendChild(td1)
                                }
                                th.appendChild(tr1);

                            }
                            console.log(item[i][keys[0]])
                            var tr = document.createElement('tr');
                            for (j in keys) {
                                var td1 = document.createElement('td');
                                td1.appendChild(document.createTextNode(item[i][keys[j]]))
                                tr.appendChild(td1)
                            }
                            tbody.appendChild(tr);
                            document.getElementById('result_table_div').style.display = "block"
                            //alert("Total rows count= "+item[i].Column_1)
                        } else {


                            if (i == 0) {
                                console.log(item[0])
                                var tbody = document.getElementById("result_body")
                                var th = document.getElementById("result_head")
                                var tr1 = document.createElement('tr');


                                if (item[i].id != undefined || item[i].Id != undefined || item[i].ID != undefined) {
                                    var td1 = document.createElement('th');
                                    td1.appendChild(document.createTextNode("ID"))
                                    tr1.appendChild(td1)
                                }

                                if (item[i].artists != undefined || item[i].Artists != undefined) {
                                    var td2 = document.createElement('th');
                                    td2.appendChild(document.createTextNode("Artists"))
                                    tr1.appendChild(td2)
                                }
                                if (item[i].songname != undefined || item[i].Songname != undefined) {
                                    var td3 = document.createElement('th');
                                    td3.appendChild(document.createTextNode("Songname"))
                                    tr1.appendChild(td3)
                                }
                                if (item[i].year != undefined || item[i].Year != undefined) {
                                    var td4 = document.createElement('th');
                                    td4.appendChild(document.createTextNode("Year"))
                                    tr1.appendChild(td4)
                                }
                                if (item[i].durationms != undefined || item[i].Durationms != undefined) {
                                    var td5 = document.createElement('th');
                                    td5.appendChild(document.createTextNode("Durationms"))
                                    tr1.appendChild(td5)
                                }
                                if (item[i].popularity != undefined || item[i].Popularity != undefined) {
                                    var td6 = document.createElement('th');
                                    td6.appendChild(document.createTextNode("Popularity"))
                                    tr1.appendChild(td6)
                                }
                                if (item[i].key != undefined || item[i].Key != undefined) {
                                    var td7 = document.createElement('th');
                                    td7.appendChild(document.createTextNode("Key"))
                                    tr1.appendChild(td7)
                                }
                                if (item[i].mode != undefined || item[i].Mode != undefined) {
                                    var td8 = document.createElement('th');
                                    td8.appendChild(document.createTextNode("Mode"))
                                    tr1.appendChild(td8)
                                }

                                th.appendChild(tr1);
                                //tbody.appendChild(th);
                            }
                            var tr = document.createElement('tr');

                            if (item[i].id != undefined) {
                                var td1 = document.createElement('td');
                                td1.appendChild(document.createTextNode(item[i].id))
                                tr.appendChild(td1)
                            } else if (item[i].ID != undefined) {
                                var td1 = document.createElement('td');
                                td1.appendChild(document.createTextNode(item[i].ID))
                                tr.appendChild(td1)
                            }

                            if (item[i].artists != undefined) {
                                var td2 = document.createElement('td');
                                td2.appendChild(document.createTextNode(item[i].artists))
                                tr.appendChild(td2)
                            } else if (item[i].Artists != undefined) {
                                var td2 = document.createElement('td');
                                td2.appendChild(document.createTextNode(item[i].Artists))
                                tr.appendChild(td2)
                            }


                            if (item[i].songname != undefined) {
                                var td3 = document.createElement('td');
                                td3.appendChild(document.createTextNode(item[i].songname))
                                tr.appendChild(td3)
                            } else if (item[i].Songname != undefined) {
                                var td3 = document.createElement('td');
                                td3.appendChild(document.createTextNode(item[i].Songname))
                                tr.appendChild(td3)
                            }

                            if (item[i].year != undefined) {
                                var td4 = document.createElement('td');
                                td4.appendChild(document.createTextNode(item[i].year))
                                tr.appendChild(td4)
                            } else if (item[i].Year != undefined) {
                                var td4 = document.createElement('td');
                                td4.appendChild(document.createTextNode(item[i].Year))
                                tr.appendChild(td4)
                            }

                            if (item[i].durationms != undefined) {
                                var td5 = document.createElement('td');
                                td5.appendChild(document.createTextNode(item[i].durationms))
                                tr.appendChild(td5)
                            }
                            if (item[i].Durationms != undefined) {
                                var td5 = document.createElement('td');
                                td5.appendChild(document.createTextNode(item[i].Durationms))
                                tr.appendChild(td5)
                            }

                            if (item[i].popularity != undefined) {
                                var td6 = document.createElement('td');
                                td6.appendChild(document.createTextNode(item[i].popularity))
                                tr.appendChild(td6)
                            } else if (item[i].Popularity != undefined) {
                                var td6 = document.createElement('td');
                                td6.appendChild(document.createTextNode(item[i].Popularity))
                                tr.appendChild(td6)
                            }


                            if (item[i].key != undefined) {
                                var td7 = document.createElement('td');
                                td7.appendChild(document.createTextNode(item[i].key))
                                tr.appendChild(td7)
                            }
                            if (item[i].Key != undefined) {
                                var td7 = document.createElement('td');
                                td7.appendChild(document.createTextNode(item[i].Key))
                                tr.appendChild(td7)
                            }

                            if (item[i].mode != undefined) {
                                var td7 = document.createElement('td');
                                td7.appendChild(document.createTextNode(item[i].mode))
                                tr.appendChild(td7)
                            } else if (item[i].Mode != undefined) {
                                var td7 = document.createElement('td');
                                td7.appendChild(document.createTextNode(item[i].Mode))
                                tr.appendChild(td7)
                            }


                            tbody.appendChild(tr);
                            document.getElementById('result_table_div').style.display = "block"
                        }
                    }
                }
            
                
            
        });
</script>

</html>