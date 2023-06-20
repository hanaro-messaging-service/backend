var debounceTimer;
function debounce(func, delay) {
    clearTimeout(debounceTimer); // 타이머를 초기화

    debounceTimer = setTimeout(func, delay); // 일정 시간이 지난 후에 함수를 실행
};
function sendValueToServlet() {
    var selectedNameValue = document.getElementById('name').value;
    var selectedAppValue = document.getElementById("app").value;
    var selectedAssetValue = document.getElementById("asset").value;
    var selectedCheckBoxManValue = document.getElementById("man");
    var selectedCheckBoxWomanValue = document.getElementById("woman");
    var selectedCheckBoxPrivacyYes = document.getElementById("privacyYes");
    var selectedCheckBoxPrivacyNo = document.getElementById("privacyNo");
    var selectedJobValue = document.getElementById("job").value;
    var selectedPrivateValue = document.getElementById("private").value;
    var selectedAgeValue = document.getElementById("age").value;
    var selectedAgePartValue = document.getElementById("agepart").value;
    var selectedPeriodValue = document.getElementById('period').value;
    var selectedCheckBoxMoneyExpYes = document.getElementById('moneyExpYes');
    var selectedCheckBoxMoneyExpNo = document.getElementById('moneyExpNo');
    let sentence = "";
    console.log(selectedNameValue);
    sentence += selectedCheckBoxManValue.checked ? "&selectedManValue=" + encodeURIComponent("M") : "";
    sentence += selectedCheckBoxWomanValue.checked ? "&selectedWomanValue="+ encodeURIComponent("F") : "";
    sentence += selectedCheckBoxPrivacyYes.checked ? "&selectedPrivacyYesValue=" + encodeURIComponent("Y") : "";
    sentence += selectedCheckBoxPrivacyNo.checked ? "&selectedPrivacyNoValue=" + encodeURIComponent("N") : "";
    sentence += selectedJobValue !== "전체" ? "&selectedJobValue=" + encodeURIComponent(selectedJobValue) : "";
    sentence += selectedPrivateValue !=="전체" ? "&selectedPrivateValue=" + encodeURIComponent(selectedPrivateValue) : "";
    sentence += selectedAgeValue !== "전체" ? "&selectedAgeValue=" + encodeURIComponent(selectedAgeValue) : "";
    sentence += selectedAgePartValue !== "전체"? "&selectedAgePartValue=" + encodeURIComponent(selectedAgePartValue) : "";
    sentence += selectedPeriodValue !== "전체"? "&selectedPeriodValue=" + encodeURIComponent(selectedPeriodValue) : "";
    sentence += selectedCheckBoxMoneyExpYes.checked ? "&selectedMoneyExpYesValue=" + encodeURIComponent("Y") : "";
    sentence += selectedCheckBoxMoneyExpNo.checked? "&selectedMoneyExpNoValue=" + encodeURIComponent("N") : "";
    sentence += selectedNameValue ? "&selectedNameValue=" + encodeURIComponent(selectedNameValue) : "";
    console.log(sentence)
    if (selectedAppValue === "") {
        selectedAppValue = "전체";
    }
    if (selectedAssetValue === "") {
        selectedAssetValue = "전체";
    }


    // AJAX 요청을 사용하여 서블릿에 값 전달

    debounce(function(){
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/annoMapping", true);
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
            }
        };

        // 전송할 데이터를 조합하여 한 번에 전송
        var requestData = "selectedAppValue=" + encodeURIComponent(selectedAppValue) +
            "&selectedAssetValue=" + encodeURIComponent(selectedAssetValue) +
            sentence;
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