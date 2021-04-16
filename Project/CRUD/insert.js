var elem = document.getElementById("operation");
var divs=["insert","update","delete","query","visual-result","update-result","result_table"]
flag=0
elem.onchange = function(){
    var selected = elem.value+"_div";
    //console.log(selected)
    for(i in divs){
        if(divs[i]!=elem.value)
        {
            
        var div_name=divs[i]+"_div"
        //console.log(div_name)
        document.getElementById(div_name).style.display="none"
        }
    }
    var tableDiv = document.getElementById("result_table_div");
    console.log(tableDiv.style.display)
    if(tableDiv.style.display == "block") 
        tableDiv.style.display="none"
    else
        tableDiv.style.display="block"
    var hiddenDiv = document.getElementById(selected);
    if(hiddenDiv.style.display == "none") 
        hiddenDiv.style.display="block"
    else
    hiddenDiv.style.display="none"
    
    if(document.getElementById("update-result_div").style.display != "none")
    {
        flag=1;
    }
};
