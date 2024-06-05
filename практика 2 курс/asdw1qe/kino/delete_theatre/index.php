<?php
	$mysqli=new mysqli('mysql80.hostland.ru','host1857461_admin','ZHgvJTki','host1857461_kino');
	if ($mysqli->connect_errno) {
		echo "Не удалось подключиться к MySQL: " . mysqli_connect_error();
		return false;
	};
	$mysqli->set_charset("utf8");
	$method = $_SERVER['REQUEST_METHOD'];
		if ($method == 'DELETE'){
			$a=array();
			$json = json_decode(file_get_contents('php://input'),true);
			foreach ($json as $v){
				$text="DELETE FROM `theatres` WHERE ID=".$v['id'];
				$result=$mysqli->query($text);
				$b=array('result'=>$result);
				$a[]=$b;
			};	
			echo json_encode($a);
		  return;
		}
?>