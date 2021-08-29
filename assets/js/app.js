const btn = document.getElementById("btn-cantidad");
let input = document.getElementById("in-cantidad");
let content = document.getElementById("form-content");
let btn_create = document.getElementById("btn-confirm");

btn.addEventListener("click", () => {
  let value = input.value;

  content.innerHTML = "";
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          for (let i = 0; i < value; i++) {
            content.innerHTML = content.innerHTML +
            `<div><p class="font-weight-bold text-muted">Producto ${i+1}. </p>` +
            xhr.responseText +
            `</div>`
            ;
          }
          btn_create.classList.remove("btn-disabled");
          btn_create.disabled = false;
        } else {
          console.log('Error Code: '+ xhr.status);
          console.log('Error Message: ' + xhr.statusText);
        }
      }
    }
    xhr.open('GET', 'product.php');
    // Send the request
    xhr.send();

});