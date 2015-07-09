<?php
//Declare an array to hold my results.
$resultArray = array();
// $response = "";
$calendar_entry_startDate="";
$calendar_entry_endDate="";
$project="";
$dev_Color="";
$created="";
$ID="";
$developer_Name= "";

//Connect to the DB and let's POST cracking.
$db = mysqli_connect('localhost', 'empirest_cal', 'iloveempirestate', 'empirest_calendar');    
if($db->connect_errno > 0)
{
    //$log->lwrite('MYSQLi Connection Error: ' . $db->connect_error);        
}//Start the switch statement which will contain all the logic for the script.

        //$log->lwrite('Start user insert. firstName: ' . $_POST['name'] . ' email: ' . $_POST['email'] . ' type: ' . $_POST['type']);
 switch ($_GET['value']) {
           case 'events':
                    if (!($result = $db->prepare("CALL joinTry()")))
                    {
                        echo  $db->error;            
                    }  
                    

                    $result = $db->prepare("CALL joinTry()");

                    // if(!($result->bind_param("sss",$name,$email ,$type )))
                    // {echo  $db->error;             
                    // }   
                         
                    if (!$result->execute())
                    {
                        echo  $db->error;            
                    }  

                   $result->bind_result($ID,$calendar_entry_startDate,$calendar_entry_endDate, $dev_Color,$created,$project_Name,$developer_Name);
                        
                     while($result->fetch())
                     {
                         array_push($resultArray,  
                             array
                            (
                                    // 'ID'=>$ID,
                                    'title'=>$developer_Name." - ".$project_Name,
                                    'start' => $calendar_entry_startDate,
                                    'end'=>$calendar_entry_endDate,
                                    'color'=>$dev_Color
                                    
                                    // 'dev_Color'=>$dev_Color,
                                    // 'created'=>$created              
                             )
                         );        
                     }
               break;
               case 'devs':
                    if (!($result = $db->prepare("CALL developer_SEL()")))
                    {
                        echo  $db->error;            
                    }  
                    

                    $result = $db->prepare("CALL developer_SEL()");

                    // if(!($result->bind_param("sss",$name,$email ,$type )))
                    // {echo  $db->error;             
                    // }   
                         
                    if (!$result->execute())
                    {
                        echo  $db->error;            
                    }  

                   $result->bind_result($ID,$developer_Name,$dev_Color,$created);
                        
                     while($result->fetch())
                     {
                         array_push($resultArray,  
                             array
                            (
                                    'ID'=>$ID,
                                    'name'=>$developer_Name,
                                    'color'=>$dev_Color,
                                    'created'=>$created,
                                    
                                    // 'dev_Color'=>$dev_Color,
                                    // 'created'=>$created              
                             )
                         );        
                     }
               break;
               case 'projects':
                    if (!($result = $db->prepare("CALL projects_SEL()")))
                    {
                        echo  $db->error;            
                    }  
                    

                    $result = $db->prepare("CALL projects_SEL()");

                    // if(!($result->bind_param("sss",$name,$email ,$type )))
                    // {echo  $db->error;             
                    // }   
                         
                    if (!$result->execute())
                    {
                        echo  $db->error;            
                    }  

                   $result->bind_result($ID,$project_Name,$created);
                        
                     while($result->fetch())
                     {
                         array_push($resultArray,  
                             array
                            (
                                    
                                    'ID'=>$ID,
                                    'name'=>$project_Name,
                                    'created'=>$created,
                                    
                                    // 'dev_Color'=>$dev_Color,
                                    // 'created'=>$created              
                             )
                         );        
                     }
               break;

//--------Inserting A project------------------
     case 'project_INS':
         if (!($result = $db->prepare("CALL project_INS(?)")))
         {
             echo  $db->error;
         }
         $result = $db->prepare("CALL project_INS(?)");

         if(!($result->bind_param("s",$_GET['project_Name'])))
         {echo  $db->error;
         }
         if (!$result->execute())
         {
             echo  $db->error;
         }
            break;
//-----------Registering A User-----------------
    case 'user_INS':
        if (!($result = $db->prepare("CALL user_INS(?,?,?)")))
        {
            echo  $db->error;
        }
        $result = $db->prepare("CALL user_INS(?,?,?)");

        if(!($result->bind_param("sss",$_GET['userName'],$_GET['userEmail'],$_GET['userPassword'])))
        {echo  $db->error;
        }
        if (!$result->execute())
        {
            echo  $db->error;
        }
        break;


               case 'dev_ins':
                                   if (!($result = $db->prepare("CALL developer_INS(?,?)")))
                                   {
                                       echo  $db->error;
                                   }


                                   $result = $db->prepare("CALL developer_INS(?,?)");

                                    if(!($result->bind_param("ss",$_GET['name'],$_GET['color'] )))
                                    {echo  $db->error;
                                    }

                                   if (!$result->execute())
                                   {
                                       echo  $db->error;
                                   }

                                //  $result->bind_result($ID,$project_Name,$created);

                                  //  while($result->fetch())
                                //    {
                                   //     array_push($resultArray,
                                   //         array
                                  //         (
//
                                    //               'ID'=>$ID,
                                      //             'name'=>$project_Name,
                                       //           'created'=>$created,
//
                                                   // 'dev_Color'=>$dev_Color,
                                                   // 'created'=>$created
                                         //   )
                                       // );
                                   // }
                              break;


               case 'dev_project':
                                   if (!($result = $db->prepare("CALL dev_project_SEL(?,?)")))
                                   {
                                       echo  $db->error;
                                   }


                                   $result = $db->prepare("CALL dev_project_SEL(?,?)");

                                    if(!($result->bind_param("ss",$_GET['ID'],$_GET['project'])))
                                    {echo  $db->error;
                                    }

                                   if (!$result->execute())
                                   {
                                       echo  $db->error;
                                   }

                                  $result->bind_result($ID,$developer_Name,$dev_Color,$project_Name);

                                    while($result->fetch())
                                    {
                                        array_push($resultArray,
                                            array
                                           (

                                                   'ID'=>$ID,
                                                   'name'=>$developer_Name,
                                                   'dev_Color'=>$dev_Color,
                                                   'project_Name'=>$project_Name,


                                            )
                                        );
                                    }
                              break;
               case 'calendar_entry_INS':
                                                  if (!($result = $db->prepare("CALL calendar_entry_INS(?,?,?,?)")))
                                                  {
                                                      echo  $db->error;
                                                  }


                                                  $result = $db->prepare("CALL calendar_entry_INS(?,?,?,?)");

                                                   if(!($result->bind_param("ssss",$_GET['calendar_entry_endDate'],$_GET['calendar_entry_startDate'],$_GET['developer'],$_GET['project'])))
                                                   {echo  $db->error;
                                                   }

                                                  if (!$result->execute())
                                                  {
                                                      echo  $db->error;
                                                  }

                                                // $result->bind_result($ID,$developer_Name,$dev_Color,$project_Name);
//
                                                  // while($result->fetch())
                                                  // {
                                                   //    array_push($resultArray,
                                                   //        array
                                                   //       (
//
                                                   //               'ID'=>$ID,
                                                    //              'name'=>$developer_Name,
                                                    //              'dev_Color'=>$dev_Color,
                                                    //              'project_Name'=>$project_Name,
//
//
                                                     //      )
                                                     //  );
                                                  // }
                                             break;




     case 'user_Login_SEL':

                                             if (!($result = $db->prepare("CALL user_Login_SEL(?,?)")))
                                                 {
                                                     echo  $db->error;
                                                 }


                                                 $result = $db->prepare("CALL user_Login_SEL(?,?)");

                                                  if(!($result->bind_param("ss",$_GET['email'],$_GET['password'])))
                                                  {echo  $db->error;
                                                  }

                                                 if (!$result->execute())
                                                 {
                                                     echo  $db->error;
                                                 }

                                                $result->bind_result($ID,$user_Name,$user_Email,$user_Role,$created,$user_password);

                                                while($result->fetch())
                                                  {
                                                  $resultArray[] = array(
                                                      'ID'=>$ID,
                                                      'name'=> $user_Name,
                                                      'email'=>$user_Email,
                                                      'role'=>$user_Role,
                                                      'created'=>$created,
                                                       'password'=>$user_password
                                                  );
                                                     /* array_push($resultArray,
                                                         array
                                                        (

                                                                'ID'=>$ID,
                                                                 'name'=> $user_Name,
                                                                 'email'=>$user_Email,
                                                                 'role'=>$user_Role,
                                                                'created'=>$created,
                                                                'password'=>$user_password,


                                                          )
                                                     );*/
                                                  }
                                            break;





                                               # code...
                                               break;


     default:
               # code...
               break;
       } 

            
        //$log->lwrite('end user insert.');           
      

//$result->close();
$db->close();
//$log->lclose();    
echo json_encode($resultArray);    
?> 