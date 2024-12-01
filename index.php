<?php
include 'connect.php';
$N='N';
$tier=0;
function save_build(){
        
        if($_POST['magic']) echo "<input type='hidden' name='magic' value='".$_POST['magic']."' />";
        if($_POST['weapon']) echo "<input type='hidden' name='weapon' value='".$_POST['weapon']."' />";
        if($_POST['body']) echo "<input type='hidden' name='body' value='".$_POST['body']."' />";
        if($_POST['head']) echo "<input type='hidden' name='head' value='".$_POST['head']."' />";
        if($_POST['wings']) echo "<input type='hidden' name='wings' value='".$_POST['wings']."' />";
        if($_POST['accessory']) echo "<input type='hidden' name='accessory' value='".$_POST['accessory']."' />";
}
$hero = $link->query("Select * from heroes;");
$materials = $link->query("Select * from materials;");
$recipes = $link->query("Select * from recipes;");

//loading
if($_POST['loadcode']) {
    $ll = preg_split("/-/", $_POST['loadcode']);
    
    $_POST['hero'] = $ll[0];
    $_POST['magic'] = $ll[1];
    $_POST['weapon'] = $ll[2];
    $_POST['body'] = $ll[3];
    $_POST['head'] = $ll[4];
    $_POST['wings'] = $ll[5];
    $_POST['accessory'] = $ll[6];
    $_POST['itype'] = 0;
    
}
//end loading

if($_POST['itemtype']){

    $ll = preg_split("/-/", $_POST['itemtype']);
    $_POST['item'] = $ll[0];
    $_POST['itype'] = $ll[1];

}


//1
echo "<div style='display:flex;'>";

//2
echo "<div style='width:50%;'>";

// player select
echo "Hero:<form method='POST'><select name='hero' onchange='this.form.submit()'><option value>select</option>";
foreach($hero as $val){
    echo "<option value='".$val['N']."' ";
    if($_POST['hero']){ if($_POST['hero']==$val['N']) echo "selected";}
    echo ">".$val['name']."(".$val['class'].")</option>";
}
echo "</select></form>";
//end player select

echo "</div>";
//2

//3
echo "<div style='width:50%;'>";

//loadform
echo "<form method='POST'>";
echo "<input type='text' name='loadcode' />";
echo "<button type='submit'>load</button>";
echo "</form>";
//end loadform

echo "</div>";
//end 3

//4
echo "<div>";

echo "</div>";
//4

echo "</div>";
//end 1

//5
echo "<div>";

//itemtype select
echo "Item type: <form method='POST'><select name='itype' onchange='this.form.submit()'><option value>select</option>";

    echo "<option value='0'";
    if($_POST['itype']){
        if($_POST['itype']==0) echo ' selected';
    }
    echo '>';
    echo 'magic</option>';
    echo '<option value="1"';
    if($_POST['itype']){
        if($_POST['itype']==1) echo ' selected';
    }
    echo '>';
    echo 'weapon</option>';
    echo '<option value="2"';
    if($_POST['itype']){
        if($_POST['itype']==2) echo ' selected';
    }
    echo '>';
    echo 'body</option>';
    echo '<option value="3"';
    if($_POST['itype']){
        if($_POST['itype']==3) echo ' selected';
    }
    echo '>';
    echo 'head</option>';
    echo '<option value="4"';
    if($_POST['itype']){
        if($_POST['itype']==4) echo ' selected';
    }
    echo '>';
    echo 'wings</option>';
    echo '<option value="5"';
    if($_POST['itype']){
        if($_POST['itype']==5) echo ' selected';
    }
    echo '>';
    echo 'accesory</option>';
    echo '<option value="7"';
    if($_POST['itype']){
        if($_POST['itype']==7) echo 'selected';
    }
    echo '>';
    echo 'material</option>';
    echo "<input type='hidden' name='hero' value='".$_POST['hero']."' />";


echo '</select>';
save_build();
echo '</form>';
//end itemtype select

echo '</div>';
//5

//6
echo "<div>";

    $items = $link->query("Select * from items where type =".$_POST['itype'].";");

