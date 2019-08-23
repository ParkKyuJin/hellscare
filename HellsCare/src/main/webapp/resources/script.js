/*
자바스크립트 관련 파일입니다. 반드시 기능을 주석으로 함께 적어주세요!
*/

var msg_username = "아이디를 입력하세요."; 
var msg_pwd = "비밀번호를 입력하세요. ";
var msg_repwd ="비밀번호를 확인하세요.";
var msg_pwdChk="비밀번호가 일치하지 않습니다.";
var msg_name="이름을 입력하세요.";
var msg_address="주민번호 앞자리를 입력하세요.";
var msg_hp="주민번호 앞자리를 입력하세요.";
var msg_gender="이메일을 입력하세요.";
var msg_gender="이메일을 입력하세요.";
var msg_emailChk="이메일형식에 일치하지 않습니다.";
var msg_confirmId="아이디 중복확인을 해주세요.";
//회원가입 _ ID 입력란에 focus주기
function signUpFocus(){
	document.signupform.username.focus();  
}

//회원가입 _ 필수체크
//필수체크
function inputCheck(){
    //username, password, repassword, 비밀번호 일치 , 이름, 주민번호 1, 주민번호2, 
    if(!document.signupform.username.value){
        alert(msg_username); 
        document.signupform.username.focus();
        return false; 
    } else if(!document.signupform.password.value) {
        alert(msg_pwd); 
        document.signupform.password.focus();        
        return false;
    } else if(!document.signupform.repassword.value) {
        alert(msg_repwd); 
        document.signupform.repassword.focus();        
        return false;
    } else if(document.signupform.password.value != document.signupform.repassword.value){
        alert(msg_pwdChk); 
        document.signupform.repassword.value="";        
        document.signupform.repassword.focus();        
        return false;
    } else if(!document.signupform.name.value){
        alert(msg_name); 
        document.signupform.name.focus();        
        return false;
    } else if(!document.signupform.address.value) {
        alert(msg_address); 
        document.signupform.address.focus();        
        return false;
    
    } else if(!document.signupform.hp.value) {
        alert(msg_hp); 
        document.signupform.hp.focus();        
        return false;
    } else if(!document.signupform.gender.value) {
        alert(msg_gender); 
        document.signupform.gender.focus();        
        return false;
    // 이메일2 값 NULL & 직접입력 --- 
    } else if(!document.signupform.email2.value && document.signupform.email3.value==0){
        alert(msg_emailChk); 
        document.signupform.email2.focus(); 
        return false; 
    }else if(document.signupform.hidden_id.value ==0){
    	alert(msg_confirmId);
   	 	document.signupform.dupChk.focus();
   	 	return false;
    }
    //중복확인버튼 클릭하지 않는 경우
    //signupform - hiddenId : 중복확인 버튼 클릭여부 체크(0:클릭 안함,1:클릭함)
    //<input type="hidden" name="hidden_id" value="0">
}

// 회원가입_정규식 
// id
// [문자 체크]{길이체크}

function idChk(){

	var idReg = /^[A-Za-z0-9]{5,19}/;

	/*if(!idReg.test($("input[name=username]").val())) {
        alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
        document.signupform.username.value =""; 
        return;
    }
	*/
	// resultTypeb ==> boolean 형 
	var result = idReg.test(document.signupform.username.value); 
	
	if(!result){
        alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
        document.signupform.username.value =""; 
	}

}


//회원가입_중복확인 
function confirmId(){
  //아이디값  미입력 후 중복확인버튼  누른 경우
  if(!document.signupform.username.value){
      alert(msg_id); 
      document.signupform.username.focus();
      return false; 
  }
  /*
   * window.open("파일명", "윈도우명", "창속성");
   * url = "주소?속성="+ 속성값;  ->  get방식
   */
  var url="confirmId?username=" +document.signupform.username.value; //get방식으로 아이디 값 가져옴. 
  window.open(url, "confirm", "menubar=no, width=500, height=200");
  // confirmId.do 서블릿 지정-----.do가 있으면 무조건 서블릿으로 가야됨 버튼 누르는 순간 다음페이지로 가야되니까
}
function confirmIdFocus() {
	document.confirmform.username.focus();
}
//중복 확인창에서 id 입력 여부
function confirmIdcheck(){
	if(!document.confirmform.username.value){
		alert(msg_username);
		document.confirmform.username.focus();
		return false;
	}
}//end confirmIdcheck

// 회원가입_주소 입력 
function addressSearch(){ 
	new daum.Postcode({
    	oncomplete: function(data) {
    		 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address2').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('address3').focus();
    	}
	}).open();
}



//opener : window 객체의 open() 메소드로 열린새창(=중복 확인창)에서, 열어준 부모창(=회원가입창)에 접근할 때 사용
//self.close() : 메시지 없이 현재창을 닫을때 사용
//hiddenId : 중복화면 버튼 클릭시 클릭여부 체크(0: 클릭안함, 1:클릭함)
function setId(username) {
	opener.document.signupform.username.value=username;
	opener.document.signupform.hidden_id.value="1";
	self.close();
}//end setId


//회원가입_이메일입력
function selectEmailChk(){
    //직접입력인 경우-초기화하고 focus주기  
    if(document.signupform.email3.value==0){
        document.signupform.email2.value = "";
        document.signupform.email2.focus(); 
        return false; 
    // 자동입력인 경우 -selectbox의 email3을 email2에 입력 
    } else {
        document.signupform.email2.value = document.signupform.email3.value
    }
    
}
//회원가입_이메일인증 
function findId(){
	window.location="findId?email="+document.signupform.email.value;
}

