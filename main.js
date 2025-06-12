const container = document.getElementById('game');
const scene = new THREE.Scene();
scene.background = new THREE.Color(0x222222);

const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
container.appendChild(renderer.domElement);

const gridSize = 20;
const tileSize = 1;
let direction = new THREE.Vector2(1, 0); // x, z direction
let nextDirection = direction.clone();

const snake = [];
const snakeMaterial = new THREE.MeshLambertMaterial({ color: 0x00ff00 });
const cubeGeometry = new THREE.BoxGeometry(tileSize, tileSize, tileSize);

function addSegment(x, z) {
  const cube = new THREE.Mesh(cubeGeometry, snakeMaterial);
  cube.position.set(x * tileSize, tileSize / 2, z * tileSize);
  scene.add(cube);
  snake.push({ cube, x, z });
}

addSegment(0, 0);

const fruitGeometry = new THREE.SphereGeometry(tileSize / 2, 16, 16);
const fruitMaterial = new THREE.MeshLambertMaterial({ color: 0xff0000 });
const fruit = new THREE.Mesh(fruitGeometry, fruitMaterial);
scene.add(fruit);
let fruitPos = { x: 5, z: 5 };
function placeFruit() {
  fruitPos.x = Math.floor(Math.random() * gridSize) - gridSize / 2;
  fruitPos.z = Math.floor(Math.random() * gridSize) - gridSize / 2;
  fruit.position.set(fruitPos.x * tileSize, tileSize / 2, fruitPos.z * tileSize);
}
placeFruit();

const light = new THREE.DirectionalLight(0xffffff, 1);
light.position.set(10, 20, 10);
scene.add(light);
const ambient = new THREE.AmbientLight(0x404040);
scene.add(ambient);

const planeGeometry = new THREE.PlaneGeometry(gridSize * tileSize, gridSize * tileSize);
const planeMaterial = new THREE.MeshPhongMaterial({ color: 0x333333, side: THREE.DoubleSide });
const plane = new THREE.Mesh(planeGeometry, planeMaterial);
plane.rotation.x = -Math.PI / 2;
scene.add(plane);

camera.position.set(0, 20, 20);
camera.lookAt(0, 0, 0);
window.addEventListener('resize', onWindowResize);
function onWindowResize() {
  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();
  renderer.setSize(window.innerWidth, window.innerHeight);
}

window.addEventListener('keydown', (e) => {
  switch (e.key) {
    case 'ArrowUp':
      if (direction.y !== -1) nextDirection.set(0, 1);
      break;
    case 'ArrowDown':
      if (direction.y !== 1) nextDirection.set(0, -1);
      break;
    case 'ArrowLeft':
      if (direction.x !== 1) nextDirection.set(-1, 0);
      break;
    case 'ArrowRight':
      if (direction.x !== -1) nextDirection.set(1, 0);
      break;
  }
});

let lastMove = 0;
function animate(time) {
  requestAnimationFrame(animate);
  if (time - lastMove > 200) {
    moveSnake();
    lastMove = time;
  }
  renderer.render(scene, camera);
}

function moveSnake() {
  direction.copy(nextDirection);
  const head = snake[snake.length - 1];
  let newX = head.x + direction.x;
  let newZ = head.z + direction.y;
  if (checkCollision(newX, newZ)) {
    alert('Game Over!');
    while (snake.length > 1) {
      const seg = snake.shift();
      scene.remove(seg.cube);
    }
    head.x = 0;
    head.z = 0;
    head.cube.position.set(0, tileSize / 2, 0);
    direction.set(1, 0);
    nextDirection.set(1, 0);
    placeFruit();
    return;
  }
  addSegment(newX, newZ);
  const ateFruit = newX === fruitPos.x && newZ === fruitPos.z;
  if (!ateFruit) {
    const tail = snake.shift();
    scene.remove(tail.cube);
  } else {
    placeFruit();
  }
}

function checkCollision(x, z) {
  if (x > gridSize / 2 || x < -gridSize / 2 || z > gridSize / 2 || z < -gridSize / 2) {
    return true;
  }
  for (let i = 0; i < snake.length; i++) {
    if (snake[i].x === x && snake[i].z === z) {
      return true;
    }
  }
  return false;
}

animate();
