var numberInput = document.getElementById("numberInput");

numberInput.addEventListener("input", function() {
    var inputValue = numberInput.value;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/your-servlet-url", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            // 요청 완료 후 처리할 작업
            var responseHtml = xhr.responseText;
            document.getElementById("resultContainer").innerHTML = responseHtml;
        }
    };

    xhr.send("numberInput=" + encodeURIComponent(inputValue));
});