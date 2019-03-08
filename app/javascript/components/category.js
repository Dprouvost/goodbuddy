function onlyUnique(value, index, self) { 
  return self.indexOf(value) === index;
}

const buttons = document.querySelectorAll('.clickme');
buttons.forEach((button) => {
  button.addEventListener('click', () => {
    event.currentTarget.classList.toggle("goals-selected");
    
    const id = event.currentTarget.dataset.markers;
    let ids = document.getElementById("goals-input").value.split(",");
    ids.push(id);
    document.getElementById("goals-input").value = ids.join(",")
//     // recup la category name depuis eventcurrenttarget 
//     // assig 


  });
});
export { buttons };
