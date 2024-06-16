// script.js
function validateForm() {
    // Implement form validation logic here (e.g., check if check-in date is before check-out date)
    const checkIn = document.getElementById('checkIn').value;
    const checkOut = document.getElementById('checkOut').value;

    if (new Date(checkIn) >= new Date(checkOut)) {
        alert('Check-out date must be later than check-in date.');
        return false;
    }

    return true;
}

// Listen for changes in the payment method selection
document.getElementById('payment').addEventListener('change', function() {
    const paymentDetails = document.getElementById('paymentDetails');
    paymentDetails.innerHTML = '';

    // Add appropriate payment fields based on the selected payment method
    const paymentMethod = this.value;

    if (paymentMethod === 'credit_card' || paymentMethod === 'debit_card') {
        paymentDetails.innerHTML = `
            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" required>
            </div>
            <div class="form-group">
                <label for="expiryDate">Expiry Date:</label>
                <input type="month" id="expiryDate" name="expiryDate" required>
            </div>
            <div class="form-group">
                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" required>
            </div>
        `;
    } else if (paymentMethod === 'paypal') {
        paymentDetails.innerHTML = `
            <div class="form-group">
                <label for="paypalEmail">PayPal Email:</label>
                <input type="email" id="paypalEmail" name="paypalEmail" required>
            </div>
        `;
    }
});

var input =document.getElementById("checkIn")
var output =document.getElementById("checkOut")
var valuein=0;
var valueout=0;
var book = document.getElementById("sub").addEventListener("click",function(){
    document.querySelector(".bill-infon").innerText =  document.querySelector("#name").value
    document.querySelector(".bill-infoe").innerText =  document.querySelector("#email").value
    document.querySelector(".bill-infop").innerText =  document.querySelector("#phone").value
    document.querySelector(".bill-infop").innerText =  document.querySelector("#phone").value
    document.querySelector(".bill-infor").innerText =  document.querySelector("#roomType").value
    document.querySelector("#adult").innerText = counter.innerHTML;
    document.querySelector("#child").innerText = counter1.innerText;
   






   document.getElementById("datein").innerText= input.value;
    document.getElementById("dateout").innerText=output.value;
    document.querySelector(".box").style.display = "none";
    document.querySelector("#bill").style.display = "block";
    document.getElementById("sub").style.top="97%"
    document.getElementById("sub").innerText="Pay Now"
    

    
})
// var submitButton = document.getElementById("btn2");
//         submitButton.addEventListener("click", function() {
//             document.querySelector(".formDetail").style.display = "none";
//             document.querySelector(".container").style.display = "block";
//             document.querySelector("#user_name").innerText =  document.querySelector("#username").value
//             document.querySelector("#Phone").innerText =  document.querySelector("#number").value
//             document.querySelector("#emailid").innerText =  document.querySelector("#email").value
//             document.getElementById("btn2").innerText="Pay Now"

//         });


var less=document.getElementById("less")
var add=document.getElementById("add")
var counter=document.getElementById("counter")
var value=0
var adult =0
var child=0
var amount=document.getElementsByClassName("total")

less.addEventListener("click",function(){
    if(value>0){
  --value

counter.innerText=value
amount.innerText=value-1000

    }
})

add.addEventListener("click",function(){
    value++
    amount.innerText=value*1000
    counter.innerText=value


})

var less1=document.getElementById("less1")
var add1=document.getElementById("add1")
var counter1=document.getElementById("counter1")
var value1=0

less1.addEventListener("click",function(){
    if(value1>0){
--value1
adult=value1-500
counter1.innerText=value1

    }
})

add1.addEventListener("click",function(){
    value1++
    counter1.innerText=value1
    amount.innerText=value1*500


})



