
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
    var prodNmValue = document.getElementById('prodNm').value;
    var mContentsValue = document.getElementById('mContents').value;
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
                document.getElementById("prodNm").value = prodNmValue;
                document.getElementById("mContents" ).value = mContentsValue;
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
    var gender = values[2];
    var age = values[3];
    var job = values[4];
    var custGrade = values[5];
    var subTerm = values[6];
    var asset = values[7];
    var privacy = values[8];
    var recLoginDate = values[9];
    var prodNm = values[10];
    var mContents = values[11];
    console.log(values[12])
    // 각 요소에 값 설정
    document.getElementById("man").checked = gender[0] === "M";
    document.getElementById("woman").checked = gender[1] === "F";
    document.getElementById("privacyYes").checked = privacy === "O";
    document.getElementById("age").value = age;
    document.getElementById("job").value = job;
    document.getElementById("private").value = custGrade;
    document.getElementById("asset").value = asset;
    document.getElementById("app").value = recLoginDate;
    document.getElementById("period").value = subTerm;
    document.getElementById("name").value = custNm;
    document.getElementById("prodNm").value = prodNm;
    document.getElementById("mContents" ).value = mContents;

    sendValueToServlet()
}