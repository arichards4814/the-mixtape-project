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

}

window.updateBackground = function (e) {

    console.log(e)
    document.getElementById('background').src = e.src
    document.getElementById('mixtape_background_url').value = e.name

}