//Item select
echo "Item: <form id='second' method='POST'><select name='item' onchange='this.form.submit()'><option value>select</option>";
$once = 0;
if($_POST['itemtype']){

    $ll = preg_split("/-/", $_POST['itemtype']);
    $_POST['item'] = $ll[0];
    $_POST['itype'] = $ll[1];

}
if($_POST['itype']!=7){
foreach($items as $val){
    if($val['tier']!=0){
        if($tier<$val['tier']) echo "</optgroup><optgroup label='Tier ".$val['tier']."'>";
        echo '<option value='.$val['N'];
        echo ">";
        echo $val['name'].'</option>';
        $tier=$val['tier'];
    }elseif($_POST['isDrop']){
        if($once==0){
            echo "<optgroup label='Drops'>";
            $once++;
        }
        echo '<option value='.$val['N'];
        echo ">";
        echo $val['name'];
        echo "</option>";
    }
}
if($_POST['isDrop']and($once==1)) echo "</optgroup>";
}else{
    foreach($materials as $val){
        echo '<option value='.$val['N'];
        echo ">".$val['name']."</option>";
}
}
echo '<input type="hidden" name="itype" value='.$_POST['itype'].' />';
echo "<input type='hidden' name='hero' value='".$_POST['hero']."' />";
save_build();
echo '</select></form>';
//end item select

//see drops checkbox
if($_POST['itype']<6){
    echo "See Drops ";
    if($_POST['isDrop']){echo "<input form='second' type='checkbox' onchange='this.form.submit()' name = 'isDrop' checked /><br>";}else{echo "<input form='second' type='checkbox' onchange='this.form.submit()' name = 'isDrop' /><br>";}
}
//end see drops checkbox

echo "</div>";
//6

//7
echo "<div style='display:flex;'>";

//8
echo "<div style='width:50%;'>";
if($_POST['itype']!=7){

// special items
echo "<form method='POST'>";
echo '<input type="hidden" name="itype" value='.$_POST['itype'].' />';
echo "<input type='hidden' name='hero' value='".$_POST['hero']."' />";
echo "<input type='hidden' name='isDrop' value='".$_POST['isDrop']."' />";
save_build();
echo "Special items: ";
foreach($items as $val){
    foreach(preg_split("/[\s,]+/", $val['spec']) as $sep_heroes){
        if($_POST['hero']==$sep_heroes){
            echo "<button name='item' value=".$val['N'].">".$val['name']."</button>";
        }
    }
}

echo "</form>";
// end special items
$tier=0;
//recommended items

echo "<form method='POST'>";
echo '<input type="hidden" name="itype" value='.$_POST['itype'].' />';
echo "<input type='hidden' name='hero' value='".$_POST['hero']."' />";

save_build();
echo "<br>Recommended: <select name='item' onchange='this.form.submit()'><option value>select</option>";
foreach($hero as $h){
    if($h['N']==$_POST['hero']){
    foreach($items as $val){
        if(($_POST['itype']!=7)and($tier<$val['tier'])) echo "</optgroup><optgroup label='Tier ".$val['tier']."'>";
        $tier=$val['tier'];
        if(($h['Battletype']==1)or($h['Battletype']==8)){
             if(($val['Battletype']==1)or($val['Battletype']==7)or($val['Battletype']==8)or($val['Battletype']==4)){
                echo "<option value='".$val['N']."'>".$val['name']."</option>";
            }
        }elseif(($h['Battletype']==2)or($h['Battletype']==9)){
             if(($val['Battletype']==2)or($val['Battletype']==7)or($val['Battletype']==9)or($val['Battletype']==4)){
                echo "<option value='".$val['N']."'>".$val['name']."</option>";
            }
        }elseif(($h['Battletype']==3)or($h['Battletype']==11)){
             if(($val['Battletype']==3)or($val['Battletype']==7)or($val['Battletype']==11)){
                echo "<option value='".$val['N']."'>".$val['name']."</option>";
            }
        }elseif($h['Battletype']==10){
             if(($val['Battletype']==1)or($val['Battletype']==7)or($val['Battletype']==10)or($val['Battletype']==5)){
                echo "<option value='".$val['N']."'>".$val['name']."</option>";
            }
        }elseif($h['Battletype']==12){
             if(($val['Battletype']==2)or($val['Battletype']==7)or($val['Battletype']==12)or($val['Battletype']==6)){
                echo "<option value='".$val['N']."'>".$val['name']."</option>";
            }
        }
    }
}
}
echo "</select>";
echo "</form>";
}
//end recommended items

