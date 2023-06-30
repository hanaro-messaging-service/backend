
var debounceTimer;
function debounce(func, delay) {
    clearTimeout(debounceTimer); // 타이머를 초기화

    debounceTimer = setTimeout(func, delay); // 일정 시간이 지난 후에 함수를 실행
};
function sendPageValueToServlet(start, last) {
    console.log("sendPageValueToServlet");
    var selectedNameValue = document.getElementById('name').value;
    var selectedAssetValue = document.getElementById("asset").value;
    var selectedCheckBoxManValue = document.getElementById("man");
    var selectedCheckBoxWomanValue = document.getElementById("woman");
    var selectedCheckBoxPrivacyYes = document.getElementById("privacyYes");
    var selectedCustGradeValue = document.getElementById("custGrade").value;
    var selectedAgeValue = document.getElementById("age").value;
    var selectedCreditRatingValue = document.getElementById("creditRating").value;
    var selectedCheckBoxOverdueYes = document.getElementById("overdueYes");
    var selectedCheckBoxOverdueNo = document.getElementById("overdueNo");
    var prodNmValue = document.getElementById('prodNm').value;
    var mContentsValue = document.getElementById('mContents').value;

    let sentence = "";
    console.log(selectedNameValue);
    sentence += selectedCheckBoxManValue.checked ? "&selectedManValue=" + encodeURIComponent("M") : "";
    sentence += selectedCheckBoxWomanValue.checked ? "&selectedWomanValue="+ encodeURIComponent("F") : "";

    sentence += selectedCheckBoxPrivacyYes.checked ? "&selectedPrivacyYesValue=" + encodeURIComponent("O") : "";
    sentence += selectedCustGradeValue !=="전체" ? "&selectedCustGradeValue=" + encodeURIComponent(selectedCustGradeValue) : "";
    sentence += selectedAgeValue !== "전체" ? "&selectedAgeValue=" + encodeURIComponent(selectedAgeValue) : "";
    sentence += selectedNameValue ? "&selectedNameValue=" + encodeURIComponent(selectedNameValue) : "";
    sentence += selectedAssetValue ? "&selectedAssetValue=" + encodeURIComponent(selectedAssetValue) : "";
    sentence += selectedCreditRatingValue !=="전체" ? "&selectedCreditRatingValue=" + encodeURIComponent(selectedCreditRatingValue) : "";

    sentence += selectedCheckBoxOverdueYes.checked ? "&selectedOverdueYes=" + encodeURIComponent("O") : "";
    sentence += selectedCheckBoxOverdueNo.checked ? "&selectedOverdueNo=" + encodeURIComponent("X") : "";
    sentence +="&selectedStartValue="+encodeURIComponent(start);
    sentence +="&selectedLastValue=" + encodeURIComponent(last);

    // AJAX 요청을 사용하여 서블릿에 값 전달

    debounce(function(){
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/OverdueNotificationServlet", true);
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
                document.getElementById("getMan").value =  selectedCheckBoxManValue.checked ? "M" : "N";
                document.getElementById("getWoman").value = selectedCheckBoxWomanValue.checked ? "F" : "N";
                document.getElementById("getOverdueYes").value = selectedCheckBoxOverdueYes ? "O" : "N";
                document.getElementById("getOverdueNo").value = selectedCheckBoxOverdueNo ? "X" : "N";
                document.getElementById('getPrivacyYes').value = selectedCheckBoxPrivacyYes.checked ? "O" : "X";
                document.getElementById('getAge').value = selectedAgeValue;
                document.getElementById('getAsset').value = selectedAssetValue ;
                document.getElementById("getCustGrade").value = selectedCustGradeValue;
                document.getElementById('getCreditRating').value = selectedCreditRatingValue;
                // document.getElementById('getPeriod').value = selectedPeriodValue ;
                // document.getElementById('getLocation').value =  selectedLocationValue ;
                // document.getElementById('getBranch').value = selectedBranchValue ;
                // document.getElementById("getJob").value = selectedJobValue;
                // document.getElementById("getApp").value = selectedAppValue ;
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
    var selectedAssetValue = document.getElementById("asset").value;
    var selectedCheckBoxManValue = document.getElementById("man");
    var selectedCheckBoxWomanValue = document.getElementById("woman");
    var selectedCheckBoxPrivacyYes = document.getElementById("privacyYes");
    var selectedCustGradeValue = document.getElementById("custGrade").value;
    var selectedAgeValue = document.getElementById("age").value;
    // var selectedPeriodValue = document.getElementById('period').value;
    // var selectedLocationValue = document.getElementById('location').value;
    // var selectedBranchValue = document.getElementById('branch').value;
    var selectedCreditRatingValue = document.getElementById("creditRating").value;
    var selectedCheckBoxOverdueYes = document.getElementById("overdueYes");
    var selectedCheckBoxOverdueNo = document.getElementById("overdueNo");
    var prodNmValue = document.getElementById('prodNm').value;
    var mContentsValue = document.getElementById('mContents').value;
    console.log("overdue : ", selectedCheckBoxOverdueYes);

    let sentence = "";
    console.log(selectedNameValue);
    sentence += selectedCheckBoxManValue.checked ? "&selectedManValue=" + encodeURIComponent("M") : "";
    sentence += selectedCheckBoxWomanValue.checked ? "&selectedWomanValue="+ encodeURIComponent("F") : "";

    sentence += selectedCheckBoxPrivacyYes.checked ? "&selectedPrivacyYesValue=" + encodeURIComponent("O") : "";
    sentence += selectedCustGradeValue !=="전체" ? "&selectedCustGradeValue=" + encodeURIComponent(selectedCustGradeValue) : "";
    sentence += selectedAgeValue !== "전체" ? "&selectedAgeValue=" + encodeURIComponent(selectedAgeValue) : "";
    sentence += selectedNameValue ? "&selectedNameValue=" + encodeURIComponent(selectedNameValue) : "";
    sentence += selectedAssetValue ? "&selectedAssetValue=" + encodeURIComponent(selectedAssetValue) : "";
    // sentence += selectedPeriodValue !== "전체"? "&selectedPeriodValue=" + encodeURIComponent(selectedPeriodValue) : "";
    // sentence += selectedLocationValue ? "&selectedLocationValue=" + encodeURIComponent(selectedLocationValue) : "";
    // sentence += selectedBranchValue ? "&selectedBranchValue=" + encodeURIComponent(selectedBranchValue) : "";
    sentence += selectedCreditRatingValue !=="전체" ? "&selectedCreditRatingValue=" + encodeURIComponent(selectedCreditRatingValue) : "";

    sentence += selectedCheckBoxOverdueYes.checked ? "&selectedOverdueYes=" + encodeURIComponent("O") : "";
    sentence += selectedCheckBoxOverdueNo.checked ? "&selectedOverdueNo=" + encodeURIComponent("X") : "";
    sentence +="&selectedStartValue="+encodeURIComponent("0");
    sentence +="&selectedLastValue=" + encodeURIComponent("10");

    // AJAX 요청을 사용하여 서블릿에 값 전달

    debounce(function(){
        console.log("debounce");
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/OverdueNotificationServlet", true);
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
                document.getElementById("getMan").value =  selectedCheckBoxManValue.checked ? "M" : "N";
                document.getElementById("getWoman").value = selectedCheckBoxWomanValue.checked ? "F" : "N";
                document.getElementById('getPrivacyYes').value = selectedCheckBoxPrivacyYes.checked ? "O" : "X";
                document.getElementById('getOverdueYes').value = selectedCheckBoxOverdueYes.checked ? "O" : "N";
                document.getElementById('getOverdueNo').value = selectedCheckBoxOverdueNo.checked ? "X" : "N";
                document.getElementById('getAge').value = selectedAgeValue;
                document.getElementById('getAsset').value = selectedAssetValue ;
                document.getElementById("getCustGrade").value = selectedCustGradeValue;
                document.getElementById('getCreditRating').value = selectedCreditRatingValue;
                console.log("서블릿종료");
                // document.getElementById('getPeriod').value = selectedPeriodValue ;
                // document.getElementById('getLocation').value =  selectedLocationValue ;
                // document.getElementById('getBranch').value = selectedBranchValue ;
                // document.getElementById("getJob").value = selectedJobValue;
                // document.getElementById("getApp").value = selectedAppValue ;
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
// 읽어온 데이터로 페이지 형식 변환
function modifyMessage(values) {
    // 값을 읽어와서 변수에 할당
    console.log("modifyMessage");
    var id = values[0];
    var custNm = values[1];
    var gender = values[2];
    var custGrade = values[3];
    var creditRating = values[4];
    var age = values[5];
    var subTerm = values[6];
    var asset = values[7];
    var privacy = values[8];
    var overdue = values[9];
    var mContents = values[10];
    var prodNm = values[11];
    console.log(values[10])
    // 각 요소에 값 설정
    document.getElementById("man").checked = gender[0] === "M";
    document.getElementById("woman").checked = gender[1] === "F";
    document.getElementById("privacyYes").checked = privacy === "O";
    document.getElementById("age").value = age;
    document.getElementById("custGrade").value = custGrade;
    document.getElementById("creditRating").value = creditRating;
    document.getElementById("asset").value = asset;
    document.getElementById("name").value = custNm;
    document.getElementById("overdueYes").checked = overdue[0] === "O";
    document.getElementById("overdueNo").checked = overdue[1] === "X";
    document.getElementById("prodNm").value = prodNm;
    document.getElementById("mContents" ).value = mContents;

    sendValueToServlet()
}