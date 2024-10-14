var slideIndex = 0;
showSlide();
function showSlide() {
    var i;
    var slides = document.getElementsByClassName('mySlides');
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = 'none';
    }
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1;
    }
    slides[slideIndex - 1].style.display = 'block';
    setTimeout(showSlide, 5000);
};

const ProductsSearch = () => {
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

$('#formLogin').submit(function (e) {
    e.preventDefault();
    var usuario = $.trim($("#field_email").val());
    var password = $.trim($("#field_password").val());
    alert(password);
});


function validateForm() {
    var name = document.forms["customerForm"]["name"].value;
    var lastname = document.forms["customerForm"]["lastname"].value;
    var phone = document.forms["customerForm"]["phone"].value;
    var email = document.forms["customerForm"]["email"].value;

    if (name == "" || lastname == "" || phone == "" || email == "") {
        alert("All fields are required");
        return false;
    }

    var phonePattern = /^[0-9]{10}$/;
    if (!phone.match(phonePattern)) {
        alert("Phone number must be 10 digits.");
        return false;
    }

    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email.match(emailPattern)) {
        alert("Please enter a valid email address.");
        return false;
    }

    return true;
}