echo "</div>";
//8
$items = $link->query("Select * from items;");
//9
echo "<div style='width:50%;height:96px;'>";

//111111111111111111 save build to post 111111111111111111111111

echo "magic: ";
foreach($items as $val){
    if($_POST['magic']==$val['N']) {
        echo $val['name']. " <button type='submit' form='second' name='item' value='".$val['N']."'>craft</button>";
    }
}
echo "<br>";
echo "weapon: ";
foreach($items as $val){
    if($_POST['weapon']==$val['N']) {
        echo $val['name']. " <button type='submit' form='second' name='item' value='".$val['N']."'>craft</button>";
    }
}
echo "<br>";
echo "body: ";
foreach($items as $val){
    if($_POST['body']==$val['N']) {
        echo $val['name']. " <button type='submit' form='second' name='item' value='".$val['N']."'>craft</button>";
    }
}
echo "<br>";
echo "head: ";
foreach($items as $val){
    if($_POST['head']==$val['N']) {
        echo $val['name']. " <button type='submit' form='second' name='item' value='".$val['N']."'>craft</button>";
    }
}
echo "<br>";
echo "wings: ";
foreach($items as $val){
    if($_POST['wings']==$val['N']) {
        echo $val['name']. " <button type='submit' form='second' name='item' value='".$val['N']."'>craft</button>";
    }
}
echo "<br>";
echo "accessory: ";
foreach($items as $val){
    if($_POST['accessory']==$val['N']) {
        echo $val['name']. " <button type='submit' form='second' name='item' value='".$val['N']."'>craft</button>";
    }
}
//11111111111111111111 save build to post end 11111111111111111111111

if($_POST['magic'] and $_POST['weapon'] and $_POST['body'] and $_POST['head'] and $_POST['wings'] and $_POST['accessory']){

//save build to code
echo "<form method='POST'>";
echo '<input type="hidden" name="itype" value='.$_POST['itype'].' />';
echo "<input type='hidden' name='hero' value='".$_POST['hero']."' />";
save_build();
echo "<button type='submit' name='saving' value='true'>save</button><br>";
echo "</form>";
if($_POST['saving']) echo "loadcode: ".$_POST['hero']."-".$_POST['magic']."-".$_POST['weapon']."-".$_POST['body']."-".$_POST['head']."-".$_POST['wings']."-".$_POST['accessory'];
//end save build to code

}
echo "</div>";
//9

echo "</div>";
//7


//10
echo "<div>";
if($_POST['itype']==7){ $itmat=$materials; }else{ $itmat=$items; }

// list of items
foreach($itmat as $val){
    if($val['N']==$_POST['item']){
        echo $val['name'];
        if(!$_POST['isDrop'] and (!($_POST['itype']==7))) echo ' (shop '.$val['tier'].')';

        echo "<form method='POST'>";
        echo '<input type="hidden" name="itype" value='.$_POST['itype'].' />';
        echo "<input type='hidden' name='hero' value='".$_POST['hero']."' />";
        save_build();
        echo "<input type='hidden' name='";
        switch($_POST['itype']){
            case 0:
                echo "magic'";
                break;
            case 1:
                echo "weapon'";
                break;
            case 2:
                echo "body'";
                break;
            case 3:
                echo "head'";
                break;
            case 4:
                echo "wings'";
                break;
            case 5:
                echo "accessory'";
                break;
        }
        echo " value='".$_POST['item']."' />";
        if($val['getM']==0) echo "<button type='submit'>add to build</button>";
        echo "</form>";
//end list of items

        if(!($_POST['itype']==7)){
            if(($val['N']==1)or($val['N']==2)or($val['N']==50)or($val['N']==78)or($val['N']==269)) echo '<br>you can switch between nachoneko and nekona shizuku using switch in town';
        }
    }
}
echo "</div><br>";
//10


//11
echo '<div>';

//using of item
echo "<form method='POST'>";
echo "<input type='hidden' name='hero' value='".$_POST['hero']."' />";
save_build();
$Sw;
if($_POST['item']==273){
            $Sw = 84;
            $_POST['itype'] = 7;
    }elseif($_POST['item']==274){
            $Sw = 85;
            $_POST['itype'] = 7;
    }elseif($_POST['item']==275){
            $Sw = 116;
            $_POST['itype'] = 7;
    }elseif($_POST['item']==229){
            $Sw = 229;
            $_POST['itype'] = 7;
    }elseif($_POST['item']==230){
            $Sw = 230;
            $_POST['itype'] = 7;
    }else{
        $Sw = $_POST['item'];
    }
