
<?php
include("path.php");
include ROOT_PATH . "/app/controllers/topics.php");

$posts = selectAll('posts', ['published' => 1]);
?>
