<?php 

session_start();
if(isset($_SESSION['nom'])){
  $nom =$_SESSION['nom'];
  $role = $_SESSION['role'];

}else{
  echo '<script language="Javascript">';
    echo 'document.location.replace("./logout.php")'; 
    echo ' </script>';
}

?>

<!DOCTYPE html>

<html lang="en">

<head>

  <title>page administrateur et moderateur</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="style.css">
  <?php include 'links.php' ?>

<style>

body {font-family: "Lato", sans-serif;}

.sidebar {
  height: 100%;
  width: 180px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 16px;
}

.sidebar a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
}

.sidebar a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 180px; 
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}


.chip {
    display: inline-block;
    padding: 0 80px;
    height: 50px;
    font-size: 16px;
    line-height: 50px;
    border-radius: 25px;
    background-color: #ffc500;
}

.chip img {
    float: left;
    margin: 0 10px 0 -80px;
    height: 50px;
    width: 50px;
    border-radius: 50%;
}

</style>

</head>

<body>

  
    

     <?php
        if($role != 'Operateur' && $role != 'Superviseur'){

      ?>

  <div class="sidebar ">
  <a href="#user"><i class="fa fa-users"></i> Utilisateurs</a>
  <a href="logout.php"><i class="fa fa-sign-in" style="font-size:26px"></i> Deconnexion</a>
  </div>

    <div class="main">
    <p>

    
      <div class="chip heading text-center text-uppercase text-black mb-3">
  <img src="" alt="" width="96" height="96">
   Bienvenue : <?php echo $nom; ?> <br></br>
</div>




<center>
<div class="container">
  <div class="btn-group">
    <button type="button" class="btn btn-primary"><a href='inscrit.php' class="text-body">Enregistrer un utilisateur</a></button>
  </div>
  </div>
  </center>
  <br>
 


    <div class="row">
    <div class="col-md-10 col-md-10 offset-1">

    <table class="table table-bordered table-hovered">

    <thead>

    <tr>
    
      <td>Nom et Prenoms</td>
      <td>Email</td>
      <td>Role</td>
      <td>Date</td>
      

    </tr>

    </thead>

    <tbody>

    <?php        
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "traduction";

      $sql = "SELECT id, nom, email, role, date_enreg FROM user";
      $result_user = $conn->query($sql);
      while($row = mysqli_fetch_array($result_user)) { ?>
  
    <tr>

    <td><?php echo $row['nom'] ?></td>
    <td><?php echo $row['email'] ?></td>
    <td><?php echo $row['role'] ?></td>
    <td><?php echo $row['date_enreg'] ?></td>

    <td>
  
    <a href="inscrit.php?id=<?php echo $row['id']?>" class="btn btn-primary"> <i class="fas fa-edit" style="font-size:30px"></i></a>
    <a href="suppinscrit.php?id=<?php echo $row['id']?>" class="btn btn-primary"> <i class="far fa-trash-alt" style="font-size:30px"></i></a>    

    </td>

    </tr>

    <?php } ?>

    </tbody>

    </table>

    </div>
    </div>  

    </p>
    </div>
   
    <?php
      }elseif($role != 'Superviseur'){
    ?>
    
    <div class="sidebar ">
  <a href="#langue"><i class=" fas fa-exclamation-circle"></i> </a>
  <a href="logout.php"><i class="fa fa-sign-in" style="font-size:26px"></i> Deconnexion</a>
  </div>

    <div class="main">
    <p>


    <div class="chip heading text-center text-uppercase text-black mb-3">
  <img src="" alt="" width="96" height="96">
   Bienvenue : <?php echo $nom; ?><br></br>
</div>


<center>
<div class="container">
  <div class="btn-group">
    <button type="button" class="btn btn-primary btn-block"><a href='' class="text-body active "></a></button>
    <button type="button" class="btn btn-primary btn-block"><a href='' class="text-body active"></a></button>
    <button type="button" class="btn btn-primary btn-block"><a href='' class="text-body active"></a></button>
  </div>
  </div>
  </center>
  <br>



  

  <div class="row">
<div class="col-md-12 offset-md-0">
  <table class="table table-bordered table-hovered">
  <thead>
    <tr>
    
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
        </tr>
  </thead>
  <tbody>

    <?php  

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "traduction";

$sql = "SELECT  FROM ";
$result_ = $conn->query($sql);
while($row = mysqli_fetch_array($result_)) { ?>
  
    <tr>
  <td><?php echo $row[''] ?></td>
  <td><?php echo $row[''] ?></td>
  <td><?php echo $row[''] ?></td>
  <td><?php echo $row[''] ?></td>
  <td><?php echo $row[''] ?></td>
  <td><a href="<?php echo$row['url']?>" target="_blank" class="btn btn-primary"><i class="fas fa-external-link-square-alt"></i></a></td>
  <td><?php echo $row['dated'] ?></td>
  <td>
  
    <a href="modlangue.php?id=<?php echo $row['id']?>" class="btn btn-primary"> <i class="fas fa-edit"></i></a>

  <a href="supplangue.php?id=<?php echo $row['id']?>" class="btn btn-primary"> <i class="far fa-trash-alt"></i></a>   

    </td>
  </tr>

<?php } ?>  
  

  </tbody>
  </table>

</div>
</div>  


    </p>
    </div>

   
  <?php
      }else{
    ?>
    
 <div class="sidebar ">
  <a href="#Statistiques"><i class="fas fa-chart-bar"></i>Statistiques</a>
  <a href="logout.php"><i class="fa fa-sign-in" style="font-size:26px"></i> Deconnexion</a>
  </div>

    <div class="main">
    <p>

  <div class="chip heading text-center text-uppercase text-black mb-3">
  <img src="" alt="" width="96" height="96">
   Bienvenue : <?php echo $nom; ?> <br></br>
</div>




<div class="container">
  <div class="row">
    <div class="col-sm">
 

<div id="piechart"></div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);


function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Heure', 'Heure par jours'],
  ['christ', 8],
  ['rebecca', 2],
  ['estelle', 4],
  ['eric', 2],
  ['marcellin', 8]
]);


  var options = {'title':'Perfomance mensuelle des utilisateurs', 'width':550, 'height':400};


  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>


    </div>
    <div class="col-sm">
  

<div id="bonjour"></div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);


function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['jours', 'Heure par jours'],
  ['Lundi', 8],
  ['Mardi', 2],
  ['Mercredi', 4],
  ['Jeudi', 2],
  ['Vendredi', 8],
  ['Samedi', 8],
  ['Dimanche', 8]
]);


  var options = {'title':'Visite sur le site cette semaine', 'width':550, 'height':400};


  var chart = new google.visualization.PieChart(document.getElementById('bonjour'));
  chart.draw(data, options);
}
</script>

    </div>

  </div>
</div>



   </p>
    </div>

     <?php
       }
    ?> 
</body>
</html> 
