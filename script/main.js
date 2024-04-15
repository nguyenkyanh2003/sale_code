// Button Buy Ticket

var buyTickets = document.querySelectorAll('.tour-place-buy-ticket')

var modalClass = document.querySelector('.modal')

var containerClass = document.querySelector('.container')

var close1Class = document.querySelector('.container__close')
var close2Class = document.querySelector('.container__footer-button')

for(var buyTicket of buyTickets) {
    buyTicket.onclick = function() {
        modalClass.classList.add('open');
    }
}

close1Class.onclick = function() {
    modalClass.classList.remove('open')
}

close2Class.onclick = function() {
    modalClass.classList.remove('open')
}

modalClass.onclick = function() {
    modalClass.classList.remove('open')
}

containerClass.onclick = function(event) {
    event.stopPropagation();
}

// Header mobile

var headerId = document.getElementById('header')
var tabbarId = document.getElementById('mobile-tabbar')


tabbarId.onclick = function() {
    event.preventDefault()
    var isClose = headerId.clientHeight === 46;
    if(isClose) {
        headerId.style.height = 'auto'
    }
    else {
        headerId.style.height = null
    }
}