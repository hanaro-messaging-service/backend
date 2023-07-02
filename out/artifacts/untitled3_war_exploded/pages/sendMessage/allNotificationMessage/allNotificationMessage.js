
var debounceTimer;
function debounce(func, delay) {
    clearTimeout(debounceTimer); // 타이머를 초기화

    debounceTimer = setTimeout(func, delay); // 일정 시간이 지난 후에 함수를 실행
};

function sendPageValueToServlet(start, last,page) {

// li 요소들을 가져옴
//     var liElements = paginationContainer.getElementsByTagName("li");
//
// // li 요소들의 onclick 이벤트를 비활성화
//     for (var i = 0; i < liElements.length; i++) {
//         liElements[i].onclick = null;
//     }
    var selectedNameValue = document.getElementById('name').value;
    var selectedAgeValue = document.getElementById("age").value;
    var selectedCheckBoxPrivacyYes = document.getElementById("privacyYes");
    var selectedLocationValue = document.getElementById('location').value;
    var prodNmValue = document.getElementById('prodNm').value;
    var mContentsValue = document.getElementById('mContents').value;
    console.log("전송 대기");

    let sentence = "";
    sentence += selectedCheckBoxPrivacyYes.checked ? "&selectedPrivacyYesValue=" + encodeURIComponent("O") : "";
    sentence += selectedAgeValue !== "전체" ? "&selectedAgeValue=" + encodeURIComponent(selectedAgeValue) : "";
    sentence += selectedLocationValue ? "&selectedLocationValue=" + encodeURIComponent(selectedLocationValue) : "";
    sentence +="&selectedStartValue="+encodeURIComponent(start);
    sentence +="&selectedLastValue=" + encodeURIComponent(last);
    sentence +="&totalPages=" +  document.getElementById('totalCount').value;
    // AJAX 요청을 사용하여 서블릿에 값 전달

    debounce(function(){
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/AllNotificationServlet", true);
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
                document.getElementById("getName").value = selectedNameValue==null? null: selectedNameValue;
                document.getElementById("prodNm").value = prodNmValue;
                document.getElementById("mContents" ).value = mContentsValue;
                document.getElementById('getPrivacyYes').value = selectedCheckBoxPrivacyYes.checked ? "O" : "X";
                document.getElementById('getAge').value = selectedAgeValue;
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
        console.log("전송 완료");
    },1000);

}

function sendValueToServlet() {


// // li 요소들을 가져옴
//     var liElements = paginationContainer.getElementsByTagName("li");
//
// // li 요소들의 onclick 이벤트를 비활성화
//     for (var i = 0; i < liElements.length; i++) {
//         liElements[i].onclick = null;
//     }

    var selectedNameValue = document.getElementById('name').value;
    var selectedAgeValue = document.getElementById("age").value;
    var selectedCheckBoxPrivacyYes = document.getElementById("privacyYes");
    var selectedLocationValue = document.getElementById('location').value;
    var prodNmValue = document.getElementById('prodNm').value;
    var mContentsValue = document.getElementById('mContents').value;
    console.log(selectedNameValue);

    let sentence = "";
    console.log(selectedNameValue);

    sentence += selectedCheckBoxPrivacyYes.checked ? "&selectedPrivacyYesValue=" + encodeURIComponent("O") : "";
    sentence += selectedAgeValue !== "전체" ? "&selectedAgeValue=" + encodeURIComponent(selectedAgeValue) : "";
    sentence += selectedLocationValue ? "&selectedLocationValue=" + encodeURIComponent(selectedLocationValue) : "";
    sentence += selectedNameValue ? "&selectedNameValue=" + encodeURIComponent(selectedNameValue) : "";
    sentence +="&selectedStartValue="+encodeURIComponent("0");
    sentence +="&selectedLastValue=" + encodeURIComponent("10");
    // AJAX 요청을 사용하여 서블릿에 값 전달

    debounce(function(){
        showLoadingOverlay();
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/AllNotificationServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var parser = new DOMParser();
                var responseDoc = parser.parseFromString(xhr.responseText, "text/html");
                var elementValue = responseDoc.getElementById("resultContainer").innerHTML;
                var totalPages = Math.ceil(responseDoc.getElementById("totalCount").value/10);
// 모든 <input> 요소를 활성화
                hideLoadingOverlay()
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
                document.getElementById("getName").value = selectedNameValue==null? null: selectedNameValue;
                document.getElementById('getPrivacyYes').value = selectedCheckBoxPrivacyYes.checked ? "O" : "X";
                document.getElementById('getAge').value = selectedAgeValue;
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
        console.log("전송 완료");
    },1000);

}
// 읽어온 데이터로 페이지 형식 변환
function modifyMessage(values) {
    // 값을 읽어와서 변수에 할당
    console.log("modifyMessage");
    var id = values[0];
    var custNm = values[1];
    var age = values[2];
    var privacy = values[3];
    var location = values[4];
    var mContents = values[5];
    var prodNm = values[6];
    if(custNm == null || custNm =="null") custNm = null
    console.log(values[5])
    // 각 요소에 값 설정
    document.getElementById("privacyYes").checked = privacy === "O";
    document.getElementById("age").value = age;
    document.getElementById("name").value = custNm == null ? null : custNm;
    document.getElementById("prodNm").value = prodNm;
    document.getElementById("mContents" ).value = mContents;
    document.getElementById("location").value = location;

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
