
var debounceTimer;
function debounce(func, delay) {
    clearTimeout(debounceTimer); // 타이머를 초기화

    debounceTimer = setTimeout(func, delay); // 일정 시간이 지난 후에 함수를 실행
};
function sendPageValueToServlet() {
    var selectedNameValue = document.getElementById('name').value;
    var selectedCheckBoxPrivacyYes = document.getElementById("privacyYes");
    var selectedAgeValue = document.getElementById("age").value;
    var prodNmValue = document.getElementById('prodNm').value;
    var mContentsValue = document.getElementById('mContents').value;
    let sentence = "";
    console.log(selectedNameValue);
    sentence += selectedCheckBoxPrivacyYes.checked ? "&selectedPrivacyYesValue=" + encodeURIComponent("O") : "";
    sentence += selectedAgeValue !== "전체" ? "&selectedAgeValue=" + encodeURIComponent(selectedAgeValue) : "";
    sentence += selectedNameValue ? "&selectedNameValue=" + encodeURIComponent(selectedNameValue) : "";
    sentence +="&selectedStartValue="+encodeURIComponent(start);
    sentence +="&selectedLastValue=" + encodeURIComponent(last);
    // AJAX 요청을 사용하여 서블릿에 값 전달

    debounce(function(){
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/VoiceNotificationServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var parser = new DOMParser();
                var responseDoc = parser.parseFromString(xhr.responseText, "text/html");
                var elementValue = responseDoc.getElementById("resultContainer").innerHTML;
// 모든 <input> 요소를 활성화
                var inputElements = document.getElementsByTagName("input");
                for (var i = 0; i < inputElements.length; i++) {
                    inputElements[i].disabled = false;
                }

// 모든 <select> 요소를 활성화
                var selectElements = document.getElementsByTagName("select");
                for (var i = 0; i < selectElements.length; i++) {
                    selectElements[i].disabled = false;
                }

                // 가져온 값으로 특정 영역 업데이트
                document.getElementById("resultContainer").innerHTML = elementValue;
                document.getElementById("prodNm").value = prodNmValue;
                document.getElementById("mContents" ).value = mContentsValue;
                document.getElementById('getName').value = selectedNameValue;
                document.getElementById("getPrivacyYes").value = selectedCheckBoxPrivacyYes.checked ? "O" : "X";
                document.getElementById("getAge").value = selectedAgeValue;

            }
        };

        // 전송할 데이터를 조합하여 한 번에 전송
        var requestData = "selectedTotalValue=" + encodeURIComponent("total")+sentence;
// 모든 <input> 요소를 비활성화
        var inputElements = document.getElementsByTagName("input");
        for (var i = 0; i < inputElements.length; i++) {
            inputElements[i].disabled = true;
        }

// 모든 <select> 요소를 비활성화
        var selectElements = document.getElementsByTagName("select");
        for (var i = 0; i < selectElements.length; i++) {
            selectElements[i].disabled = true;
        }

        xhr.send(requestData);
    },1000);

}


function sendValueToServlet() {
    var selectedNameValue = document.getElementById('name').value;
    var selectedCheckBoxPrivacyYes = document.getElementById("privacyYes");
    var selectedAgeValue = document.getElementById("age").value;
    var prodNmValue = document.getElementById('prodNm').value;
    var mContentsValue = document.getElementById('mContents').value;
    let sentence = "";
    console.log(selectedNameValue);
    sentence += selectedCheckBoxPrivacyYes.checked ? "&selectedPrivacyYesValue=" + encodeURIComponent("O") : "";
    sentence += selectedAgeValue !== "전체" ? "&selectedAgeValue=" + encodeURIComponent(selectedAgeValue) : "";
    sentence += selectedNameValue ? "&selectedNameValue=" + encodeURIComponent(selectedNameValue) : "";
    sentence +="&selectedStartValue="+encodeURIComponent("0");
    sentence +="&selectedLastValue=" + encodeURIComponent("10");

    // AJAX 요청을 사용하여 서블릿에 값 전달

    debounce(function(){
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/VoiceNotificationServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var parser = new DOMParser();
                var responseDoc = parser.parseFromString(xhr.responseText, "text/html");
                var elementValue = responseDoc.getElementById("resultContainer").innerHTML;
// 모든 <input> 요소를 활성화
                var inputElements = document.getElementsByTagName("input");
                for (var i = 0; i < inputElements.length; i++) {
                    inputElements[i].disabled = false;
                }

// 모든 <select> 요소를 활성화
                var selectElements = document.getElementsByTagName("select");
                for (var i = 0; i < selectElements.length; i++) {
                    selectElements[i].disabled = false;
                }

                // 가져온 값으로 특정 영역 업데이트
                document.getElementById("resultContainer").innerHTML = elementValue;
                document.getElementById("prodNm").value = prodNmValue;
                document.getElementById("mContents" ).value = mContentsValue;
                document.getElementById('getName').value = selectedNameValue;
                document.getElementById("getPrivacyYes").value = selectedCheckBoxPrivacyYes.checked ? "O" : "X";
                document.getElementById("getAge").value = selectedAgeValue;
                ;
            }
        };

        // 전송할 데이터를 조합하여 한 번에 전송
        var requestData = "selectedTotalValue=" + encodeURIComponent("total")+sentence;
// 모든 <input> 요소를 비활성화
        var inputElements = document.getElementsByTagName("input");
        for (var i = 0; i < inputElements.length; i++) {
            inputElements[i].disabled = true;
        }

// 모든 <select> 요소를 비활성화
        var selectElements = document.getElementsByTagName("select");
        for (var i = 0; i < selectElements.length; i++) {
            selectElements[i].disabled = true;
        }

        xhr.send(requestData);
    },1000);

}




function modifyMessage(values) {
    // 값을 읽어와서 변수에 할당
    var id = values[0];
    var custNm = values[1];
    var age = values[2];
    var address = values[3];
    var asset = values[4];
    var privacy = values[5];
    var prodNm = values[6];
    var mContents = values[7];
    console.log(values[8])
    // 각 요소에 값 설정
    document.getElementById("privacyYes").checked = privacy === "O";
    document.getElementById("age").value = age;
    document.getElementById("name").value = custNm;
    document.getElementById("prodNm").value = prodNm;
    document.getElementById("mContents" ).value = mContents;

    sendValueToServlet()
}