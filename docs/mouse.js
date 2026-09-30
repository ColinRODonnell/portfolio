let blenderlogo = document.querySelector(".blender-logo");
/*for the white button */
let blenderButton = document.querySelector("#blenderButton");

blenderButton.addEventListener("click", function() {
    blenderlogo.classList.toggle("on");
});