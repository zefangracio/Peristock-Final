<?php
$conn = mysqli_connect("localhost", "root", "", "peri");
//$conn = mysqli_connect("20.204.70.242", "himakub", "Himakubjaya123.", "peri",3306);
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  exit();
}
$response = array();
$keyword = $_GET['keyword'];
if ($conn) {
    $sql = "SELECT * FROM `peri_master` WHERE isbn LIKE '%$keyword%' OR judul LIKE '%$keyword%' OR author LIKE '%$keyword%'";
    $result = mysqli_query($conn, $sql);
    if ($result) {
      header("content-Type:JSON");
      $i = 0;
      while ($row = mysqli_fetch_assoc($result)) {
        $response[$i]['isbn'] = $row['isbn'];
        $response[$i]['kdbrg'] = $row['kdbrg'];
        $response[$i]['judul'] = $row['judul'];
        $response[$i]['author'] = $row['author'];
        $i++;
      }
      echo json_encode(array('status' => TRUE, 'products' => $response));
      return json_encode(array('status' => TRUE, 'products' => $response));
    exit;
    }
}         