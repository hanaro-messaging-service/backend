
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
    var selectedJobValue = document.getElementById("job").value;
    var selectedPrivateValue = document.getElementById("private").value;
    var selectedAgeValue = document.getElementById("age").value;
    var selectedPeriodValue = document.getElementById('period').value;
    console.log(selectedCheckBoxManValue);
    // var selectedLocationValue = document.getElementById('location').value;
    // var selectedBranchValue = document.getElementById('branch').value;
    let sentence = "";
    console.log(selectedNameValue);
    sentence += selectedCheckBoxManValue.checked ? "&selectedManValue=" + encodeURIComponent("M") : "";
    sentence += selectedCheckBoxWomanValue.checked ? "&selectedWomanValue="+ encodeURIComponent("F") : "";
    sentence += selectedCheckBoxPrivacyYes.checked ? "&selectedPrivacyYesValue=" + encodeURIComponent("O") : "";
    sentence += selectedJobValue !== "전체" ? "&selectedJobValue=" + encodeURIComponent(selectedJobValue) : "";
    sentence += selectedPrivateValue !=="전체" ? "&selectedPrivateValue=" + encodeURIComponent(selectedPrivateValue) : "";
    sentence += selectedAgeValue !== "전체" ? "&selectedAgeValue=" + encodeURIComponent(selectedAgeValue) : "";
    sentence += selectedPeriodValue !== "전체"? "&selectedPeriodValue=" + encodeURIComponent(selectedPeriodValue) : "";
    sentence += selectedNameValue ? "&selectedNameValue=" + encodeURIComponent(selectedNameValue) : "";
    sentence += selectedAppValue ? "&selectedAppValue=" + encodeURIComponent(selectedAppValue) : "";
    sentence += selectedAssetValue ? "&selectedAssetValue=" + encodeURIComponent(selectedAssetValue) : "";
    // sentence += selectedLocationValue ? "&selectedLocationValue=" + encodeURIComponent(selectedLocationValue) : "";
    // sentence += selectedBranchValue ? "&selectedBranchValue=" + encodeURIComponent(selectedBranchValue) : "";
    // AJAX 요청을 사용하여 서블릿에 값 전달

    debounce(function(){
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/appPromotionServlet", true);
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
function modifyMessage(custInfo) {
    // AJAX 요청을 사용하여 JSP로 데이터 전송
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/appPromotionModifyServlet', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    // 전송할 데이터를 쿼리스트링 형식으로 만듭니다.

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                window.location.href = "/pages/manageMessage/appPromotionManage/appPromotionManage.jsp?id=" + encodeURIComponent(custInfo[0]) +
                    "&custNm=" + encodeURIComponent(custInfo[1]) +
                    "&gender=" + encodeURIComponent(custInfo[2]) +
                    "&age=" + encodeURIComponent(custInfo[3]) +
                    "&job=" + encodeURIComponent(custInfo[4]) +
                    "&custGrade=" + encodeURIComponent(custInfo[5]) +
                    "&period=" + encodeURIComponent(custInfo[6]) +
                    "&asset=" + encodeURIComponent(custInfo[7]) +
                    "&privacyYes=" + encodeURIComponent(custInfo[8]) +
                    "&app=" + encodeURIComponent(custInfo[9]) +
                    "&prodNm=" + encodeURIComponent(custInfo[10]) +
                    "&mContents=" + encodeURIComponent(custInfo[11]) +
                    "&id=" + encodeURIComponent(custInfo[12]);
            } else {

            }
        }
    };
    // 데이터를 전송합니다.
    xhr.send();
    // 페이지 리디렉션

}