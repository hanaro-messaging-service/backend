
var debounceTimer;
function debounce(func, delay) {
    clearTimeout(debounceTimer); // 타이머를 초기화
    debounceTimer = setTimeout(func, delay); // 일정 시간이 지난 후에 함수를 실행
};
function sendPageValueToServlet(start,last,page) {
    var selectedNameValue = document.getElementById('name').value;
    var selectedCheckBoxPrivacyYes = document.getElementById("privacyYes");
    var selectedAgeValue = document.getElementById("age").value;
    var prodNmValue = document.getElementById('prodNm').value;
    var mContentsValue = document.getElementById('mContents').value;
    let sentence = "";
    console.log(document.getElementById('totalCount').value+"totalcount");
    sentence += selectedCheckBoxPrivacyYes.checked ? "&selectedPrivacyYesValue=" + encodeURIComponent("O") : "";
    sentence += selectedAgeValue !== "전체" ? "&selectedAgeValue=" + encodeURIComponent(selectedAgeValue) : "";
    sentence += selectedNameValue ? "&selectedNameValue=" + encodeURIComponent(selectedNameValue) : "";
    sentence +="&selectedStartValue="+encodeURIComponent(start);
    sentence +="&selectedLastValue=" + encodeURIComponent(last);
    sentence +="&totalPages=" +  document.getElementById('totalCount').value;
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
                document.getElementById("getPrivacyYes").value = selectedCheckBoxPrivacyYes.checked ? "O" : "X";
                document.getElementById("getAge").value = selectedAgeValue;
                const element = document.querySelector(".pagination ul");

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
    var selectedCheckBoxPrivacyYes = document.getElementById("privacyYes");
    var selectedAgeValue = document.getElementById("age").value;
    var prodNmValue = document.getElementById('prodNm').value;
    var mContentsValue = document.getElementById('mContents').value;
    let sentence = "";
    sentence += selectedCheckBoxPrivacyYes.checked ? "&selectedPrivacyYesValue=" + encodeURIComponent("O") : "";
    sentence += selectedAgeValue !== "전체" ? "&selectedAgeValue=" + encodeURIComponent(selectedAgeValue) : "";
    sentence += selectedNameValue ? "&selectedNameValue=" + encodeURIComponent(selectedNameValue) : "";
    sentence +="&selectedStartValue="+encodeURIComponent("0");
    sentence +="&selectedLastValue=" + encodeURIComponent("10");

    // AJAX 요청을 사용하여 서블릿에 값 전달

    debounce(function(){
        showLoadingOverlay();
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/VoiceNotificationServlet", true);
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
                document.getElementById("getPrivacyYes").value = selectedCheckBoxPrivacyYes.checked ? "O" : "X";
                document.getElementById("getAge").value = selectedAgeValue;
                const element = document.querySelector(".pagination ul");

                let page = 1;
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
    // 각 요소에 값 설정
    document.getElementById("privacyYes").checked = privacy === "O";
    document.getElementById("age").value = age;
    document.getElementById("name").value = custNm;
    document.getElementById("prodNm").value = prodNm;
    document.getElementById("mContents" ).value = mContents;

    sendValueToServlet()
}
function createPagination(totalPages=20, page){
    const element = document.querySelector(".pagination ul");
    element.innerHTML='로딩 중입니다.';
    showLoadingOverlay();
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
            liTag += `<li class="dots"><span>...</span></li>`;
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
    var title = document.querySelector('input[id="prodNm"]');
    var content = document.querySelector('textarea[id="mContents"]');
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
    if (title.value.length > 20) {
        setTimeout(function() {
            alert('메시지 제목은 20자 이하여야 합니다.'); // 작은 알림창 표시
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
    return true; // 폼 제출을 허용
}