echo "used in: ";
echo "<select onchange='this.form.submit()' name='itemtype'><option>select</option>";
foreach($recipes as $rec){
    $tier=0;
    if(($_POST['itype']!=7)and(($Sw==$rec['item1'])or($Sw==$rec['item2'])or($Sw==$rec['item3'])or($Sw==$rec['item4'])or($Sw==$rec['item5']))){
        
        foreach($items as $val){
            if($rec['link']==$val['N']){
                if($tier<$val['tier']) echo "</optgroup><optgroup label='Tier ".$val['tier']."'>";
                echo "<option value='".$rec['link']."-".$val['type']."'>";
                echo $val['name'];
                echo "</option>";
                $tier = $val['tier'];
            }
        }
        
    }elseif(($_POST['itype']==7)and(($Sw==$rec['mat1'])or($Sw==$rec['mat2'])or($Sw==$rec['mat3'])or($Sw==$rec['mat4'])or($Sw==$rec['mat5']))){
        
        foreach($items as $val){
            if($rec['link']==$val['N']){
                if($tier<$val['tier']) echo "</optgroup><optgroup label='Tier ".$val['tier']."'>";
                echo "<option value='".$rec['link']."-".$val['type']."'>";
                echo $val['name'];
                echo "</option>";
                $tier = $val['tier'];
            }
        }
    }
}
echo "</select>";
echo "</form>";
//end using of item


//rainbow relink
if($_POST['itype']==7){
    if($_POST['item']==84){
            $_POST['item'] = 273;
    }elseif($_POST['item']==85){
            $_POST['item'] = 274;
    }elseif($_POST['item']==116){
            $_POST['item'] = 275;  
    }
}
//end rainbow relink

if($_POST['item']) echo 'gather:<br>';

