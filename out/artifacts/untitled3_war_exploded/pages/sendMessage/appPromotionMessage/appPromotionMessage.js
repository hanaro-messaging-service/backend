
var debounceTimer;
function debounce(func, delay) {
    clearTimeout(debounceTimer); // 타이머를 초기화

    debounceTimer = setTimeout(func, delay); // 일정 시간이 지난 후에 함수를 실행
};
function sendPageValueToServlet(start,last,page) {
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
    sentence +="&selectedStartValue="+encodeURIComponent(start);
    sentence +="&selectedLastValue=" + encodeURIComponent(last);
    sentence +="&totalPages=" +  document.getElementById('totalCount').value;
    // AJAX 요청을 사용하여 서블릿에 값 전달

    debounce(function(){
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/productPromotionServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var parser = new DOMParser();
                var responseDoc = parser.parseFromString(xhr.responseText, "text/html");
                var elementValue = responseDoc.getElementById("resultContainer").innerHTML;
                var totalPages = Math.ceil(responseDoc.getElementById("totalCount").value/10);
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
                document.getElementById("getApp").value = selectedAppValue ;
                document.getElementById("getAsset").value = selectedAssetValue ;
                document.getElementById("getMan").value =  selectedCheckBoxManValue.checked ? "M" : "N";
                document.getElementById("getWoman").value = selectedCheckBoxWomanValue.checked ? "F" : "N";
                document.getElementById("getPrivacyYes").value = selectedCheckBoxPrivacyYes.checked ? "O" : "X";
                document.getElementById("getJob").value = selectedJobValue;
                document.getElementById("getPrivate").value = selectedPrivateValue;
                document.getElementById("getAge").value = selectedAgeValue;
                document.getElementById('getPeriod').value = selectedPeriodValue ;
                const element = document.querySelector(".pagination ul");

                console.log(page);
                //calling function with passing parameters and adding inside element which is ul tag
                element.innerHTML = createPagination(totalPages, page);
                function createPagination(totalPages=20, page){
                    let liTag = '';
                    let active;
                    let beforePage = page - 1;
                    let afterPage = page + 1;
                    if(page > 1){ //show the next button if the page value is greater than 1
                        liTag += `<li class="btn prev" onclick="createPagination(${totalPages}, ${page - 1})"><span><i class="fas fa-angle-left"></i> Prev</span></li>`;
                    }

                    if(page > 2){ //if page value is less than 2 then add 1 after the previous button
                        if(totalPages>10) {
                            liTag += `<li class="first numb" onclick="createPagination(${totalPages}, 1)"><span>1</span></li>`;
                        }
                        if(page > 3){ //if page value is greater than 3 then add this (...) after the first li or page
                            liTag += `<li class="dots"><span>...</span></li>`;
                        }
                    }

                    // how many pages or li show before the current li
                    if (page == totalPages) {
                        beforePage = beforePage - 2;
                    } else if (page == totalPages - 1) {
                        beforePage = beforePage - 1;
                    }
                    // how many pages or li show after the current li
                    if (page == 1) {
                        afterPage = afterPage + 2; //1,  0,4
                    } else if (page == 2) {
                        afterPage  = afterPage + 1;
                    }

                    for (var plength = beforePage; plength <= afterPage; plength++) {
                        if (plength > totalPages) { //if plength is greater than totalPage length then continue
                            continue;
                        }
                        if (plength == 0) { //if plength is 0 than add +1 in plength value
                            plength = plength + 1;
                        }
                        if(page == plength){ //if page is equal to plength than assign active string in the active variable
                            active = "active";
                        }else{ //else leave empty to the active variable
                            active = "";
                        }
                        if(plength>0)
                            liTag += `<li class="numb ${active}" onclick="createPagination(${totalPages}, ${plength})"><span>${plength}</span></li>`;
                    }

                    if(page < totalPages - 1){ //if page value is less than totalPage value by -1 then show the last li or page
                        if(page < totalPages - 2){ //if page value is less than totalPage value by -2 then add this (...) before the last li or page
                            // liTag += `<li class="dots"><span>...</span></li>`;
                            // liTag += `<li class="last numb" onclick="createPagination(${totalPages}, ${totalPages})"><span>${totalPages}</span></li>`;
                        }
                        if(totalPages > 10) {

                        }

                    }

                    if (page < totalPages) { //show the next button if the page value is less than totalPage(20)

                        liTag += `<li class="btn next" onclick="createPagination(${totalPages}, ${page + 1})"><span>Next <i class="fas fa-angle-right"></i></span></li>`;
                    }
                    element.innerHTML = liTag; //add li tag inside ul tag
                    return liTag; //reurn the li tag
                }
                hideLoadingOverlay();
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
    sentence +="&selectedStartValue="+encodeURIComponent("0");
    sentence +="&selectedLastValue=" + encodeURIComponent("10");

    // AJAX 요청을 사용하여 서블릿에 값 전달

    debounce(function(){
        showLoadingOverlay();
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/appPromotionServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var parser = new DOMParser();
                var responseDoc = parser.parseFromString(xhr.responseText, "text/html");
                var elementValue = responseDoc.getElementById("resultContainer").innerHTML;
                var totalPages = Math.ceil(responseDoc.getElementById("totalCount").value/10);
// 모든 <input> 요소를 활성화
                hideLoadingOverlay();
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
                document.getElementById("getApp").value = selectedAppValue ;
                document.getElementById("getAsset").value = selectedAssetValue ;
                document.getElementById("getMan").value =  selectedCheckBoxManValue.checked ? "M" : "N";
                document.getElementById("getWoman").value = selectedCheckBoxWomanValue.checked ? "F" : "N";
                document.getElementById("getPrivacyYes").value = selectedCheckBoxPrivacyYes.checked ? "O" : "X";
                document.getElementById("getJob").value = selectedJobValue;
                document.getElementById("getPrivate").value = selectedPrivateValue;
                document.getElementById("getAge").value = selectedAgeValue;
                document.getElementById('getPeriod').value = selectedPeriodValue ;
                const element = document.querySelector(".pagination ul");

                let page = 1;
                console.log(page);
                //calling function with passing parameters and adding inside element which is ul tag
                element.innerHTML = createPagination(totalPages, page);
                function createPagination(totalPages, page){
                    let liTag = '';
                    let active;
                    let beforePage = page - 1;
                    let afterPage = page + 1;
                    if(page > 1){ //show the next button if the page value is greater than 1
                        liTag += `<li class="btn prev" onclick="createPagination(${totalPages}, ${page - 1})"><span><i class="fas fa-angle-left"></i> Prev</span></li>`;
                    }

                    if(page > 2){ //if page value is less than 2 then add 1 after the previous button
                        if(totalPages>10) {
                            liTag += `<li class="first numb" onclick="createPagination(${totalPages}, 1)"><span>1</span></li>`;
                        }
                        // liTag += `<li class="first numb" onclick="createPagination(${totalPages}, 1)"><span>1</span></li>`;
                        if(page > 3){ //if page value is greater than 3 then add this (...) after the first li or page
                            liTag += `<li class="dots"><span>...</span></li>`;
                        }
                    }

                    // how many pages or li show before the current li
                    if (page == totalPages) {
                        beforePage = beforePage - 2;
                    } else if (page == totalPages - 1) {
                        beforePage = beforePage - 1;
                    }
                    // how many pages or li show after the current li
                    if (page == 1) {
                        afterPage = afterPage + 2;
                    } else if (page == 2) {
                        afterPage  = afterPage + 1;
                    }

                    for (var plength = beforePage; plength <= afterPage; plength++) {
                        if (plength > totalPages) { //if plength is greater than totalPage length then continue
                            continue;
                        }
                        if (plength == 0) { //if plength is 0 than add +1 in plength value
                            plength = plength + 1;
                        }
                        if(page == plength){ //if page is equal to plength than assign active string in the active variable
                            active = "active";
                        }else{ //else leave empty to the active variable
                            active = "";
                        }
                        if(plength>0)
                            liTag += `<li class="numb ${active}" onclick="createPagination(${totalPages}, ${plength})"><span>${plength}</span></li>`;
                    }

                    if(page < totalPages - 1){ //if page value is less than totalPage value by -1 then show the last li or page
                        if(page < totalPages - 2){ //if page value is less than totalPage value by -2 then add this (...) before the last li or page
                            // liTag += `<li class="dots"><span>...</span></li>`;
                            // liTag += `<li class="last numb" onclick="createPagination(${totalPages}, ${totalPages})"><span>${totalPages}</span></li>`;
                        }
                        if(totalPages>10) {

                        }

                    }

                    if (page < totalPages) { //show the next button if the page value is less than totalPage(20)
                        liTag += `<li class="btn next" onclick="createPagination(${totalPages}, ${page + 1})"><span>Next <i class="fas fa-angle-right"></i></span></li>`;
                    }
                    element.innerHTML = liTag; //add li tag inside ul tag
                    return liTag; //reurn the li tag
                }
            }
        }

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
function createPagination(totalPages=20, page){
    const element = document.querySelector(".pagination ul");
    showLoadingOverlay();
    element.innerHTML='로딩 중입니다.';
    let liTag = '';
    let active;
    let beforePage = page - 1;
    let afterPage = page + 1;
    if(page > 1){ //show the next button if the page value is greater than 1
        liTag += `<li class="btn prev" onclick="createPagination(totalPages, ${page - 1})"><span><i class="fas fa-angle-left"></i> Prev</span></li>`;
    }

    if(page > 2){ //if page value is less than 2 then add 1 after the previous button
        // liTag += `<li class="first numb" onclick="createPagination(${totalPages}, 1)"><span>1</span></li>`;
        if(page > 3){ //if page value is greater than 3 then add this (...) after the first li or page
            liTag += `<li class="dots"><span>...</span></li>`;
        }
    }

    // how many pages or li show before the current li
    if (page == totalPages) {
        beforePage = beforePage - 2;
    } else if (page == totalPages - 1) {
        beforePage = beforePage - 1;
    }
    // how many pages or li show after the current li
    if (page == 1) {
        afterPage = afterPage + 2;
    } else if (page == 2) {
        afterPage  = afterPage + 1;
    }

    for (var plength = beforePage; plength <= afterPage; plength++) {
        if (plength > totalPages) { //if plength is greater than totalPage length then continue
            continue;
        }
        if (plength == 0) { //if plength is 0 than add +1 in plength value
            plength = plength + 1;
        }
        if(page == plength){ //if page is equal to plength than assign active string in the active variable
            active = "active";
        }else{ //else leave empty to the active variable
            active = "";
        }
        if(plength>0)
            liTag += `<li class="numb ${active}" onclick="createPagination(${totalPages}, ${plength})"><span>${plength}</span></li>`;
    }

    if(page < totalPages - 1){ //if page value is less than totalPage value by -1 then show the last li or page
        if(page < totalPages - 2){ //if page value is less than totalPage value by -2 then add this (...) before the last li or page
            // liTag += `<li class="dots"><span>...</span></li>`;
        }
        // liTag += `<li class="last numb" onclick="createPagination(totalPages, ${totalPages})"><span>${totalPages}</span></li>`;
    }

    if (page < totalPages) { //show the next button if the page value is less than totalPage(20)

        liTag += `<li class="btn next" onclick="createPagination(totalPages, ${page + 1})"><span>Next <i class="fas fa-angle-right"></i></span></li>`;
    }
    // element.innerHTML = liTag;
    sendPageValueToServlet((page-1)*10,10,page)
    // return liTag;
}
function showLoadingOverlay() {
    var loadingOverlay = document.getElementById('loading-overlay');
    loadingOverlay.style.display = 'flex';
}

// 로딩창 숨기기
function hideLoadingOverlay() {
    var loadingOverlay = document.getElementById('loading-overlay');
    loadingOverlay.style.display = 'none';
}

function validateForm() {
    var title = document.querySelector('input[name="prodNm"]');
    var content = document.querySelector('textarea[name="mContents"]');
    if (title.value.trim() === '') {
        setTimeout(function() {
            alert('메시지 제목을 입력해주세요.'); // 작은 알림창 표시
            title.focus(); // 포커스를 제목 필드로 이동
        }, 0);
        return false; // 폼 제출을 막음
    }
    if (content.value.trim() === '') {
        setTimeout(function() {
            alert('메시지 내용을 입력해주세요.'); // 작은 알림창 표시
            content.focus(); // 포커스를 내용 필드로 이동
        }, 0);
        return false; // 폼 제출을 막음
    }
    if (title.value.length > 10) {
        setTimeout(function() {
            alert('메시지 제목은 10자 이하여야 합니다.'); // 작은 알림창 표시
            title.focus(); // 포커스를 내용 필드로 이동
        }, 0);
        return false; // 폼 제출을 막음
    }
    if (content.value.length > 700) {
        setTimeout(function() {
            alert('메시지 내용은 700자 이하여야 합니다.'); // 작은 알림창 표시
            content.focus(); // 포커스를 내용 필드로 이동
        }, 0);
        return false; // 폼 제출을 막음
    }
    console.log('폼이 유효합니다. 저장 버튼 동작 수행');
    return true; // 폼 제출을 허용
}