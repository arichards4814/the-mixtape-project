window.testFun = function () {
    alert('Hello World!');
}

window.updateText = function () {
    document.getElementById('message-text').innerHTML = document.getElementById('title').value

}

window.updateCassette = function (e) {

    console.log(e)
    document.getElementById('cassette').src = e.src
    document.getElementById('mixtape_cassette_url').value = e.name
    
    document.getElementById('cas-1').classList.remove("selected")
    document.getElementById('cas-2').classList.remove("selected")
    document.getElementById('cas-3').classList.remove("selected")
    document.getElementById('cas-4').classList.remove("selected")
    document.getElementById('cas-5').classList.remove("selected")
    document.getElementById('cas-6').classList.remove("selected")
    document.getElementById('cas-7').classList.remove("selected")
    document.getElementById('cas-8').classList.remove("selected")
    document.getElementById('cas-9').classList.remove("selected")
    document.getElementById('cas-10').classList.remove("selected")
    document.getElementById('cas-11').classList.remove("selected")

    e.parentNode.classList.add("selected")
}

window.updateBackground = function (e) {

    console.log(e)
    document.getElementById('background').src = e.src
    document.getElementById('mixtape_background_url').value = e.name

    document.getElementById('bac-1').classList.remove("selected")
    document.getElementById('bac-2').classList.remove("selected")
    document.getElementById('bac-3').classList.remove("selected")
    document.getElementById('bac-4').classList.remove("selected")
    document.getElementById('bac-5').classList.remove("selected")
    document.getElementById('bac-6').classList.remove("selected")
    document.getElementById('bac-7').classList.remove("selected")
    document.getElementById('bac-8').classList.remove("selected")

    e.parentNode.classList.add("selected")
}

window.closeModal = function () {
    document.getElementById('badge-modal').classList.add("invisible")
}

