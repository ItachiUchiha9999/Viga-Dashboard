var slideIndex=0;
showSlide();
function showSlide(){
    var i;
    var slides=document.getElementsByClassName('mySlides');
    for (i = 0; i <slides.length; i++) {
        slides[i].style.display='none';
    }
    slideIndex++;
    if (slideIndex>slides.length) {
        slideIndex=1;
    }
    slides[slideIndex-1].style.display='block';
    setTimeout(showSlide,5000);
};

const ProductsSearch = () =>{
    const searchBox = document.getElementById('search-item').value.toUpperCase();
    const productsStore = document.getElementById('product-list');
    const products = document.querySelectorAll(".product");
    const pName = productsStore.querySelectorAll("el1");
    for (var i = 0; i < pName.length; i++) {
        let match = products[i].querySelectorAll('el1')[0];
        if (match) {
            let textValue = match.textContent || match.innerHTML
            if (textValue.toUpperCase().indexOf(searchBox) > -1) {
                products[i].style.display = "";
            } else {
                products[i].style.display = "none";
            }
        }        
    }
};

$('#formLogin').submit(function(e){
    e.preventDefault();
    var usuario = $.trim($("#field_email").val());
    var password = $.trim($("#field_password").val());
    alert(password);
});
