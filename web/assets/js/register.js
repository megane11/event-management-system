const dropArea = document.getElementById('drop-area');
const inputFile = document.getElementById('input-file');
const imgView = document.getElementById('img-view');
const uploadImage = ()=>{
    let imgLink = URL.createObjectURL(inputFile.files[0]);
    imgView.style.backgroundImage = `url('${imgLink}')`;
    imgView.textContent = ''
}

dropArea.addEventListener("dragover", function(e) {
    e.preventDefault();
})
dropArea.addEventListener("drop", function(e) {
    e.preventDefault();
    inputFile.files = e.dataTransfer.files
    uploadImage()
})

inputFile.addEventListener('change', uploadImage)

function toggleVisibility(button){
    icon = button.children[0]
    input = button.previousElementSibling
    let array = ['far fa-eye', 'far fa-eye-slash']

    if(array.includes(icon.className)){
        if(input.type == 'password'){
            input.type = 'text'
            icon.className = 'far fa-eye-slash'
        }
        else{
            input.type = 'password'
            icon.className = 'far fa-eye'
        }
    }
}