var photo = document.getElementById("dom")

function switchToTree() {
  photo.src = "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/DOM-model.svg/1200px-DOM-model.svg.png";
}

function switchToBoss() {
  photo.src = "https://s-media-cache-ak0.pinimg.com/originals/b5/7f/c5/b57fc5d423d720d40eb0ea2c9a2be1a7.jpg";
}

var boss = document.getElementById("boss");
var tree = document.getElementById("tree");
boss.addEventListener("click", switchToBoss);
tree.addEventListener("click", switchToTree);
