<?php

## NON OC
$LittleFloat = [644000,724000,788000,868000,1068000];
$LittleA = [704000,724000,724000,788000,868000,1068000,1068000,1068000];
$LittleB = [580000,588000,596000,652000,712000,744000,784000,844000];

$BigFloat = [724000,788000,868000,988000,1068000];
$BigA = [704000,724000,724000,724000,788000,868000,988000,988000,1068000];
$BigB = [572000,580000,588000,596000,652000,712000,744000,784000,844000];

$GPUFloat = [585000,645000,725000,790000,870000,925000];
$GPUA = [585000,645000,725000,790000,870000,925000,1070000];
$GPUB = [504000,504000,596000,652000,712000,744000,1070000];

## OC
// $LittleFloat = [644000,724000,788000,868000,988000,1068000,1148000,1228000,1308000,1388000];
// $LittleA = [704000,724000,724000,788000,868000,1068000,1068000,1068000,1068000,1148000,1148000,1228000,1228000,1308000];
// $LittleB = [580000,588000,596000,652000,712000,744000,784000,844000,884000,944000,984000,1044000,1084000,1144000];

// $BigFloat = [724000,788000,868000,988000,1068000,1148000,1228000,1308000,1388000];
// $BigA = [704000,724000,724000,724000,788000,868000,988000,988000,1068000,1068000,1148000,1148000,1228000,1228000,1308000,1308000,1388000];
// $BigB = [572000,580000,588000,596000,652000,712000,744000,784000,844000,884000,944000,984000,1044000,1084000,1144000,1184000,1244000];

// $GPUA = [585000,645000,725000,790000,870000,925000,1070000,1205000];
// $GPUFloat = $GPUA;
// $GPUB = [504000,504000,596000,652000,712000,744000,1070000,1205000];

$cpuVoltage = 95000;
$gpuVoltage = 80000;

# 1mV = 1000
# 10mV = 10000

function PakeEnter($data,$Uv=0,$limit = 3){
    $returnVal = "";
    $no=1;
    foreach ($data as $isiNya) {
        # code...
        $getVal = ($isiNya-$Uv);
        if ($no > 1) {
            # code...
            if (strlen($getVal) > 6) {
                # code...
                $returnVal .= "&nbsp;";
            } else {
                # code...
                $returnVal .= "&nbsp;&nbsp;";
            }
            
        }
        $returnVal .= $getVal;
        if ($no == $limit) {
            # code...
            $no = 1;
            $returnVal .= "<br>\n";
        } else {
            # code...
            $no ++;
        }
        
    }
    return $returnVal;  

}

function PakeKoma($data,$Uv=0){
    $returnVal = "";
    asort($data);
    $IsiSebelomnya = 0;
    foreach ($data as $isiNya) {
        # code...
        if ($IsiSebelomnya < $isiNya) {
            # code...
            $getVal = ($isiNya-$Uv);
            $returnVal .= $getVal;
            $returnVal .= ",<br>\n";
            $IsiSebelomnya = $isiNya;
        }
    }
    return $returnVal;
}

## GPU
echo "<hr>";
echo "GPU float : <br>\n". PakeKoma($GPUFloat,$gpuVoltage)."<br>\n<br>\n";
echo "GPU float : <br>\n". PakeEnter($GPUA,$gpuVoltage,4)."<br>\n<br>\n";
echo "GPU float : <br>\n". PakeEnter($GPUB,$gpuVoltage,4)."<br>\n<br>\n";

## Little
echo "<hr>";
echo "Little float : <br>\n". PakeKoma($LittleFloat,$cpuVoltage)."<br>\n<br>\n";
echo "Little float : <br>\n". PakeEnter($LittleA,$cpuVoltage)."<br>\n<br>\n";
echo "Little float : <br>\n". PakeEnter($LittleB,$cpuVoltage)."<br>\n<br>\n";

## Big
echo "<hr>";
echo "Big float : <br>\n". PakeKoma($BigFloat,$cpuVoltage)."<br>\n<br>\n";
echo "Big float : <br>\n". PakeEnter($BigA,$cpuVoltage)."<br>\n<br>\n";
echo "Big float : <br>\n". PakeEnter($BigB,$cpuVoltage)."<br>\n<br>\n";