//recipes
if(($_POST['itype']!=7)or(($_POST['itype']==7)and(($_POST['item']==273)or($_POST['item']==274)or($_POST['item']==275)or($_POST['item']==229)or($_POST['item']==230)))){
foreach($recipes as $val){
    
    if($val['link']==$_POST['item']){
       
            if ($val['item1']!=0){
                foreach($items as $vall){
                    if($vall['N']==$val['item1']){ echo $vall['name']; if($vall['tier']!=0){echo "<button form='second' name='itemtype' value='".$vall[$N]."-".$vall['type']."'>check</button>";}else{echo ' ----'.$vall['getM'];} echo '<br>';}
                }
            }
            if ($val['item2']!=0){
                foreach($items as $vall){
                    if($vall['N']==$val['item2']){ echo $vall['name']; if($vall['tier']!=0){echo "<button form='second' name='itemtype' value='".$vall[$N]."-".$vall['type']."'>check</button>";}else{echo ' ----'.$vall['getM'];} echo '<br>';}
                }
            }
            if ($val['item3']!=0){
                foreach($items as $vall){
                    if($vall['N']==$val['item3']){ echo $vall['name'];  if($vall['tier']!=0){echo "<button form='second' name='itemtype' value='".$vall[$N]."-".$vall['type']."'>check</button>";}else{echo ' ----'.$vall['getM'];} echo '<br>';}
                }
            }
            if ($val['item4']!=0){
                foreach($items as $vall){
                    if($vall['N']==$val['item4']){ echo $vall['name']; if($vall['tier']!=0){echo "<button form='second' name='itemtype' value='".$vall[$N]."-".$vall['type']."'>check</button>";}else{echo ' ----'.$vall['getM'];} echo '<br>';}
                }
            }
            if ($val['item5']!=0){
                foreach($items as $vall){
                    if($vall['N']==$val['item5']){ echo $vall['name'];  if($vall['tier']!=0){echo "<button form='second' name='itemtype' value='".$vall[$N]."-".$vall['type']."'>check</button>";}else{echo ' ----'.$vall['getM'];} echo '<br>';}
                }
            }
            if ($val['mat1']!=0){
                foreach($materials as $vall){
                    if($vall['N']==$val['mat1']){ echo $vall['name']." ----".$vall['getM'];
                    switch($vall['N']){
                        case 84:
                            echo " <button form='second' name='item' value='273'>check</button>";
                            break;
                        case 85:
                            echo " <button form='second' name='item' value='274'>check</button>";
                            break;
                        case 116:
                            echo " <button form='second' name='item' value='275'>check</button>";
                            break;
                        case 229:
                            echo " <button form='second' name='item' value='229'>check</button>";
                            break;
                        case 230:
                            echo " <button form='second' name='item' value='230'>check</button>";
                            break;
                        default:
                            break;
                    }
                    echo '<br>';
                         }
                         
                }
            }
            if ($val['mat2']!=0){
                foreach($materials as $vall){
                    if($vall['N']==$val['mat2']){ echo $vall['name']." ----".$vall['getM'];
                    switch($vall['N']){
                        case 84:
                            echo " <button form='second' name='item' value='273'>check</button>";
                            break;
                        case 85:
                            echo " <button form='second' name='item' value='274'>check</button>";
                            break;
                        case 116:
                            echo " <button form='second' name='item' value='275'>check</button>";
                            break;
                        case 229:
                            echo " <button form='second' name='item' value='229'>check</button>";
                            break;
                        case 230:
                            echo " <button form='second' name='item' value='230'>check</button>";
                            break;
                        default:
                            break;
                    }
                    echo '<br>';
                         }
                        
                }
            }
                        if ($val['mat3']!=0){
                foreach($materials as $vall){
                    if($vall['N']==$val['mat3']){ echo $vall['name']." ----".$vall['getM'];
                    switch($vall['N']){
                        case 84:
                            echo " <button form='second' name='item' value='273'>check</button>";
                            break;
                        case 85:
                            echo " <button form='second' name='item' value='274'>check</button>";
                            break;
                        case 116:
                            echo " <button form='second' name='item' value='275'>check</button>";
                            break;
                        case 229:
                            echo " <button form='second' name='item' value='229'>check</button>";
                            break;
                        case 230:
                            echo " <button form='second' name='item' value='230'>check</button>";
                            break;
                        default:
                            break;
                    }
                    echo '<br>';
                    }
                }
            }
                        if ($val['mat4']!=0){
                foreach($materials as $vall){
                    if($vall['N']==$val['mat4']){ echo $vall['name']." ----".$vall['getM'];
                    switch($vall['N']){
                        case 84:
                            echo " <button form='second' name='item' value='273'>check</button>";
                            break;
                        case 85:
                            echo " <button form='second' name='item' value='274'>check</button>";
                            break;
                        case 116:
                            echo " <button form='second' name='item' value='275'>check</button>";
                            break;
                        case 229:
                            echo " <button form='second' name='item' value='229'>check</button>";
                            break;
                        case 230:
                            echo " <button form='second' name='item' value='230'>check</button>";
                            break;
                        default:
                            break;
                    }
                    echo '<br>';
                        }
                        
                        }
                }
            
                        if ($val['mat5']!=0){
                foreach($materials as $vall){
                    if($vall['N']==$val['mat5']){ echo $vall['name']." ----".$vall['getM'];
                    switch($vall['N']){
                        case 84:
                            echo " <button form='second' name='item' value='273'>check</button>";
                            break;
                        case 85:
                            echo " <button form='second' name='item' value='274'>check</button>";
                            break;
                        case 116:
                            echo " <button form='second' name='item' value='275'>check</button>";
                            break;
                        case 229:
                            echo " <button form='second' name='item' value='229'>check</button>";
                            break;
                        case 230:
                            echo " <button form='second' name='item' value='230'>check</button>";
                            break;
                        default:
                            break;
                    }
                    echo '<br>';
                        
                        }
                }
            }
            echo 'recipe<br><br>';
    }
}
}
//end recipes

//drops
if($_POST['isDrop']){
    foreach($items as $val){
        if($val['N']==$_POST['item']) echo $val['getM'];
    }
}elseif($_POST['itype']==7){
if($_POST['item']==273){
        $_POST['item'] = 84;
}elseif($_POST['item']==274){
        $_POST['item'] = 85;
}elseif($_POST['item']==275){
        $_POST['item'] = 116;  
}
    foreach($materials as $val){
        if($val['N']==$_POST['item']) echo $val['getM'];
    }
    }
    
//end drops
echo '</div>';
//11

mysqli_close($link);
?>