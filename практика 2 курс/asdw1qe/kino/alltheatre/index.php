<?php
	$mysqli=new mysqli('mysql80.hostland.ru','host1857461_admin','ZHgvJTki','host1857461_kino');
	if ($mysqli->connect_errno) {
		echo "Не удалось подключиться к MySQL: " . mysqli_connect_error();
		return false;
	};
	$mysqli->set_charset("utf8");
	$method = $_SERVER['REQUEST_METHOD'];
	if ($method == 'GET'){
		$a=array();
			$text="select * from theatres";
		
			$result=$mysqli->query($text);
			while ($row = mysqli_fetch_assoc($result)){
				$b=array("name"=>$row['name'],"id"=>$row['ID']);
				$a[]=$b;
			}
			echo json_encode($a);
			return;
		}
?>
