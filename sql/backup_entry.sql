-- MySQL dump 10.13  Distrib 5.1.63, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: labo
-- ------------------------------------------------------
-- Server version	5.1.63-0ubuntu0.11.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `entry`
--

DROP TABLE IF EXISTS `entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text,
  `body` text,
  `ctime` int(10) unsigned NOT NULL,
  `utime` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry`
--

LOCK TABLES `entry` WRITE;
/*!40000 ALTER TABLE `entry` DISABLE KEYS */;
INSERT INTO `entry` VALUES (1,'らくだよ','まだかえらんの？',1377771513,1377829898),(2,'らくより','まだかいしゃ？',1377771756,NULL),(3,'らく','おとこー',1377772958,NULL),(4,'らくだよ！','おおおおとくぉ！\r\n\r\nおいえす',1377823654,1377837790),(5,'【webgl】canvasに立方体を書き出す','  var renderer;\r\n  function initThree() {\r\n    width = document.getElementById(\'canvas-frame\').clientWidth;\r\n    height = document.getElementById(\'canvas-frame\').clientHeight;  \r\n    renderer = new THREE.WebGLRenderer({antialias: true});\r\n    renderer.setSize(width, height );\r\n    document.getElementById(\'canvas-frame\').appendChild(renderer.domElement);\r\n    renderer.setClearColorHex(0xFFFFFF, 1.0);\r\n  }\r\n   \r\n  var camera;\r\n  function initCamera() {  \r\n    camera = new THREE.PerspectiveCamera( 45 , width / height , 1 , 10000 );\r\n    camera.position.x = 100;\r\n    camera.position.y = 20;\r\n    camera.position.z = 50;\r\n    camera.up.x = 0;\r\n    camera.up.y = 0;\r\n    camera.up.z = 1;\r\n    camera.lookAt( {x:0, y:0, z:0 } );\r\n  }\r\n  var scene;\r\n  function initScene() {    \r\n    scene = new THREE.Scene();\r\n  }\r\n  var light;\r\n  function initLight() {  \r\n    light = new THREE.DirectionalLight(0xFF0000, 1.0, 0);\r\n    light.position.set( 100, 100, 200 );\r\n    scene.add(light);\r\n  }\r\n  var cube;\r\n  function initObject(){   \r\n    cube = new THREE.Mesh(\r\n         new THREE.CubeGeometry(50,50,50),                //形状の設定\r\n         new THREE.MeshLambertMaterial({color: 0xff0000}) //材質の設定\r\n    );\r\n    scene.add(cube);\r\n    cube.position.set(0,0,0);\r\n  }\r\n  function threeStart() {\r\n    initThree();\r\n    initCamera();\r\n    initScene();    \r\n    initLight();\r\n    initObject();\r\n    renderer.clear();  \r\n    renderer.render(scene, camera);\r\n  }',1377826508,1377836282),(6,'【webgl】立体と光源のテスト','    window.addEventListener(\"DOMContentLoaded\", function(){\r\n        var width  = 600;\r\n        var height = 600;\r\n        var fov    = 80;\r\n        var aspect = width / height;\r\n        var near   = 1;\r\n        var far    = 1000;\r\n\r\n        var camera = new THREE.PerspectiveCamera( fov, aspect, near, far );\r\n        camera.position.z = 500;\r\n\r\n        var scene = new THREE.Scene();\r\n\r\n        // 立方体\r\n//        var geometry = new THREE.CubeGeometry(200, 200, 200);\r\n//        var material = new THREE.MeshLambertMaterial( { color: 0x660000 } );\r\n        // 球体\r\n//        var geometry = new THREE.SphereGeometry(200);\r\n//        var material = new THREE.MeshLambertMaterial( { color: 0x00ff00 } );\r\n        // トーラス\r\n        var geometry = new THREE.TorusGeometry(150, 30, 32, 64);\r\n        var material = new THREE.MeshLambertMaterial( { color: 0x00ff00 } );\r\n\r\n        var cubeMesh = new THREE.Mesh( geometry, material);\r\n        scene.add( cubeMesh );\r\n\r\n        // 平行光源\r\n//        var directionalLight = new THREE.DirectionalLight( 0xffffff, 1 );\r\n//        directionalLight.position.z = 3;\r\n//        scene.add( directionalLight );\r\n        // 点光源\r\n        var light = new THREE.PointLight( 0xffffff, 10, 100 );\r\n        light.position.set(0,50,0);\r\n        scene.add( light );\r\n        // スポットライト\r\n//        var light = new THREE.SpotLight( 0xffffff, 10, 130, Math.PI/2, 1 );\r\n//        light.target.position = new THREE.Vector3(20,10,-60);\r\n//        light.position.set(0,10,0);\r\n//        scene.add( light );\r\n\r\n        var renderer = new THREE.WebGLRenderer();\r\n        renderer.setSize( width, height );\r\n        document.body.appendChild( renderer.domElement );\r\n        renderer.render( scene, camera );\r\n\r\n        function rendering(){\r\n            cubeMesh.rotation.x += 0.01;\r\n            cubeMesh.rotation.y += 0.01;\r\n            renderer.render( scene, camera );\r\n            setTimeout( rendering, 30 );\r\n        }\r\n        rendering();\r\n    });',1377832319,1377836193),(7,'escape','<  -->  &lt;\r\n>  -->  &gt;\r\n&  -->  &amp;\r\n\"  -->  &quot;',1377837843,1377837855);
/*!40000 ALTER TABLE `entry` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_insert_entry BEFORE INSERT ON entry FOR EACH ROW
BEGIN
  SET NEW.ctime = UNIX_TIMESTAMP(NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-30 13:54:55
