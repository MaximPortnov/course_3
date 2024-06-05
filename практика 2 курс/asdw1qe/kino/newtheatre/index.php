<?php
	$mysqli=new mysqli('mysql80.hostland.ru','host1857461_admin','ZHgvJTki','host1857461_kino');
	
	if ($mysqli->connect_errno) {
		echo "Не удалось подключиться к MySQL: " . mysqli_connect_error();
		return false;
	};
	$mysqli->set_charset("utf8");
	$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'POST'){
			$json = json_decode(file_get_contents('php://input'),true);
			// foreach ($json as $item) {
			// 	$name = $item['name'];
			// 	$address = $item['address'];
	
			// 	$text = "INSERT INTO `theatres`(`name`, `address`) VALUES ('$name','$address')";
			// 	$result = $mysqli->query($text);
			// }
			// echo $json[0]['name'];
			$text="INSERT INTO `theatres`(`name`, `address`) VALUES ('".$json['name']."','".$json['address']."')";
			$result=$mysqli->query($text);
			$a=array('result'=>$result);
			echo json_encode($a);
			return;
		}
?>
