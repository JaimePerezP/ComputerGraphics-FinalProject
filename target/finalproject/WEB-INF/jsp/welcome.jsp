<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/three.js/102/three.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/dat-gui/0.7.5/dat.gui.min.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.2/TweenMax.min.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.2/TweenMax.min.js"></script>
	<script type="text/javascript"
		src="http://yourjavascript.com/507538214/objloader.js"></script>
	<script type="text/javascript"
		src="http://yourjavascript.com/210004555/orbitcontrols.js"></script>
	<script type="text/javascript">
		var scene = new THREE.Scene();

		var camera = new THREE.PerspectiveCamera(75, window.innerWidth
				/ window.innerHeight, 0.1, 1000);
		camera.position.z = 200;

		var renderer = new THREE.WebGLRenderer();
		renderer.setSize(window.innerWidth, window.innerHeight);
		document.body.appendChild(renderer.domElement);

		var controls = new THREE.OrbitControls(camera, renderer.domElement);
		controls.enableDamping = true;
		controls.dampingFactor = 0.25;
		controls.enableZoom = true;

		var keyLight = new THREE.DirectionalLight(new THREE.Color(
				'hsl(30, 100%, 75%)'), 1.0);
		keyLight.position.set(-100, 0, 100);

		var fillLight = new THREE.DirectionalLight(new THREE.Color(
				'hsl(240, 100%, 75%)'), 0.75);
		fillLight.position.set(100, 0, 100);

		var backLight = new THREE.DirectionalLight(0xffffff, 1.0);
		backLight.position.set(100, 0, -100).normalize();

		scene.add(keyLight);
		scene.add(fillLight);
		scene.add(backLight);

		var objLoader = new THREE.OBJLoader();
		objLoader
				.load(
						'${pageContext.request.contextPath}/resources/untitled.obj',
						function(object) {

							scene.add(object);
							object.position.y -= 60;

						});

		var animate = function() {
			requestAnimationFrame(animate);
			controls.update();
			renderer.render(scene, camera);
		};

		animate();
	</script>

</body>
</html>